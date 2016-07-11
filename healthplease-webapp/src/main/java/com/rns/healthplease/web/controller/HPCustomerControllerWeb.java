package com.rns.healthplease.web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.RedirectView;

import com.google.gson.Gson;
import com.rns.healthplease.web.bo.api.HPSessionManager;
import com.rns.healthplease.web.bo.api.LabBo;
import com.rns.healthplease.web.bo.api.UserBo;
import com.rns.healthplease.web.bo.domain.Appointment;
import com.rns.healthplease.web.bo.domain.Lab;
import com.rns.healthplease.web.bo.domain.LabLocation;
import com.rns.healthplease.web.bo.domain.LabTest;
import com.rns.healthplease.web.bo.domain.Payment;
import com.rns.healthplease.web.bo.domain.PaymentStatus;
import com.rns.healthplease.web.bo.domain.PaymentType;
import com.rns.healthplease.web.bo.domain.RequestForm;
import com.rns.healthplease.web.bo.domain.Slot;
import com.rns.healthplease.web.bo.domain.User;
import com.rns.healthplease.web.util.CommonUtils;
import com.rns.healthplease.web.util.Constants;
import com.rns.healthplease.web.util.PaymentUtils;

@Controller
public class HPCustomerControllerWeb implements Constants {

	private UserBo userBo;

	private LabBo LabBo;

	public LabBo getLabBo() {
		return LabBo;
	}

	@Autowired(required = true)
	@Qualifier(value = "labBo")
	public void setLabBo(LabBo labBo) {
		LabBo = labBo;
	}

