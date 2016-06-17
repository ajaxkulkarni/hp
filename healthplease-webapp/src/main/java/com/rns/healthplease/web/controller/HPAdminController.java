package com.rns.healthplease.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rns.healthplease.web.bo.api.AdminBo;
import com.rns.healthplease.web.bo.api.HPSessionManager;
import com.rns.healthplease.web.bo.api.LabBo;
import com.rns.healthplease.web.bo.api.UserBo;
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

}
