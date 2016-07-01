package com.rns.healthplease.web.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.rns.healthplease.web.bo.api.AdminBo;
import com.rns.healthplease.web.bo.api.HPSessionManager;
import com.rns.healthplease.web.bo.api.LabBo;
import com.rns.healthplease.web.bo.api.UserBo;
import com.rns.healthplease.web.bo.domain.Appointment;
import com.rns.healthplease.web.bo.domain.Lab;
import com.rns.healthplease.web.bo.domain.LabLocation;
import com.rns.healthplease.web.bo.domain.LabTest;
import com.rns.healthplease.web.bo.domain.User;
import com.rns.healthplease.web.dao.domain.TestCategories;
import com.rns.healthplease.web.util.CommonUtils;
import com.rns.healthplease.web.util.Constants;

@Controller
public class HPAdminController implements Constants {

	private UserBo userBo;
	private LabBo labBo;
	private AdminBo adminBo;

	@Autowired(required = true)
	@Qualifier(value = "manager")
	private com.rns.healthplease.web.bo.api.HPSessionManager manager;

	public void setManager(HPSessionManager manager) {
		this.manager = manager;
	}

	public HPSessionManager getManager() {
		return manager;
	}

	public UserBo getUserBo() {
		return userBo;
	}

	@Autowired(required = true)
	@Qualifier(value = "labBo")
	public void setLabBo(LabBo labBo) {
		this.labBo = labBo;
	}

	public LabBo getLabBo() {
		return labBo;
	}

	@Autowired(required = true)
	@Qualifier(value = "userBo")
	public void setUserBo(UserBo userBo) {
		this.userBo = userBo;
	}

	public AdminBo getAdminBo() {
		return adminBo;
	}

	@Autowired(required = true)
	@Qualifier(value = "adminBo")
	public void setAdminBo(AdminBo adminBo) {
		this.adminBo = adminBo;
	}

	private void initHome(ModelMap model) {
		manager.setCurrentAppointment(null);
		adminBo.getAllAppointments(manager.getUser());
		model.addAttribute(MODEL_USER, manager.getUser());
		manager.setResult(null);
	}

	@RequestMapping(value = "/" + ADMIN_HOME_GET_URL, method = RequestMethod.GET)
	public String initAdminHome(ModelMap model) {
		initHome(model);
		model.addAttribute(MODEL_APPOINTMENTS, manager.getUser().getTodaysAppointments());
		return ADMIN_DASHBOARD_PAGE;
	}

	@RequestMapping(value = "/" + ADMIN_HOME_PENDING_APPS_URL_GET, method = RequestMethod.GET)
	public String initHomePendingPage(ModelMap model) {
		initHome(model);
		model.addAttribute(MODEL_APPOINTMENTS, manager.getUser().getPendingAppointments());
		model.addAttribute(MODEL_HEADER, PENDING_HEADER);
		return ADMIN_DASHBOARD_PAGE;
	}

	@RequestMapping(value = "/" + ADMIN_HOME_CANCELLED_URL_GET, method = RequestMethod.GET)
	public String initHomeCancelledPage(ModelMap model) {
		initHome(model);
		model.addAttribute(MODEL_APPOINTMENTS, manager.getUser().getCancelledAppointments());
		model.addAttribute(MODEL_HEADER, CANCELLED_HEADER);
		return ADMIN_DASHBOARD_PAGE;
	}

	@RequestMapping(value = "/" + ADMIN_HOME_TOTAL_URL_GET, method = RequestMethod.GET)
	public String initHomeTotalsPage(ModelMap model) {
		initHome(model);
		model.addAttribute(MODEL_APPOINTMENTS, manager.getUser().getAppointments());
		model.addAttribute(MODEL_HEADER, TOTAL_HEADER);
		return ADMIN_DASHBOARD_PAGE;
	}

	@RequestMapping(value = "/" + ADMIN_APPOINTMENTS_BETWEEN_GET_URL, method = RequestMethod.GET)
	public String initAppointmentsForDate(ModelMap model, String appointmentsTitle) {
		initHome(model);
		model.addAttribute(MODEL_APPOINTMENTS, manager.getUser().getSelectedAppointments());
		model.addAttribute(MODEL_HEADER, appointmentsTitle);
		return ADMIN_DASHBOARD_PAGE;
	}

	@RequestMapping(value = "/" + ADMIN_GET_APPOINTMENTS_FOR_DATES_POST_URL, method = RequestMethod.POST)
	public RedirectView getAppointmentsForDates(ModelMap model, String date1, String date2) {
		manager.getUser().setSelectedAppointments(adminBo.getAppointmentsBetween(CommonUtils.convertDate(date1), CommonUtils.convertDate(date2)));
		model.addAttribute(MODEL_HEADER, " From " + date1 + " To " + date2);
		return new RedirectView(ADMIN_APPOINTMENTS_BETWEEN_GET_URL);
	}

