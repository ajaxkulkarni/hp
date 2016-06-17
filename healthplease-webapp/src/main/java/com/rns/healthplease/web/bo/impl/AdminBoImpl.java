package com.rns.healthplease.web.bo.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

import com.rns.healthplease.web.bo.api.AdminBo;
import com.rns.healthplease.web.bo.domain.Appointment;
import com.rns.healthplease.web.bo.domain.User;
import com.rns.healthplease.web.dao.api.AppointmentDao;
import com.rns.healthplease.web.dao.domain.Appointments;
import com.rns.healthplease.web.dao.impl.AppointmentDaoImpl;
import com.rns.healthplease.web.util.CommonUtils;
import com.rns.healthplease.web.util.DataConverters;

public class AdminBoImpl implements AdminBo {
	
	private SessionFactory sessionFactory;
	private ThreadPoolTaskExecutor threadPoolTaskExecutor;

	public void setThreadPoolTaskExecutor(ThreadPoolTaskExecutor threadPoolTaskExecutor) {
		this.threadPoolTaskExecutor = threadPoolTaskExecutor;
	}

	public ThreadPoolTaskExecutor getThreadPoolTaskExecutor() {
		return threadPoolTaskExecutor;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void getAllAppointments(User user) {
		AppointmentDao appointmentDao = new AppointmentDaoImpl();
		Session session = this.sessionFactory.openSession();
		List<Appointments> appointmentsList = appointmentDao.getAllAppointments(session);
		if(CollectionUtils.isEmpty(appointmentsList)) {
			session.close();
			return;
		}
		user.setAppointments(new ArrayList<Appointment>());
		user.setPendingAppointments(new ArrayList<Appointment>());
		user.setCancelledAppointments(new ArrayList<Appointment>());
		user.setTodaysAppointments(new ArrayList<Appointment>());
		for (Appointments appointments : appointmentsList) {
			Appointment appointment = DataConverters.getAppointment(session, appointmentDao, appointments);
			user.getAppointments().add(appointment);
			CommonUtils.setAppointments(user, appointment);
		}
		session.close();
		return;
	}

}
