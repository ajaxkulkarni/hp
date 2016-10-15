package com.rns.healthplease.web.dao.api;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;

import com.rns.healthplease.web.dao.domain.Appointments;
import com.rns.healthplease.web.dao.domain.LabActiveDaysStatus;
import com.rns.healthplease.web.dao.domain.LabBlockedSlots;
import com.rns.healthplease.web.dao.domain.Labs;
import com.rns.healthplease.web.dao.domain.ReportConfig;
import com.rns.healthplease.web.dao.domain.TestLabs;


public interface LabDao {

	void addActiveDays(LabActiveDaysStatus status, Session session);

	void addBlockedSlot(LabBlockedSlots labSlot, Session session);

	LabBlockedSlots getBlockedSlot(LabBlockedSlots blockedSlots, Session session);

	void removeBlockedSlot(LabBlockedSlots blockedSlots, Session session);

	LabActiveDaysStatus getLabActiveDayStatus(Integer id, Date date, Session session);

	void updateActiveDays(LabActiveDaysStatus status, Session session);

	List<Labs> getAllLabs(Session session);
	
	Short getMinTestLabs(Integer testId, Session session);
	
	ReportConfig getReportConfig(Integer id, Session session);
	
	List<Appointments> getAllAppointmentsByUsers(Integer labId, Session session);
}
