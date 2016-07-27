package com.rns.healthplease.web.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JRException;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.google.gson.Gson;
import com.rns.healthplease.web.bo.api.HPSessionManager;
import com.rns.healthplease.web.bo.api.LabBo;
import com.rns.healthplease.web.bo.api.UserBo;
import com.rns.healthplease.web.bo.domain.Appointment;
import com.rns.healthplease.web.bo.domain.AppointmentStatus;
import com.rns.healthplease.web.bo.domain.HPCalendar;
import com.rns.healthplease.web.bo.domain.Lab;
import com.rns.healthplease.web.bo.domain.LabLocation;
import com.rns.healthplease.web.bo.domain.LabTest;
import com.rns.healthplease.web.bo.domain.Payment;
import com.rns.healthplease.web.bo.domain.PaymentStatus;
import com.rns.healthplease.web.bo.domain.PaymentType;
import com.rns.healthplease.web.bo.domain.Slot;
import com.rns.healthplease.web.bo.domain.TestParameter;
import com.rns.healthplease.web.util.CommonUtils;
import com.rns.healthplease.web.util.Constants;
import com.rns.healthplease.web.util.JasperUtil;

@Controller
public class HPLabControllerWeb implements Constants {

	private UserBo userBo;
	private LabBo labBo;

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

	@RequestMapping(value = "/" + LAB_HOME_URL_GET, method = RequestMethod.GET)
	public String initHomePage(ModelMap model, String appointmentsTitle) {
		initHome(model);
		/*if (StringUtils.isNotEmpty(appointmentsTitle)) {
			model.addAttribute(MODEL_HEADER, appointmentsTitle);
		} else {
			//initHome(model);
			
		}*/
		model.addAttribute(MODEL_HEADER, TODAY_HEADER);
		model.addAttribute(MODEL_APPOINTMENTS, manager.getUser().getTodaysAppointments());
		return LAB_DASHBOARD_PAGE;
	}

	private void initHome(ModelMap model) {
		manager.setCurrentAppointment(null);
		userBo.populateLabDetails(manager.getUser(), manager.getUser().getLab().getId());
		model.addAttribute(MODEL_USER, manager.getUser());
		manager.setResult(null);
	}

	@RequestMapping(value = "/" + LAB_HOME_PENDING_APPS_URL_GET, method = RequestMethod.GET)
	public String initHomePendingPage(ModelMap model) {
		initHome(model);
		model.addAttribute(MODEL_APPOINTMENTS, manager.getUser().getPendingAppointments());
		model.addAttribute(MODEL_HEADER, PENDING_HEADER);
		return LAB_DASHBOARD_PAGE;
	}

	@RequestMapping(value = "/" + LAB_HOME_CANCELLED_URL_GET, method = RequestMethod.GET)
	public String initHomeCancelledPage(ModelMap model) {
		initHome(model);
		model.addAttribute(MODEL_APPOINTMENTS, manager.getUser().getCancelledAppointments());
		model.addAttribute(MODEL_HEADER, CANCELLED_HEADER);
		return LAB_DASHBOARD_PAGE;
	}

	@RequestMapping(value = "/" + LAB_HOME_TOTAL_URL_GET, method = RequestMethod.GET)
	public String initHomeTotalsPage(ModelMap model) {
		initHome(model);
		model.addAttribute(MODEL_APPOINTMENTS, manager.getUser().getAppointments());
		model.addAttribute(MODEL_HEADER, TOTAL_HEADER);
		return LAB_DASHBOARD_PAGE;
	}
	
	@RequestMapping(value = "/" + LAB_APPOINTMENTS_FOR_DATES_GET_URL, method = RequestMethod.GET)
	public String initAppointmentsForDate(ModelMap model, String appointmentsTitle) {
		initHome(model);
		model.addAttribute(MODEL_APPOINTMENTS, manager.getUser().getSelectedAppointments());
		model.addAttribute(MODEL_HEADER, appointmentsTitle);
		return LAB_DASHBOARD_PAGE;
	}

	@RequestMapping(value = "/" + UPLOAD_REPORT_POST_URL, method = RequestMethod.POST)
	public RedirectView uploadReport(Appointment appointment, ModelMap model) {
		String result = "";
		if (!appointment.getReport().isEmpty()) {
			appointment.getTests().get(0).setReport(appointment.getReport());
			//appointment.getTests().add(test);
			appointment.setUser(manager.getUser());
			result = labBo.uploadReport(appointment);
			manager.setResult(result);
		}
		return new RedirectView(LAB_HOME_URL_GET);
	}

