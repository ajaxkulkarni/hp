package com.rns.healthplease.web.dao.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Junction;
import org.hibernate.criterion.Restrictions;

import com.rns.healthplease.web.bo.domain.LabTest;
import com.rns.healthplease.web.dao.api.AppointmentDao;
import com.rns.healthplease.web.dao.domain.AppFileLocations;
import com.rns.healthplease.web.dao.domain.AppoinAddresses;
import com.rns.healthplease.web.dao.domain.AppointmentStatus;
import com.rns.healthplease.web.dao.domain.AppointmentTestResults;
import com.rns.healthplease.web.dao.domain.AppointmentTests;
import com.rns.healthplease.web.dao.domain.Appointments;
import com.rns.healthplease.web.dao.domain.CancelReasons;
import com.rns.healthplease.web.dao.domain.LabActiveDaysStatus;
import com.rns.healthplease.web.dao.domain.Labs;
import com.rns.healthplease.web.dao.domain.LocationWiseLabCharges;
import com.rns.healthplease.web.dao.domain.Locations;
import com.rns.healthplease.web.dao.domain.PaymentStatus;
import com.rns.healthplease.web.dao.domain.Slots;
import com.rns.healthplease.web.dao.domain.TestCategories;
import com.rns.healthplease.web.dao.domain.TestFactors;
import com.rns.healthplease.web.dao.domain.TestLabs;
import com.rns.healthplease.web.dao.domain.TestPackages;
import com.rns.healthplease.web.dao.domain.Tests;

public class AppointmentDaoImpl implements AppointmentDao {

	public List<Appointments> getUserAppointments(int userId, Session session) {
		Query createQuery = session.createQuery("from Appointments where user.id=:userId ORDER BY id DESC");
		createQuery.setInteger("userId", userId);
		return createQuery.list();
	}

	public AppoinAddresses getAddressByAppointmentId(Integer id, Session session) {
		Query query = session.createQuery("from AppoinAddresses where appointmentId=:id");
		query.setInteger("id", id);
		List<AppoinAddresses> addresses = query.list();
		if (CollectionUtils.isEmpty(addresses)) {
			return null;
		}
		return addresses.get(0);
	}

	public PaymentStatus getPaymentStatusByAppointmentId(Integer id, Session session) {
		Query query = session.createQuery("from PaymentStatus where appointment.id=:id");
		query.setInteger("id", id);
		List<PaymentStatus> statuses = query.list();
		if (CollectionUtils.isEmpty(statuses)) {
			return null;
		}
		return statuses.get(0);
	}

	public List<Tests> getAllTests(Session session, String testType) {
		String queryString = "from Tests";
		if(StringUtils.isNotEmpty(testType)) {
			queryString = "from Tests where testSingleShow=:single_test_show";
		}
		Query query = session.createQuery(queryString);
		if(StringUtils.isNotEmpty(testType)) {
			query.setString("single_test_show", testType);
		}
		return query.list();
	}

	public List<Locations> getAllLabLocations(Session session) {
		Query query = session.createQuery("from Locations");
		return query.list();
	}

	public Locations getLocationsById(Integer id, Session session) {
		Query query = session.createQuery("from Locations where id=:id");
		query.setInteger("id", id);
		List<Locations> list = query.list();
		if (CollectionUtils.isEmpty(list)) {
			return null;
		}
		return list.get(0);
	}

	public List<TestLabs> getLabsForTest(Integer id, Integer labId, Session session) {
		Query query = session.createQuery("from TestLabs where test.id=:id AND lab.id=:labId");
		query.setInteger("id", id);
		query.setInteger("labId", labId);
		return query.list();
	}

	public Labs getLabById(Integer id, Session session) {
		Query query = session.createQuery("from Labs where id=:id");
		query.setInteger("id", id);
		List<Labs> list = query.list();
		if (CollectionUtils.isEmpty(list)) {
			return null;
		}
		return list.get(0);
	}

	public List<Slots> getAllSlots(Session session, int labId) {
		Query query = session.createQuery("from Slots where orderToDisplay!=:order AND labId=:lab_id ORDER BY slabId,orderToDisplay");
		query.setInteger("order", 0);
		query.setInteger("lab_id", labId);
		return query.list();
	}