	@RequestMapping(value = "/" + ADMIN_DOWNLOAD_EXCEL_GET_URL, method = RequestMethod.GET)
	public ModelAndView downloadExcel(ModelMap model, String header) {
		List<Appointment> appointments = new ArrayList<Appointment>();
		appointments = manager.getUser().getTodaysAppointments();
		appointments = CommonUtils.getAppointmentsByType(manager, header);
		ModelAndView modelAndView = new ModelAndView(EXCEL_VIEW, MODEL_APPOINTMENTS, appointments);
		return modelAndView;
	}

	@RequestMapping(value = "/" + ADMIN_CANCEL_APPOINTMENT_POST_URL, method = RequestMethod.POST)
	public RedirectView cancelAppointment(ModelMap model, Appointment appointment) {
		appointment.setUser(manager.getUser());
		userBo.cancelAppointment(appointment);
		return new RedirectView(ADMIN_HOME_CANCELLED_URL_GET);
	}

	@RequestMapping(value = "/" + ADMIN_UPLOAD_REPORT_POST_URL, method = RequestMethod.POST)
	public RedirectView uploadReport(Appointment appointment, ModelMap model) {
		String result = "";
		if (!appointment.getReport().isEmpty()) {
			appointment.setUser(manager.getUser());
			result = labBo.uploadReport(appointment);
			manager.setResult(result);
		}
		return new RedirectView(ADMIN_HOME_TOTAL_URL_GET);
	}

	@RequestMapping(value = "/" + ADMIN_CATEGORIES_GET_URL, method = RequestMethod.GET)
	public String initCategories(ModelMap model) {
		model.addAttribute(MODEL_CATEGORIES, adminBo.getAllTestCategories());
		model.addAttribute(MODEL_RESULT, manager.getResult());
		manager.setResult(null);
		return ADMIN_CATEGORIES_PAGE;
	}

	@RequestMapping(value = "/" + ADMIN_EDIT_CATEOGORY_GET_URL, method = RequestMethod.GET)
	public String initEditCategory(ModelMap model, Integer id, String name) {
		TestCategories categories = new TestCategories();
		if (id != null) {
			categories.setId(id);
			categories.setCategoryName(name);
		}
		model.addAttribute(MODEL_CATEGORY, categories);
		model.addAttribute(MODEL_RESULT, manager.getResult());
		manager.setResult(null);
		return ADMIN_EDIT_CATEGORY_PAGE;
	}

	@RequestMapping(value = "/" + ADMIN_EDIT_CATEOGORY_POST_URL, method = RequestMethod.POST)
	public RedirectView editCategory(ModelMap model, TestCategories category) {
		manager.setResult(adminBo.editCategory(category));
		return new RedirectView(ADMIN_EDIT_CATEOGORY_GET_URL);
	}

	@RequestMapping(value = "/" + ADMIN_DELETE_CATEGORY_POST_URL, method = RequestMethod.POST)
	public RedirectView deleteCategory(ModelMap model, TestCategories category) {
		manager.setResult(adminBo.deleteCategory(category));
		return new RedirectView(ADMIN_CATEGORIES_GET_URL);
	}

	@RequestMapping(value = "/" + ADMIN_TESTS_GET_URL, method = RequestMethod.GET)
	public String initTests(ModelMap model) {
		model.addAttribute(MODEL_TESTS, userBo.getAvailableTests());
		model.addAttribute(MODEL_RESULT, manager.getResult());
		manager.setResult(null);
		return ADMIN_TESTS_PAGE;
	}

	@RequestMapping(value = "/" + ADMIN_EDIT_TEST_GET_URL, method = RequestMethod.GET)
	public String initEditTest(ModelMap model, Integer id) {
		LabTest test = new LabTest();
		if (id != null && id.intValue() != 0) {
			test.setId(id);
			test = userBo.getTestWithPackages(test);
		}
		model.addAttribute(MODEL_TEST, test);
		model.addAttribute(MODEL_CATEGORIES, adminBo.getAllTestCategories());
		model.addAttribute(MODEL_TESTS, userBo.getAvailableTests());
		model.addAttribute(MODEL_RESULT, manager.getResult());
		manager.setResult(null);
		return ADMIN_EDIT_TEST_PAGE;
	}

	@RequestMapping(value = "/" + ADMIN_EDIT_TEST_POST_URL, method = RequestMethod.POST)
	public RedirectView editTest(ModelMap model, LabTest test, String[] childTestIds) {
		populateChildTests(test,childTestIds);
		manager.setResult(adminBo.editTest(test));
		return new RedirectView(ADMIN_EDIT_TEST_GET_URL + "?id=" + test.getId());
	}

