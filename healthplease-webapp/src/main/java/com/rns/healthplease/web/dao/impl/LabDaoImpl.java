package com.rns.healthplease.web.dao.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.hibernate.Query;
import org.hibernate.Session;

import com.rns.healthplease.web.dao.api.LabDao;
import com.rns.healthplease.web.dao.domain.LabActiveDaysStatus;
import com.rns.healthplease.web.dao.domain.LabBlockedSlots;
import com.rns.healthplease.web.dao.domain.Labs;

public class LabDaoImpl implements LabDao {

	public void addActiveDays(LabActiveDaysStatus status, Session session) {
		session.persist(status);
	}

	public void addBlockedSlot(LabBlockedSlots labSlot, Session session) {
		session.save(labSlot);
	}

	public LabBlockedSlots getBlockedSlot(LabBlockedSlots blockedSlots, Session session) {
		Query createQuery = session.createQuery("from LabBlockedSlots where lab.id=:lab_id AND slots.id=:slot_id AND date=:date");
		createQuery.setInteger("lab_id", blockedSlots.getLab().getId());
		createQuery.setInteger("slot_id", blockedSlots.getSlots().getId());
		createQuery.setDate("date", blockedSlots.getDate());
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

}