	@RequestMapping(value = "/" + BOOK_APPOINTMENT_LAB_GET_URL, method = RequestMethod.GET)
	public String initBookAppointment(ModelMap model) {
		Lab lab = manager.getUser().getLab();
		model.addAttribute(MODEL_TESTS, labBo.getAvailableLabTests(lab));
		model.addAttribute(MODEL_LOCATIONS, labBo.getAvailableLabLocations(lab));
		Appointment appointment = new Appointment();
		appointment.setLab(lab);
		List<Date> blockedDates = userBo.getBlockedDates(appointment);
		model.addAttribute(MODEL_DATES, CommonUtils.getDatesAsString(blockedDates));
		model.addAttribute(MODEL_USER, manager.getUser());
		HPCalendar calendar = CommonUtils.getCalendar(manager.getHpCalendar().getMonth(), manager.getHpCalendar().getYear(), blockedDates);
		calendar.setMonth(manager.getHpCalendar().getMonth());
		calendar.setYear(manager.getHpCalendar().getYear());
		model.addAttribute(MODEL_CALENDAR, calendar);
		model.addAttribute(MODEL_LAB_VIEW, BOOK_APPOINTMENT_LAB_GET_URL);
		model.addAttribute(MODEL_RESULT, manager.getResult());
		manager.setResult(null);
		return LAB_BOOK_APPOINTMENT_PAGE;
	}

	@RequestMapping(value = "/" + BOOK_APPOINTMENT_LAB_POST_URL, method = RequestMethod.POST)
	public RedirectView bookAppointment(ModelMap model, Appointment appointment, String testIds, String appDate) {
		appointment.setTests(CommonUtils.prepareTests(testIds));
		appointment.setDate(CommonUtils.convertDate(appDate));
		userBo.populateAppointment(appointment);
		if(appointment.getPayment() == null) {
			appointment.setPayment(new Payment());
			appointment.getPayment().setAmount(appointment.getLab().getPrice());
		} else {
			appointment.getPayment().setAmount(appointment.getLab().getPrice());
		}
		appointment.getPayment().setDate(new Date());
		appointment.getPayment().setStatus(PaymentStatus.SUCCESS);
		appointment.getPayment().setType(PaymentType.cod);
		String result = labBo.bookForHomeCollection(appointment);
		manager.setResult(result);
		return new RedirectView(BOOK_APPOINTMENT_LAB_GET_URL);
	}

	@RequestMapping(value = "/" + NEXT_MONTH_GET_URL, method = RequestMethod.GET)
	public RedirectView nextMonth(ModelMap model, String view) {
		HPCalendar hpCalendar = manager.getHpCalendar();
		hpCalendar.setMonth(hpCalendar.getMonth() + 1);
		if (hpCalendar.getMonth() > 11) {
			hpCalendar.setMonth(0);
			hpCalendar.setYear(hpCalendar.getYear() + 1);
		}
		return new RedirectView(view);
	}

	@RequestMapping(value = "/" + PREVIOUS_MONTH_GET_URL, method = RequestMethod.GET)
	public RedirectView previousMonth(ModelMap model, String view) {
		HPCalendar hpCalendar = manager.getHpCalendar();
		if (hpCalendar.getMonth() == 0) {
			hpCalendar.setMonth(11);
			hpCalendar.setYear(hpCalendar.getYear() - 1);
		} else {
			hpCalendar.setMonth(hpCalendar.getMonth() - 1);
		}
		return new RedirectView(view);
	}

	@RequestMapping(value = "/" + BLOCK_DATE_GET_URL, method = RequestMethod.GET)
	public RedirectView blockDay(ModelMap model, int day, String labView) {

		List<Date> dates = new ArrayList<Date>();
		Calendar cal = prepareDate(day);
		dates.add(cal.getTime());
		labBo.blockDates(dates, manager.getUser().getLab());
		manager.setResult("The selected Day has been updated successfully!");
		return new RedirectView(labView);
	}