	private void populateChildTests(LabTest test, String[] childTestIds) {
		if(childTestIds == null) {
			return;
		}
		List<String> testIds = Arrays.asList(childTestIds);
		if(CollectionUtils.isEmpty(testIds)) {
			return;
		}
		List<LabTest> childTests = new ArrayList<LabTest>();
		for(String testId: childTestIds) {
			LabTest childTest = new LabTest();
			childTest.setId(Integer.valueOf(testId));
			childTests.add(childTest);
		}
		test.setChildTests(childTests);
	}
	
	@RequestMapping(value = "/" + ADMIN_DELETE_TEST_POST_URL, method = RequestMethod.POST)
	public RedirectView deleteTest(ModelMap model, LabTest test) {
		manager.setResult(adminBo.deleteTest(test));
		return new RedirectView(ADMIN_TESTS_GET_URL);
	}
	
	@RequestMapping(value = "/" + ADMIN_LABS_GET_URL, method = RequestMethod.GET)
	public String initLabs(ModelMap model) {
		model.addAttribute(MODEL_LABS, adminBo.getAllLabs());
		model.addAttribute(MODEL_RESULT, manager.getResult());
		model.addAttribute(MODEL_USERS, adminBo.getAllUsers());
		manager.setResult(null);
		return ADMIN_LABS_PAGE;
	}
	
	@RequestMapping(value = "/" + ADMIN_EDIT_LAB_POST_URL, method = RequestMethod.POST)
	public RedirectView editLab(ModelMap model, Lab lab) {
		manager.setResult(adminBo.editLab(lab));
		return new RedirectView(ADMIN_LABS_GET_URL);
	}
	
	@RequestMapping(value = "/" + ADMIN_EDIT_LAB_USERS_POST_URL, method = RequestMethod.POST)
	public RedirectView editLabUSers(ModelMap model,Lab lab,String[] userIds) {
		populateUsers(lab, userIds);
		manager.setResult(adminBo.updateLabUsers(lab));
		return new RedirectView(ADMIN_LABS_GET_URL);
	}

	private void populateUsers(Lab lab, String[] userIds) {
		if(userIds == null) {
			return;
		}
		List<String> testIds = Arrays.asList(userIds);
		if(CollectionUtils.isEmpty(testIds)) {
			return;
		}
		List<User> users = new ArrayList<User>();
		for(String emailId: userIds) {
			User user = new User();
			user.setEmail(emailId);
			users.add(user);
		}
		lab.setUsers(users);
		
	}
	
	@RequestMapping(value = "/" + ADMIN_LOCATIONS_GET_URL, method = RequestMethod.GET)
	public String initLocations(ModelMap model) {
		model.addAttribute(MODEL_LOCATIONS, userBo.getAllLocations());
		model.addAttribute(MODEL_RESULT, manager.getResult());
		manager.setResult(null);
		return ADMIN_LOCATIONS_PAGE;
	}

	@RequestMapping(value = "/" + ADMIN_EDIT_LOCATION_GET_URL, method = RequestMethod.GET)
	public String initEditLocation(ModelMap model, Integer id, String name) {
		LabLocation location = new LabLocation();
		if (id != null) {
			location.setId(id);
			location.setName(name);
		}
		model.addAttribute(MODEL_LOCATION, location);
		model.addAttribute(MODEL_RESULT, manager.getResult());
		manager.setResult(null);
		return ADMIN_EDIT_LOCATION_PAGE;
	}

	@RequestMapping(value = "/" + ADMIN_EDIT_LOCATION_POST_URL, method = RequestMethod.POST)
	public RedirectView editLocation(ModelMap model, LabLocation location) {
		manager.setResult(adminBo.editLocation(location));
		return new RedirectView(ADMIN_LOCATIONS_GET_URL);
	}

	@RequestMapping(value = "/" + ADMIN_DELETE_LOCATION_POST_URL, method = RequestMethod.POST)
	public RedirectView deleteLocation(ModelMap model, LabLocation location) {
		manager.setResult(adminBo.deleteLocation(location));
		return new RedirectView(ADMIN_LOCATIONS_GET_URL);
	}
	
	@RequestMapping(value = "/" + ADMIN_VIEW_LAB_DASHBOARD_POST_URL, method = RequestMethod.POST)
	public RedirectView gotoLabDashBoard(ModelMap model, Lab lab) {
		manager.getUser().setLab(lab);
		return new RedirectView(LAB_HOME_URL_GET);
	}
	
	@RequestMapping(value = "/" + ADMIN_LAB_DASHBOARD_GET_URL, method = RequestMethod.GET)
	public String initLabDashboards(ModelMap model) {
		model.addAttribute(MODEL_LABS, adminBo.getAllLabs());
		return ADMIN_LAB_DASHBOARD_PAGE;
	}
	
	@RequestMapping(value = "/" + ADMIN_PARAMETERS_GET_URL, method = RequestMethod.GET)
	public String initParameters(ModelMap model) {
		model.addAttribute(MODEL_PARAMETERS, adminBo.getAllTestParemeters());
		return ADMIN_PARAMETERS_PAGE;
	}

}
