package com.rns.healthplease.web.dao.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Property;

import com.rns.healthplease.web.dao.api.LabDao;
import com.rns.healthplease.web.dao.domain.Appointments;
import com.rns.healthplease.web.dao.domain.LabActiveDaysStatus;
import com.rns.healthplease.web.dao.domain.LabBlockedSlots;
import com.rns.healthplease.web.dao.domain.Labs;
import com.rns.healthplease.web.dao.domain.ReportConfig;
import com.rns.healthplease.web.dao.domain.TestLabs;

public class LabDaoImpl implements LabDao {

	public void addActiveDays(LabActiveDaysStatus status, Session session) {
		session.persist(status);
	}

	public void addBlockedSlot(LabBlockedSlots labSlot, Session session) {
		session.save(labSlot);
	}

	public LabBlockedSlots getBlockedSlot(LabBlockedSlots blockedSlots, Session session) {
		String queryString = "from LabBlockedSlots where lab.id=:lab_id AND slots.id=:slot_id AND date=:date";
		if(StringUtils.isNotEmpty(blockedSlots.getSlotType())) {
			queryString = queryString + " AND slotType=:slot_type";
		}
		Query createQuery = session.createQuery(queryString);
		createQuery.setInteger("lab_id", blockedSlots.getLab().getId());
		createQuery.setInteger("slot_id", blockedSlots.getSlots().getId());
		createQuery.setDate("date", blockedSlots.getDate());
		if(StringUtils.isNotEmpty(blockedSlots.getSlotType())) {
			createQuery.setString("slot_type", blockedSlots.getSlotType());
		}
		List<LabBlockedSlots> slots = createQuery.list();
		if (CollectionUtils.isEmpty(slots)) {
			return null;
		}
		return slots.get(0);
	}
	
	public void removeBlockedSlot(LabBlockedSlots blockedSlots, Session session) {
		session.delete(blockedSlots);
	}
	
	public LabActiveDaysStatus getLabActiveDayStatus(Integer id, Date date, Session session) {
		Query createQuery = session.createQuery("from LabActiveDaysStatus where labs.id=:id AND date=:date");
		createQuery.setInteger("id",id);
		createQuery.setDate("date", date);
		List<LabActiveDaysStatus> statuses = createQuery.list();
		if (CollectionUtils.isEmpty(statuses)) {
			return null;
		}
		return statuses.get(0);
	}
	
	public void updateActiveDays(LabActiveDaysStatus status, Session session) {
		session.update(status);
	}
	
	public List<Labs> getAllLabs(Session session) {
		Query createQuery = session.createQuery("from Labs");
		return createQuery.list();
	}
	
	public Short getMinTestLabs(Integer testId, Session session) {
		Query createQuery = session.createQuery("select min(labPrice) from TestLabs where test.id=:testId");
		createQuery.setInteger("testId",testId);
		List<Short> testLabs = createQuery.list();
		if(CollectionUtils.isEmpty(testLabs)) {
			return null;
		}
		return testLabs.get(0);
	}

	public ReportConfig getReportConfig(Integer id, Session session) {
		Query createQuery = session.createQuery("from ReportConfig where labId=:labId");
		createQuery.setInteger("labId",id);
		List<ReportConfig> configs = createQuery.list();
		if(CollectionUtils.isEmpty(configs)) {
			return null;
		}
		return configs.get(0);
	}

	@Override
	public List<Appointments> getAllAppointmentsByUsers(Integer labId, Session session) {
		Query createQuery = session.createQuery("from Appointments where lab.id=:labId");
		createQuery.setInteger("labId", labId);
		return createQuery.list();
	}
	
}