	public void addNewAppointment(Appointments appointments, AppoinAddresses appoinAddresses, PaymentStatus status, Session session) {
		session.persist(appointments);
		if (appoinAddresses != null) {
			appoinAddresses.setAppointmentId(appointments.getId());
			session.persist(appoinAddresses);
		}
		if(status != null) {
			status.setAppointment(appointments);
			session.persist(status);
		}
	}
	
	public List<LabActiveDaysStatus> getLabInactiveDays(Integer id, Session session) {
		Query query = session.createQuery("from LabActiveDaysStatus where labs.id=:id AND isActive=:not_active AND date>=:from_date");
		query.setInteger("id", id);
		query.setString("not_active", "N");
		query.setDate("from_date", new Date());
		return query.list();
	}
	
	public Tests getTestById(Integer testId, Session session) {
		Query query = session.createQuery("from Tests where id=:id");
		query.setInteger("id", testId);
		List<Tests> list = query.list();
		if(CollectionUtils.isEmpty(list)) {
			return null;
		}
		return list.get(0);
	}
	
	public Slots getSlotById(Integer id, Session session) {
		Query query = session.createQuery("from Slots where id=:id");
		query.setInteger("id", id);
		List<Slots> list = query.list();
		if(CollectionUtils.isEmpty(list)) {
			return null;
		}
		return list.get(0);
	}

	public TestLabs getTestLabsForTestLab(Integer testId, Integer labId, Session session) {
		Query query = session.createQuery("from TestLabs where test.id=:test_id AND lab.id=:lab_id");
		query.setInteger("test_id", testId);
		query.setInteger("lab_id", labId);
		List<TestLabs> list = query.list();
		if(CollectionUtils.isEmpty(list)) {
			return null;
		}
		return list.get(0);
	}

	public Appointments getAppointmentById(Integer id, Session session) {
		Query query = session.createQuery("from Appointments where id=:id");
		query.setInteger("id", id);
		List<Appointments> list = query.list();
		if(CollectionUtils.isEmpty(list)) {
			return null;
		}
		return list.get(0);
	}
	
	public void editAppointment(Appointments appointments, Session session) {
		session.update(appointments);
	}
	
	public void addReport(AppFileLocations appFileLocations, Session session) {
		session.persist(appFileLocations);
	}
	
	public AppFileLocations getAppFileLocationByAppointmentId(Integer id, Session session) {
		Query query = session.createQuery("from AppFileLocations where appointmentId=:id");
		query.setInteger("id", id);
		List<AppFileLocations> list = query.list();
		if(CollectionUtils.isEmpty(list)) {
			return null;
		}
		return list.get(0);
	}

	public List<Appointments> getAppointmentsForLabSlot(Integer slotId, Integer labId, Date date, Session session) {
		Query query = session.createQuery("from Appointments where slots.id=:slot_id AND lab.id=:lab_id AND date=:date");
		query.setInteger("slot_id", slotId);
		query.setInteger("lab_id", labId);
		query.setDate("date", date);
		List<Appointments> list = query.list();
		return list;
	}
	