	private Calendar prepareDate(int day) {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.MONTH, manager.getHpCalendar().getMonth());
		cal.set(Calendar.YEAR, manager.getHpCalendar().getYear());
		cal.set(Calendar.DATE, day);
		return cal;
	}

	@RequestMapping(value = "/" + SLOTS_GET_URL, method = RequestMethod.GET)
	public String initSlots(ModelMap model) {
		Appointment appointment = new Appointment();
		appointment.setLab(manager.getUser().getLab());
		List<Date> blockedDates = userBo.getBlockedDates(appointment);
		HPCalendar calendar = CommonUtils.getCalendar(manager.getHpCalendar().getMonth(), manager.getHpCalendar().getYear(), blockedDates);
		calendar.setMonth(manager.getHpCalendar().getMonth());
		calendar.setYear(manager.getHpCalendar().getYear());

		model.addAttribute(MODEL_SLOTS, manager.getUser().getLab().getCurrentSlots());
		model.addAttribute(MODEL_LAB_VIEW, SLOTS_GET_URL);
		model.addAttribute(MODEL_CALENDAR, calendar);
		model.addAttribute(MODEL_USER, manager.getUser());
		model.addAttribute(MODEL_RESULT, manager.getResult());
		manager.setResult(null);
		return LAB_SLOTS_PAGE;
	}

	@RequestMapping(value = "/" + GET_LAB_SLOTS_GET_URL, method = RequestMethod.GET)
	public RedirectView getSlotsForDay(ModelMap model, int day) {
		Lab lab = manager.getUser().getLab();
		Date date = prepareDate(day).getTime();
		lab.setCurrentSlots(labBo.getAllLabSlotsForDay(lab, date));
		return new RedirectView(SLOTS_GET_URL);
	}

	@RequestMapping(value = "/" + BLOCK_SLOTS_POST_URL, method = RequestMethod.POST)
	public RedirectView blockSlots(ModelMap model, String[] availableSlots, String date) {

		List<Slot> slots = CommonUtils.getSlots(availableSlots, date);
		//prepareCurrentSlots(slots);
		Lab lab = manager.getUser().getLab();
		Date convertedDate = CommonUtils.convertDate(date);
		labBo.blockSlots(slots, lab, convertedDate);
		manager.setResult("The selected slots have been modified successfully!");
		return new RedirectView(GET_LAB_SLOTS_GET_URL + "?day=" + CommonUtils.getDay(convertedDate));
	}

	private void prepareCurrentSlots(List<Slot> slots) {
		List<Slot> currentSlots = manager.getUser().getLab().getCurrentSlots();
		if (CollectionUtils.isEmpty(currentSlots)) {
			return;
		}
		for (Slot slot : currentSlots) {
			boolean found = false;
			for (Slot availableSlot : slots) {
				if (slot.getId() == availableSlot.getId()) {
					slot.setBlocked(false);
					found = true;
				}
			}
			if (!found) {
				slot.setBlocked(true);
			}
		}
	}

	@RequestMapping(value = "/" + GET_APPOINTMENTS_FOR_DATES_POST_URL, method = RequestMethod.POST)
	public RedirectView getAppointmentsForDates(ModelMap model, String date1, String date2) {
		Lab lab = manager.getUser().getLab();
		manager.getUser().setSelectedAppointments(labBo.getAppointmentsBetween(lab, CommonUtils.convertDate(date1), CommonUtils.convertDate(date2)));
		model.addAttribute(MODEL_HEADER, " From " + date1 + " To " + date2);
		return new RedirectView(LAB_APPOINTMENTS_FOR_DATES_GET_URL);
	}

	@RequestMapping(value = "/" + DOWNLOAD_EXCEL_GET_URL, method = RequestMethod.GET)
	public ModelAndView downloadExcel(ModelMap model, String header) {
		List<Appointment> appointments = new ArrayList<Appointment>();
		appointments = manager.getUser().getTodaysAppointments();
		appointments = CommonUtils.getAppointmentsByType(manager,header);
		ModelAndView modelAndView = new ModelAndView(EXCEL_VIEW, MODEL_APPOINTMENTS, appointments);
		return modelAndView;
	}


	@RequestMapping(value = "/" + CANEL_APPOINTMENT_LAB_POST_URL, method = RequestMethod.POST)
	public RedirectView cancelAppointment(ModelMap model, Appointment appointment) {
		appointment.setUser(manager.getUser());
		appointment.setLab(manager.getUser().getLab());
		userBo.cancelAppointment(appointment);
		return new RedirectView(LAB_HOME_CANCELLED_URL_GET);
	}

	@RequestMapping(value = "/" + "getLocationCharge", method = RequestMethod.POST)
	public @ResponseBody String getLocationCharges(ModelMap model, int locId, String testIds) {
		LabLocation location = new LabLocation();
		location.setId(locId);
		return labBo.getLocationCharges(manager.getUser().getLab(), location, CommonUtils.prepareTests(testIds));
	}

	@RequestMapping(value = "/" + LAB_DAYS_GET_URL, method = RequestMethod.GET)
	public String initDay(ModelMap model) {
		Appointment appointment = new Appointment();
		appointment.setLab(manager.getUser().getLab());
		List<Date> blockedDates = userBo.getBlockedDates(appointment);
		HPCalendar calendar = CommonUtils.getCalendar(manager.getHpCalendar().getMonth(), manager.getHpCalendar().getYear(), blockedDates);
		calendar.setMonth(manager.getHpCalendar().getMonth());
		calendar.setYear(manager.getHpCalendar().getYear());

		// model.addAttribute(MODEL_SLOTS,
		// manager.getUser().getLab().getCurrentSlots());
		model.addAttribute(MODEL_LAB_VIEW, LAB_DAYS_GET_URL);
		model.addAttribute(MODEL_CALENDAR, calendar);
		model.addAttribute(MODEL_USER, manager.getUser());
		model.addAttribute(MODEL_RESULT, manager.getResult());
		manager.setResult(null);
		return LAB_DAYS_PAGE;
	}

	@RequestMapping(value = "/" + LAB_SETTINGS_GET_URL, method = RequestMethod.GET)
	public String initSettings(ModelMap model) {
		model.addAttribute(MODEL_USER, manager.getUser());
		manager.setResult(null);
		return LAB_SETTINGS_PAGE;
	}
	
	@RequestMapping(value = "/" + LAB_PREPARE_REPORT_GET_URL, method = RequestMethod.GET)
	public String initPrepareReport(ModelMap model, int appointmentId) {
		if(CollectionUtils.isEmpty(manager.getUser().getAppointments())) {
			return null;
		}
		Appointment app = new Appointment();
		app.setId(appointmentId);
		Appointment appointment = labBo.getAppointment(app);
		model.addAttribute(MODEL_APPOINTMENT, appointment);
		model.addAttribute(MODEL_RESULT, manager.getResult());
		manager.setResult(null);
		return LAB_TEST_PARAMS_PAGE;
	}

	@RequestMapping(value = "/getAppointmentDetails", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String getAppointment(Integer appointmentId, String header, ModelMap model) {
		List<Appointment> appointments = CommonUtils.getAppointmentsByType(manager,header);
		Appointment app = null;
		if(CollectionUtils.isEmpty(appointments)) {
			return null;
		}
		for (Appointment appointment : appointments) {
			System.out.println(appointment.getId().intValue());
			if (appointment.getId().intValue() == appointmentId) {
				app = appointment;
				break;
			}
		}
		return new Gson().toJson(app);
	}
	
	/*@RequestMapping(value = "/" + GENERATE_REPORT_POST_URL, method = RequestMethod.POST)
	public ModelAndView generateReport(ModelMap model,Appointment appointment) {
		if(CollectionUtils.isEmpty(manager.getUser().getSelectedAppointments())) {
			return new ModelAndView(PDF_VIEW, MODEL_APPOINTMENT, appointment);
		}
		Appointment currentAppointment = manager.getUser().getSelectedAppointments().get(0);
		setTestValues(currentAppointment, appointment);
		currentAppointment.setPrepareReport(PdfUtil.createPdf(currentAppointment));
		if(appointment.getPrintRequired()!= null && YES == appointment.getPrintRequired().charValue()) {
			String result = labBo.uploadReport(currentAppointment);
			manager.setResult(result);
			return new ModelAndView(new RedirectView(LAB_PREPARE_REPORT_GET_URL + "?appointmentId=" + currentAppointment.getId()));
		}
		return new ModelAndView(PDF_VIEW, MODEL_APPOINTMENT, currentAppointment);
	}*/
	
	@RequestMapping(value = "/" + GENERATE_REPORT_POST_URL, method = RequestMethod.POST)
	public RedirectView generateReport(ModelMap model,Appointment appointment,String[] testIds,HttpServletResponse response) throws JRException, IOException {
		String generateReportView = LAB_PREPARE_REPORT_GET_URL + "?appointmentId=" + appointment.getId();
		Appointment app = new Appointment();
		app.setId(appointment.getId());
		Appointment currentAppointment = labBo.getAppointment(app);
		if(currentAppointment == null) {
			return new RedirectView(generateReportView);
		}
		currentAppointment.setStatus(new AppointmentStatus(3));
		setTestValues(currentAppointment, appointment, testIds);
		//currentAppointment.setPrepareReport(PdfUtil.createPdf(currentAppointment));
		if(appointment.getPrintRequired() == null || 'P' != appointment.getPrintRequired()) {
			JasperUtil.getReport(currentAppointment);
		}
		if(appointment.getPrintRequired()!= null && YES == appointment.getPrintRequired().charValue()) {
			String result = labBo.uploadReport(currentAppointment);
			if(RESPONSE_OK.equals(result)) {
				result = "Your report has been uploaded and sent to the user successfully!";
			}
			manager.setResult(result);
			return new RedirectView(generateReportView);
		} else {
			String result = labBo.updateTestResults(currentAppointment);
			if(RESPONSE_OK.equals(result)) {
				result = "Test values updated successfully!";
			}
			manager.setResult(result);
		}
		if(appointment.getPrintRequired() != null && 'P' == appointment.getPrintRequired()) {
			return new RedirectView(generateReportView);
		}
		byte[] reportData = currentAppointment.getReportData();
		if(reportData == null) {
			return new RedirectView(generateReportView);
		}
		writeToResponse(response, reportData);
		return new RedirectView(generateReportView);
	}

	private void writeToResponse(HttpServletResponse response, byte[] reportData) {
		InputStream is = new ByteArrayInputStream(reportData);
		if (is != null) {
			try {
				IOUtils.copy(is, response.getOutputStream());
				response.setHeader("Content-Disposition", "attachment; filename=\"report.pdf\"");
				response.setContentLength(reportData.length);
				response.flushBuffer();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	@RequestMapping(value = "/" + LAB_INVOICE_GET_URL, method = RequestMethod.GET)
	public void generateInvoice(int appointmentId,ModelMap model, HttpServletResponse response) throws JRException, IOException {
		Appointment app = new Appointment();
		app.setId(appointmentId);
		Appointment appointment = labBo.getAppointment(app);
		JasperUtil.getInvoice(appointment);
		writeToResponse(response, appointment.getInvoiceData());
	}
	
	private void setTestValues(Appointment currentAppointment, Appointment appointment, String[] testIds) {
		if(appointment == null || CollectionUtils.isEmpty(appointment.getTests())) {
			return;
		}
		List<LabTest> tests = new ArrayList<LabTest>();
		for(LabTest test: appointment.getTests()) {
			if(test == null || test.getId() == null || !Arrays.asList(testIds).contains(String.valueOf(test.getId()))) {
				continue;
			}
			for(LabTest labTest:currentAppointment.getTests()) {
				if(labTest.getId().intValue() == test.getId().intValue()) {
					setParameters(test, labTest);
					tests.add(labTest);
					break;
				}
			}
		}
		if(currentAppointment.getTests().size() > tests.size()) {
			currentAppointment.setStatus(new AppointmentStatus(4));
		}
		currentAppointment.setTests(tests);
	}

	private void setParameters(LabTest test, LabTest labTest) {
		if(CollectionUtils.isEmpty(test.getParameters()) || CollectionUtils.isEmpty(labTest.getParameters())) {
			return;
		}
		List<TestParameter> params = new ArrayList<TestParameter>();
		for(TestParameter parameter: test.getParameters()) {
			if(parameter == null || parameter.getId() == null || StringUtils.isEmpty(parameter.getActualValue())) {
				continue;
			}
			for(TestParameter param:labTest.getParameters()) {
				if(parameter.getId().intValue() == param.getId().intValue()) {
					param.setActualValue(parameter.getActualValue());
					param.setRemark(parameter.getRemark());
					params.add(param);
				}
			}
		}
		labTest.setParameters(params);
	}

}