	@Autowired(required = true)
	@Qualifier(value = "manager")
	private HPSessionManager manager;

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
	@Qualifier(value = "userBo")
	public void setUserBo(UserBo userBo) {
		this.userBo = userBo;
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String initHome(ModelMap model) {
		initializeParameters(model);
		return "index";
	}

	private void initializeParameters(ModelMap model) {
		manager.setCurrentAppointment(null);
		model.addAttribute(MODEL_TESTS, userBo.getAvailableTests());
		model.addAttribute(MODEL_LOCATIONS, userBo.getAllLocations());
		model.addAttribute(MODEL_USER, manager.getUser());
		model.addAttribute(MODEL_RESULT, manager.getResult());
		manager.setResult(null);
	}

	@RequestMapping(value = "/home.htm", method = RequestMethod.GET)
	public String initHomePage(ModelMap model) {
		initializeParameters(model);
		return "index";
	}

	@RequestMapping(value = "/getLabs", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String getLabs(String testIds, Integer locationId, String homeCollection) {
		System.out.println("Getting labs..");
		Appointment appointment = manager.getCurrentAppointment();
		List<LabTest> tests = CommonUtils.prepareTests(testIds);
		appointment.setTests(tests);
		appointment.setHomeCollection(CommonUtils.getBoolean(homeCollection));
		LabLocation location = new LabLocation();
		location.setId(locationId);
		appointment.setLocation(location);
		return new Gson().toJson(userBo.getAvailableLabs(appointment));
	}

	@RequestMapping(value = "/getDates", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String getDates(Integer labId) {
		System.out.println("Getting dates..");
		Lab lab = new Lab();
		lab.setId(labId);
		Appointment appointment = manager.getCurrentAppointment();
		appointment.setLab(lab);
		appointment.setDate(new Date());
		List<Date> blockedDates = userBo.getBlockedDates(appointment);
		List<String> dateStrings = CommonUtils.getDatesAsStrings(blockedDates);
		return new Gson().toJson(dateStrings);
	}

	@RequestMapping(value = "/getSlots", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String getSlots(Integer labId, String date) {
		System.out.println("Getting slots..");
		Lab lab = new Lab();
		lab.setId(labId);
		Appointment appointment = manager.getCurrentAppointment();
		appointment.setLab(lab);
		appointment.setDate(CommonUtils.convertDate(date));
		return new Gson().toJson(userBo.getAvailableSlots(appointment));
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public RedirectView login(ModelMap model, Appointment appointment) {
		User user = appointment.getUser();
		if (StringUtils.isEmpty(manager.getUser().getFirstName())) {
			String result = userBo.loginUser(user);
			manager.setUser(user);
			if (!RESPONSE_OK.equals(result)) {
				manager.setResult(result);
				return new RedirectView(HOME_GET_URL);
			}
			if (user.getLab() != null) {
				return new RedirectView(LAB_HOME_URL_GET);
			}
		} else {
			userBo.populateUserDetails(manager.getUser());
			user = manager.getUser();
		}
		if (manager.getCurrentAppointment().getDate() != null) {
			manager.getCurrentAppointment().setUser(user);
			manager.getCurrentAppointment().setSlot(appointment.getSlot());
			return new RedirectView(BOOK_APPOINTMENT_GET_URL);
		}
		return new RedirectView(HOME_GET_URL);
	}

	@RequestMapping(value = "/loginAjax", method = RequestMethod.POST)
	public @ResponseBody String loginAjax(ModelMap model, String username, String password, int slotId) {
		User user = new User();
		user.setEmail(username);
		user.setPassword(password);
		String result = userBo.loginUser(user);
		manager.setUser(user);
		if (!RESPONSE_OK.equals(result)) {
			return result;
		}
		if (user.isPasswordRecovery()) {
			return CHANGE_PASSWORD_URL_GET;
		}
		if (user.getLab() != null) {
			return LAB_HOME_URL_GET;
		}
		if (manager.getCurrentAppointment().getDate() != null && slotId > 0) {
			manager.getCurrentAppointment().setUser(user);
			Slot slot = new Slot();
			slot.setId(slotId);
			manager.getCurrentAppointment().setSlot(slot);
			return BOOK_APPOINTMENT_GET_URL;
		}
		return HOME_GET_URL;
	}

	@RequestMapping(value = "/forgotPassword", method = RequestMethod.POST)
	public @ResponseBody String forgotPassword(ModelMap model, String email) {
		User user = new User();
		user.setEmail(email);
		String result = userBo.forgotPassword(user);
		return result;
	}

	@RequestMapping(value = "/" + CHANGE_PASSWORD_URL_GET, method = RequestMethod.GET)
	public String initChangePassword(ModelMap model) {
		model.addAttribute(MODEL_RESULT, manager.getResult());
		model.addAttribute(MODEL_USER, manager.getUser());
		return CHANGE_PASSWORD_PAGE;
	}

	@RequestMapping(value = "/" + CHANGE_PASSWORD_URL_POST, method = RequestMethod.POST)
	public RedirectView changePassword(ModelMap model, String password) {
		manager.getUser().setPassword(password);
		String result = userBo.changePassword(manager.getUser());
		if(RESPONSE_OK.equals(result)) {
			return new RedirectView(HOME_GET_URL);
		}
		manager.setResult(result);
		return new RedirectView(CHANGE_PASSWORD_URL_GET);
	}
	
	@RequestMapping(value = "/" + CHANGE_PASSWORD_SETTINGS_URL_POST, method = RequestMethod.POST)
	public RedirectView changePasswordSettings(ModelMap model, String password) {
		manager.getUser().setPassword(password);
		String result = userBo.changePassword(manager.getUser());
		manager.setResult(result);
		return new RedirectView(USER_HOME_GET_URL);
	}

	@RequestMapping(value = "/" + REGISTER_USER_GET_URL, method = RequestMethod.GET)
	public String initRegister(ModelMap model, Integer slotId) {
		model.addAttribute(MODEL_RESULT, manager.getResult());
		model.addAttribute(MODEL_USER, manager.getUser());
		manager.setResult(null);
		if (manager.getCurrentAppointment().getDate() != null && slotId != null) {
			Slot slot = new Slot();
			slot.setId(slotId);
			manager.getCurrentAppointment().setSlot(slot);
		}
		return REGISTER_USER_PAGE;
	}

	@RequestMapping(value = "/" + REGISTER_USER_POST_URL, method = RequestMethod.POST)
	public RedirectView registerUser(ModelMap model, User user, int day, int month, int year) {
		user.setDob(CommonUtils.getDate(day, month, year));
		manager.getCurrentAppointment().setUser(user);
		String result = userBo.activateUser(user);
		manager.setResult(result);
		return new RedirectView(REGISTER_USER_GET_URL);
	}

	@RequestMapping(value = "/" + ACTIVATION_URL_GET, method = RequestMethod.GET)
	public RedirectView registerUser(ModelMap model, String user, String activationCode) {
		User currentUser = new User();
		currentUser.setActivationCode(activationCode);
		currentUser.setEmail(user);
		String result = userBo.registerUser(currentUser);
		if (!RESPONSE_OK.equals(result)) {
			manager.setResult(result);
			return new RedirectView(REGISTER_USER_GET_URL);
		}
		if (manager.getCurrentAppointment().getDate() != null) {
			userBo.populateUserDetails(currentUser);
			manager.getCurrentAppointment().setUser(currentUser);
			return new RedirectView(BOOK_APPOINTMENT_GET_URL);
		}
		manager.setUser(currentUser);
		return new RedirectView(HOME_GET_URL);
	}

	@RequestMapping(value = "/" + BOOK_APPOINTMENT_GET_URL, method = RequestMethod.GET)
	public String initBookAppointment(ModelMap model, Appointment appointment) {
		userBo.populateAppointment(manager.getCurrentAppointment());
		model.addAttribute(MODEL_TESTS, userBo.getAvailableTests());
		model.addAttribute(MODEL_LOCATIONS, userBo.getAllLocations());
		model.addAttribute(MODEL_APPOINTMENT, manager.getCurrentAppointment());
		model.addAttribute(MODEL_USER, manager.getUser());
		return BOOK_APPOINTMENT_PAGE;
	}

	@RequestMapping(value = "/" + BOOK_APPOINTMENT_POST_URL, method = RequestMethod.POST)
	public RedirectView bookAppointment(ModelMap model, Appointment appointment) {
		Appointment currentAppointment = manager.getCurrentAppointment();
		currentAppointment.setAddress(appointment.getAddress());
		currentAppointment.setDoctorName(appointment.getDoctorName());
		currentAppointment.setPrintRequired(appointment.getPrintRequired());
		appointment.getUser().setId(currentAppointment.getUser().getId());
		currentAppointment.setUser(appointment.getUser());
		userBo.populateAppointment(currentAppointment);
		manager.setResult(null);
		return new RedirectView(CONFIRM_APPOINTMENT_DETAILS_GET_URL);
	}

	@RequestMapping(value = "/" + BOOK_APPOINTMENT_OTHER_POST, method = RequestMethod.POST)
	public RedirectView bookAppointmentOther(ModelMap model, Appointment appointment) {
		Appointment currentAppointment = manager.getCurrentAppointment();
		currentAppointment.setAddress(appointment.getAddress());
		currentAppointment.setDoctorName(appointment.getDoctorName());
		currentAppointment.setUser(appointment.getUser());
		currentAppointment.setPrintRequired(appointment.getPrintRequired());
		userBo.populateAppointment(currentAppointment);
		manager.setResult(null);
		return new RedirectView(CONFIRM_APPOINTMENT_DETAILS_GET_URL);
	}

	@RequestMapping(value = "/" + CONFIRM_APPOINTMENT_DETAILS_GET_URL, method = RequestMethod.GET)
	public String initConfirmAppointment(ModelMap model) {
		model.addAttribute(MODEL_APPOINTMENT, manager.getCurrentAppointment());
		model.addAttribute(MODEL_RESULT, manager.getResult());
		model.addAttribute(MODEL_USER, manager.getUser());
		model.addAttribute(MODEL_PAY_TM, PaymentUtils.generatePayTmDetails(manager.getCurrentAppointment()));
		model.addAttribute(MODEL_PAY_U, PaymentUtils.preparePayUDetails(manager.getCurrentAppointment()));
		return CONFIRM_APPOINTMENT_DETAILS_PAGE;
	}

	@RequestMapping(value = "/" + CONFIRM_APPOINTMENT_GET_URL, method = RequestMethod.GET)
	public RedirectView confirmAppointment(ModelMap model) {
		String result = "";
		Appointment currentAppointment = manager.getCurrentAppointment();
		if (currentAppointment.getDate() != null) {
			if (currentAppointment.getPayment() == null) {
				preparePayment(PaymentType.cod);
			}
			if (currentAppointment.getUser().getId() == null) {
				currentAppointment.getUser().setId(manager.getUser().getId());
				result = userBo.bookForOther(currentAppointment);
			} else {
				result = userBo.bookAppointment(currentAppointment);
			}
		}
		manager.setResult(result);
		model.addAttribute(MODEL_USER, manager.getUser());
		return new RedirectView(CONFIRM_APPOINTMENT_DETAILS_GET_URL);
	}

	@RequestMapping(value = "/" + USER_HOME_GET_URL, method = RequestMethod.GET)
	public String initUserHome(ModelMap model) {
		userBo.populateUserDetails(manager.getUser());
		model.addAttribute(MODEL_RESULT, manager.getResult());
		manager.setResult(null);
		model.addAttribute(MODEL_USER, manager.getUser());
		return USER_PROFILE_PAGE;
	}

	/*@RequestMapping(value = "/" + CANCEL_APPOINTMENT_POST_URL, method = RequestMethod.POST)
	public @ResponseBody String cancelAppointment(ModelMap model, int appointmentId) {
		Appointment appointment = new Appointment();
		appointment.setId(appointmentId);
		appointment.setStatus(new AppointmentStatus(2));
		appointment.setUser(manager.getUser());
		appointment.setLab(manager.getUser().getLab());
		return userBo.cancelAppointment(appointment);
	}*/
	
	@RequestMapping(value = "/" + CANCEL_APPOINTMENT_POST_URL, method = RequestMethod.POST)
	public RedirectView cancelAppointment(ModelMap model, Appointment appointment) {
		appointment.setUser(manager.getUser());
		appointment.setLab(manager.getUser().getLab());
		manager.setResult(userBo.cancelAppointment(appointment));
		return new RedirectView(USER_HOME_GET_URL);
	}

	@RequestMapping(value = "/" + UPDATE_USER_POST_URL, method = RequestMethod.POST)
	public RedirectView updateUser(ModelMap model, User user) {
		String result = userBo.updateUser(user);
		manager.setResult(result);
		return new RedirectView(USER_HOME_GET_URL);
	}

	@RequestMapping(value = "/" + LOGOUT_GET_URL, method = RequestMethod.GET)
	public RedirectView logout(ModelMap model, User user) {
		manager.setUser(null);
		return new RedirectView(HOME_GET_URL);
	}

	@RequestMapping(value = "/" + GET_REPORT_URL_GET, method = RequestMethod.GET)
	public void getReport(int appointmentId, HttpServletResponse response, ModelMap model) {
		InputStream is = null;
		Appointment appointment = new Appointment();
		appointment.setId(appointmentId);
		try {
			is = userBo.downloadReport(appointment);
			if (is != null) {
				IOUtils.copy(is, response.getOutputStream());
				response.setHeader("Content-Disposition", "attachment; filename=\"report\"");
				response.flushBuffer();
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/" + REQUEST_CALL_BACK_POST_URL, method = RequestMethod.POST)
	public @ResponseBody String requestCallBack(ModelMap model, String[] values) {
		if (values.length == 0) {
			return null;
		}
		RequestForm form = new RequestForm();
		form.setName(values[0]);
		form.setEmail(values[2]);
		form.setPhone(values[1]);
		form.setUserMail(values[3]);
		form.setAdminMail(values[4]);
		return userBo.requestCollection(form);
	}

	@RequestMapping(value = "/" + REQUEST_CHECK_UP_POST_URL, method = RequestMethod.POST)
	public @ResponseBody String requestCheckUp(ModelMap model, String[] values) {
		if (values.length == 0) {
			return null;
		}
		RequestForm form = new RequestForm();
		form.setName(values[0]);
		form.setEmail(values[1]);
		form.setPhone(values[2]);
		form.setAge(values[3]);
		form.setQuery(values[4]);
		form.setUserMail(values[5]);
		form.setAdminMail(values[6]);
		return userBo.requestCollection(form);
	}

	@RequestMapping(value = "/" + PARTNER_LABS_GET_URL, method = RequestMethod.GET)
	public String getPartnerLabs(ModelMap model) {

		model.addAttribute(MODEL_LABS, userBo.getAllLabs());
		model.addAttribute(MODEL_USER, manager.getUser());
		return PARTNER_LABS_PAGE;
	}

	@RequestMapping(value = "/" + PAYMENT_RESULT_POST_URL, method = RequestMethod.POST)
	public RedirectView paymentResult(ModelMap model, HttpServletRequest request) {
		String txResult = request.getParameter("STATUS") != null ? request.getParameter("STATUS") : request.getParameter("status");// TXN_SUCCESS
		if (StringUtils.equals(StringUtils.trim(txResult), PAYTM_TXN_SUCCESS) || StringUtils.equals(StringUtils.trim(txResult), PAY_U_TX_SUCCESS)) {
			preparePayment(PaymentType.online);
			return new RedirectView(CONFIRM_APPOINTMENT_GET_URL);
		}
		manager.setResult("Transaction failed!");
		return new RedirectView(CONFIRM_APPOINTMENT_DETAILS_GET_URL);
	}

	private void preparePayment(PaymentType type) {
		Payment payment = new Payment();
		Appointment currentAppointment = manager.getCurrentAppointment();
		payment.setAmount(currentAppointment.getLab().getPrice());
		payment.setDate(new Date());
		payment.setStatus(PaymentStatus.SUCCESS);
		payment.setType(type);
		currentAppointment.setPayment(payment);
	}

	@RequestMapping(value = "/" + GET_PRICING_POST_URL, method = RequestMethod.POST)
	public RedirectView getPricing(ModelMap model, Lab lab) {
		lab.setTests(LabBo.getAvailableLabTests(lab));
		manager.setLab(lab);
		return new RedirectView(PRICING_GET_URL);
	}

	@RequestMapping(value = "/" + PRICING_GET_URL, method = RequestMethod.GET)
	public String getPricing(ModelMap model) {
		model.addAttribute(MODEL_LABS, userBo.getAllLabs());
		model.addAttribute(MODEL_LAB, manager.getLab());
		model.addAttribute(MODEL_USER, manager.getUser());
		return PRICING_PAGE;
	}

	@RequestMapping(value = "/" + GET_TEST_DETAILS_POST_URL, method = RequestMethod.POST)
	public @ResponseBody String paymentResult(ModelMap model, int testId) {
		LabTest test = new LabTest();
		test.setId(testId);
		return new Gson().toJson(userBo.getTestWithPackages(test));
	}

	@RequestMapping(value = "/" + ABOUT_US_GET_URL, method = RequestMethod.GET)
	public String aboutUs(ModelMap model) {
		model.addAttribute(MODEL_USER, manager.getUser());
		return ABOUT_PAGE;
	}

	@RequestMapping(value = "/" + TERMS_GET_URL, method = RequestMethod.GET)
	public String terms(ModelMap model) {
		model.addAttribute(MODEL_USER, manager.getUser());
		return TERMS_PAGE;
	}

	@RequestMapping(value = "/" + FAQ_GET_URL, method = RequestMethod.GET)
	public String faqs(ModelMap model) {
		model.addAttribute(MODEL_USER, manager.getUser());
		return FAQ_PAGE;
	}

	@RequestMapping(value = "/" + DISCLAIMER_GET_URL, method = RequestMethod.GET)
	public String disclaimer(ModelMap model) {
		model.addAttribute(MODEL_USER, manager.getUser());
		return DISCLAIMER_PAGE;
	}

	@RequestMapping(value = "/" + SUPPORT_GET_URL, method = RequestMethod.GET)
	public String support(ModelMap model) {
		model.addAttribute(MODEL_USER, manager.getUser());
		return SUPPORT_PAGE;
	}

	@RequestMapping(value = "/" + PRIVACY_GET_URL, method = RequestMethod.GET)
	public String privacy(ModelMap model) {
		model.addAttribute(MODEL_USER, manager.getUser());
		return PRIVACY_PAGE;
	}

	@RequestMapping(value = "/{pageName}", method = RequestMethod.GET)
	public String getPage(@PathVariable(value = "pageName") String pageName) {
		return pageName;
	}
	
	@RequestMapping(value = "/" + "getLoader", method = RequestMethod.GET)
	public void getLoader(HttpServletResponse response, ModelMap model) {
		InputStream is = null;
		try {
			ClassLoader classLoader = new CommonUtils().getClass().getClassLoader();
			URL resource = classLoader.getResource("loader.gif");
			File file = new File(resource.getFile());
			is = new FileInputStream(file);
			if (is != null) {
				IOUtils.copy(is, response.getOutputStream());
				response.flushBuffer();
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/" + CORPORATE_PACKAGES_GET_URL, method = RequestMethod.GET)
	public String initCorporate(ModelMap model) {
		model.addAttribute(MODEL_LABS, userBo.getAllLabs());
		model.addAttribute(MODEL_RESULT, manager.getResult());
		manager.setResult(null);
		return CORPORATE_PACKAGES_PAGE;
	}

	
	@RequestMapping(value = "/" + CORPORATE_REQUEST_POST_URL, method = RequestMethod.POST)
	public RedirectView corporateRequest(ModelMap model, RequestForm form) {
		manager.setResult(userBo.requestCorporatePackage(form));
		return new RedirectView(CORPORATE_PACKAGES_GET_URL);
	}

}