	public List<TestPackages> getTestPackage(Integer id, Session session) {
		Query query = session.createQuery("from TestPackages where parentTest.id=:test_id");
		query.setInteger("test_id", id);
		try {
			List list = query.list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public LocationWiseLabCharges getLocationCharges(Integer labId, Integer locId, Session session) {
		Query query = session.createQuery("from LocationWiseLabCharges where locationId=:loc_id AND labId=:lab_id");
		query.setInteger("loc_id", locId);
		query.setInteger("lab_id", labId);
		List<LocationWiseLabCharges> list = query.list();
		if(CollectionUtils.isEmpty(list)) {
			return null;
		}
		return list.get(0);
	}
	//date>=:from_date
	public List<Appointments> getAppointmentsForDateRange(int labId, Date date1, Date date2, Session session) {
		Query createQuery = session.createQuery("from Appointments where lab.id=:labId AND date>=:from_date AND date<=:to_date  ORDER BY id DESC");
		createQuery.setInteger("labId", labId);
		createQuery.setDate("from_date", date1);
		createQuery.setDate("to_date", date2);
		return createQuery.list();
	}
	
	@Override
	public List<Appointments> getAppointmentsForDateRange(Date date1, Date date2, Session session) {
		Query createQuery = session.createQuery("from Appointments where date>=:from_date AND date<=:to_date  ORDER BY id DESC");
		createQuery.setDate("from_date", date1);
		createQuery.setDate("to_date", date2);
		return createQuery.list();
	}
	
	public List<Appointments> getAllAppointments(Session session) {
		Query createQuery = session.createQuery("from Appointments order by id DESC");
		return createQuery.list();
	}
	
	public CancelReasons getCancelReason(Integer cancelId, Session session) {
		if(cancelId == null) {
			return null;
		}
		return (CancelReasons) session.get(CancelReasons.class, cancelId);
	}
	
	public AppointmentTestResults getAppointmentTestResult(Integer appointmentId, Integer testId, Integer factorId, Session session) {
		Query createQuery = session.createQuery("from AppointmentTestResults where appointmentId=:appointment_id AND factor.id=:factor_id AND testId=:test_id");
		createQuery.setInteger("appointment_id", appointmentId);
		createQuery.setInteger("test_id", testId);
		createQuery.setInteger("factor_id", factorId);
		List<AppointmentTestResults>list = createQuery.list();
		if(CollectionUtils.isEmpty(list)) {
			return null;
		}
		return list.get(0);
	}
	
	@Override
	public List<TestCategories> getAllTestCategories(Session session) {
		Query createQuery = session.createQuery("from TestCategories order by id");
		return createQuery.list();
	}
	
	@Override
	public TestCategories getTestCategoryByName(String category, Session session) {
		Query createQuery = session.createQuery("from TestCategories where categoryName=:name");
		createQuery.setString("name", category);
		List<TestCategories> categories = createQuery.list();
		if(CollectionUtils.isEmpty(categories)) {
			return null;
		}
		return categories.get(0);
	}
	
	@Override
	public List<Labs> getAllLabs(Session session) {
		Query createQuery = session.createQuery("from Labs order by id");
		return createQuery.list();
	}
	
	@Override
	public List<TestFactors> getAllTestFactors(Session session) {
		Query createQuery = session.createQuery("from TestFactors order by sequence");
		return createQuery.list();
	}
	
	@Override
	public TestFactors getTestFactorByname(String name, Session session) {
		Query createQuery = session.createQuery("from TestFactors where name=:name");
		createQuery.setString("name", name);
		List<TestFactors> factors = createQuery.list();
		if(CollectionUtils.isEmpty(factors)) {
			return null;
		}
		return factors.get(0);
	}

	public TestCategories getTestCategoryById(Integer id, Session session) {
		Query createQuery = session.createQuery("from TestCategories where id=:id");
		createQuery.setInteger("id", id);
		List<TestCategories> categories = createQuery.list();
		if(CollectionUtils.isEmpty(categories)) {
			return null;
		}
		return categories.get(0);
	}
	
	@Override
	public void deleteAllTestFactorMaps(Session session) {
		Query createQuery = session.createQuery("delete from TestFactorsMap");
		createQuery.executeUpdate();
	}
	
	@Override
	public TestFactors getTestFactorById(Integer id, Session session) {
		Query createQuery = session.createQuery("from TestFactors where id=:id");
		createQuery.setInteger("id", id);
		List<TestFactors> factors = createQuery.list();
		if(CollectionUtils.isEmpty(factors)) {
			return null;
		}
		return factors.get(0);
	}
	
	@Override
	public List<TestLabs> getLabsForTest(List<Integer> tests,Integer labId, Session session) {
		String queryString = "from TestLabs where lab.id=:labId AND test.id in (:testIds)";
		Query createQuery = session.createQuery(queryString);
		createQuery.setParameterList("testIds", tests);
		createQuery.setInteger("labId", labId);
		return createQuery.list();
		
	}
	
	@Override
	public AppointmentStatus getAppointmentStatusById(Integer id, Session session) {
		Query createQuery = session.createQuery("from AppointmentStatus where id=:id");
		createQuery.setInteger("id", id);
		List<AppointmentStatus> status = createQuery.list();
		if(CollectionUtils.isEmpty(status)) {
			return null;
		}
		return status.get(0);
	}
	
	@Override
	public AppointmentTests getAppointmentTest(Integer testId,Integer appId , Session session) {
		Query createQuery = session.createQuery("from AppointmentTests where tests.id=:testId AND appointments.id=:appId");
		createQuery.setInteger("testId", testId);
		createQuery.setInteger("appId", appId);
		List<AppointmentTests> tests = createQuery.list();
		if(CollectionUtils.isEmpty(tests)) {
			return null;
		}
		return tests.get(0);
	}
	
}
