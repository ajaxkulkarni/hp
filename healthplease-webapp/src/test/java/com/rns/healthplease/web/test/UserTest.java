package com.rns.healthplease.web.test;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import com.rns.healthplease.web.bo.domain.Address;
import com.rns.healthplease.web.bo.domain.Appointment;
import com.rns.healthplease.web.bo.domain.AppointmentStatus;
import com.rns.healthplease.web.bo.domain.Lab;
import com.rns.healthplease.web.bo.domain.LabLocation;
import com.rns.healthplease.web.bo.domain.LabTest;
import com.rns.healthplease.web.bo.domain.Payment;
import com.rns.healthplease.web.bo.domain.PaymentStatus;
import com.rns.healthplease.web.bo.domain.PaymentType;
import com.rns.healthplease.web.bo.domain.Slot;
import com.rns.healthplease.web.bo.domain.TestParameter;
import com.rns.healthplease.web.bo.domain.User;
import com.rns.healthplease.web.bo.domain.UserGroup;
import com.rns.healthplease.web.bo.impl.LabBoImpl;
import com.rns.healthplease.web.bo.impl.UserBoImpl;
import com.rns.healthplease.web.dao.domain.Appointments;
import com.rns.healthplease.web.dao.impl.AppointmentDaoImpl;
import com.rns.healthplease.web.util.CommonUtils;
import com.rns.healthplease.web.util.Constants;
import com.rns.healthplease.web.util.JasperUtil;
import com.rns.healthplease.web.util.MailUtil;
import com.rns.healthplease.web.util.PdfUtil;

public class UserTest {
	
	private UserBoImpl userBo;
	private LabBoImpl labBo;
	
	@Before
	public void before() {
		/*SessionFactory sessionFactory = createSessionFactory();
		userBo = new UserBoImpl();
		userBo.setSessionFactory(sessionFactory);
		labBo = new LabBoImpl();
		labBo.setSessionFactory(sessionFactory);*/
	}

	private SessionFactory createSessionFactory() {
		Configuration configuration = new Configuration();
        configuration.configure("hibernate.cfg.xml");
        StandardServiceRegistryBuilder ssrb = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties());
        SessionFactory sessionFactory = configuration.buildSessionFactory(ssrb.build());
		return sessionFactory;
	}
	
	@Test
	public void testRegisterUser() {
		User user = new User();
		user.setEmail("lab@pqr.com");
		user.setPassword("pwd");
		user.setFirstName("SAjax");
		user.setMiddleName("AJ");
		user.setLastName("Kulkarni");
		user.setPhone("1231231231");
		user.setDob(new Date());
		user.setGroup(new UserGroup(1));
		Address address = new Address();
		address.setStreet("Some street");
		user.setAddress(address);
		Assert.assertEquals("OK", userBo.registerUser(user));
	}
	
	@Test
	public void testRegisterLabUser() {
		User user = new User();
		user.setEmail("lab3@pqr.com");
		user.setPassword("pwd");
		user.setFirstName("SAjax");
		user.setMiddleName("AJ");
		user.setLastName("Kulkarni");
		user.setPhone("1231231231");
		user.setDob(new Date());
		user.setGroup(new UserGroup(3));
		Lab lab = new Lab();
		lab.setId(1);
		user.setLab(lab);
		Address address = new Address();
		address.setStreet("Some street");
		user.setAddress(address);
		Assert.assertEquals("OK", userBo.registerUser(user));
	}
	
	@Test
	public void testLoginLab() {
		User user = new User();
		user.setEmail("lab3@pqr.com");
		user.setPassword("pwd");
		Assert.assertEquals("OK", userBo.loginUser(user));
		System.out.println(user.getAppointments().get(0).getTests().get(0).getName());
	}
	
	@Test
	public void testLoginUser() {
		User user = new User();
		user.setEmail("ajinkya123@asd.com");
		user.setPassword("pwd");
		Assert.assertEquals("OK", userBo.loginUser(user));
	}
	
	@Test
	public void getAvailableLabsTest() {
		Appointment appointment = new Appointment();
		List<LabTest> tests = new ArrayList<LabTest>();
		LabTest labTest = new LabTest();
		labTest.setId(1);
		tests.add(labTest);
		appointment.setTests(tests);
		LabLocation location = new LabLocation();
		location.setId(1);
		appointment.setLocation(location);
		userBo.getAvailableLabs(appointment);
	}
	
	@Test
	public void getAvailableSlotsTest() {
		Appointment appointment = new Appointment();
		Lab lab = new Lab();
		lab.setId(2);
		appointment.setLab(lab);
		List<Slot> availableSlots = userBo.getAvailableSlots(appointment);
		System.out.println(availableSlots);
		List<Date> blockDates = userBo.getBlockedDates(appointment);
		System.out.println(blockDates);
	}
	
	@Test
	public void bookAppointmentTest() {
		Appointment appointment = new Appointment();
		appointment.getTests().add(userBo.getAvailableTests().get(0));
		appointment.getTests().add(userBo.getAvailableTests().get(1));
		appointment.setLocation(userBo.getAllLocations().get(0));
		appointment.setLab(userBo.getAvailableLabs(appointment).get(0));
		appointment.setSlot(userBo.getAvailableSlots(appointment).get(0));
		appointment.setDate(new Date());
		User user = new User();
		user.setEmail("ajinkya123@asd.com");
		userBo.populateUserDetails(user);
		appointment.setUser(user);
		appointment.setDoctorName("ACK");
		appointment.setAddress(user.getAddress());
		AppointmentStatus status = new AppointmentStatus(1);
		status.setId(1);
		appointment.setStatus(status);
		Payment payment = new Payment();
		payment.setAmount(appointment.getLab().getPrice());
		payment.setDate(new Date());
		payment.setType(PaymentType.cod);
		payment.setStatus(PaymentStatus.SUCCESS);
		appointment.setPayment(payment);
		userBo.bookAppointment(appointment);
	}
	
	@Test
	public void blockSlotsTest() {
		Lab lab = new Lab();
		lab.setId(1);
		List<Slot> slots = new ArrayList<Slot>();
		Slot slot = new Slot();
		slots.add(slot);
		slot.setId(1);
		slot.setBlockedDate(DateUtils.addDays(new Date(), 2));
		labBo.blockSlots(slots, lab);
	}
	
	@Test
	public void blockDateTest() {
		List<Date> dates = new ArrayList<Date>();
		Lab lab = new Lab();
		lab.setId(1);
		dates.add(new Date());
		labBo.blockDates(dates, lab);
	}
	
	@Test
	public void bookAppointmentLabTest() {
		Appointment appointment = new Appointment();
		appointment.getTests().add(userBo.getAvailableTests().get(0));
		appointment.getTests().add(userBo.getAvailableTests().get(1));
		appointment.setLocation(userBo.getAllLocations().get(0));
		appointment.setLab(userBo.getAvailableLabs(appointment).get(0));
		appointment.setSlot(userBo.getAvailableSlots(appointment).get(0));
		appointment.setDate(new Date());
		User user = new User();
		user.setEmail("ajinkya1@asd.com");
		user.setPhone("9422322322");
		user.setFirstName("Ajinkya");
		Address address = new Address();
		address.setStreet("Some street");
		appointment.setAddress(address);
		appointment.setUser(user);
		appointment.setDoctorName("Dr.Patel");
		AppointmentStatus status = new AppointmentStatus(1);
		status.setId(1);
		appointment.setStatus(status);
		Payment payment = new Payment();
		payment.setAmount(appointment.getLab().getPrice());
		payment.setDate(new Date());
		payment.setType(PaymentType.cod);
		payment.setStatus(PaymentStatus.SUCCESS);
		appointment.setPayment(payment);
		labBo.bookForHomeCollection(appointment);
	}
	
	@Test
	public void updateUserTest() {
		
	}
	
	@Test
	public void getLabSlotsTest() {
		Lab lab = new Lab();
		lab.setId(1);
		Date date = CommonUtils.convertDate("2016-05-18");
		List<Slot> slots =  labBo.getAllLabSlotsForDay(lab, date);
		for(Slot slot: slots) {
			System.out.println(slot.getStartTime() + ":" + slot.getEndTime() + ":" + slot.getIsBooked() + ":" + slot.isBlocked());
		}
	}
	
	@Test
	public void testMail() {
		Appointment appointment = new Appointment();
		User user = new User();
		user.setEmail("ajinkyashiva@gmail.com");
		appointment.setUser(user);
		MailUtil mailUtil = new MailUtil(appointment, Constants.MAIL_TYPE_ACTIVATION);
		//mailUtil.sendMail(appointment);
	}
	
	@Test
	public void pdfReportTest() {
		Appointment appointment = new Appointment();
		User user = new User();
		user.setFirstName("Ajinkya");
		user.setAge(25);
		List<LabTest> tests = new ArrayList<LabTest>();
		LabTest test1 = new LabTest();
		test1.setName("Test 1");
		List<TestParameter> parameters = new ArrayList<TestParameter>();
		TestParameter par1 = new TestParameter();
		par1.setName("Parameter 1");
		par1.setNormalValue("100-500");
		par1.setActualValue("120");
		par1.setUnit("mm");
		parameters.add(par1);
		TestParameter par2 = new TestParameter();
		par2.setName("Parameter 2");
		par2.setNormalValue("100-500");
		par2.setActualValue("120");
		par2.setUnit("hg");
		parameters.add(par2);
		test1.setParameters(parameters);
		tests.add(test1);
		appointment.setTests(tests);
		appointment.setUser(user);
		appointment.setId(123);
		File file = PdfUtil.createPdf(appointment);
		BufferedOutputStream stream = null;
		try {
			stream = new BufferedOutputStream(new FileOutputStream(file));
			stream.write(FileUtils.readFileToByteArray(file));
			stream.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testJapser() throws IOException {
		List<LabTest> labTests = new ArrayList<LabTest>();
		LabTest t1 = new LabTest();
		t1.setName("Hemogram CBC");
		t1.setPrice(50);
		labTests.add(t1);
		LabTest t2 = new LabTest();
		t2.setPrice(100);
		t2.setName("ESR");
		labTests.add(t2);
		List<TestParameter> dataList = new ArrayList<TestParameter>();
		TestParameter par3 = new TestParameter();
		par3.setName("Parameter 1");
		par3.setNormalValue("100-500");
		par3.setActualValue("120");
		par3.setUnit("mm");
		dataList.add(par3);
		t1.setParameters(dataList);
		t2.setParameters(dataList);
		Appointment appointmnt = new Appointment();
		appointmnt.setTests(labTests);
		List<Appointment> appointments = new ArrayList<Appointment>();
		JRBeanCollectionDataSource testsSource = new JRBeanCollectionDataSource(appointments);
		System.out.println("size:"+ labTests.size());
		
		Map<String,Object> parameters = new HashMap<String, Object>();
		parameters.put("labName", "Dhanwantari Lab");
		parameters.put("patientName", "Ajinkya");
		parameters.put("patientGender", "Male");
		parameters.put("patientAge", "23");
		parameters.put("appointmentId", "123");
		parameters.put("appointmentDate", "2013-06-08");
		parameters.put("labAddress", "Flat No 6,Alliance Excellency, 720/14, Navi peth, Pune 30, 411030");
		//parameters.put("labTests", testsSource);
		byte[] bytes;
		try {
			bytes = JasperUtil.generateReport(parameters, testsSource, "hp_lab_report_2.jasper");
			BufferedOutputStream stream = null;
			stream = new BufferedOutputStream(new FileOutputStream("test.pdf"));
			stream.write(bytes);
			stream.close();
		} catch (JRException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	@Test
	public void joinTest(){
		/*List<Labs> locs = new UserDaoImpl().getJoinResult(2,userBo.getSessionFactory().openSession());
		locs.get(0).getLabses().iterator().next();
		LabLocations next = locs.get(0).getLabses().iterator().next();
		System.out.println(next.getLocations().getLocationName());*/
		/*List<TestLabs> labs = new AppointmentDaoImpl().getLabsForTest(2,1,userBo.getSessionFactory().openSession());
		System.out.println(labs.get(0).getLab().getLabName());*/
		List<Appointments> userAppointments = new AppointmentDaoImpl().getUserAppointments(1, userBo.getSessionFactory().openSession());
		System.out.println(userAppointments.get(0).getUser().getFname());
		System.out.println(userAppointments.get(0).getLocations().getLocationName());
		System.out.println(userAppointments.get(0).getSlots().getStartTime());
		System.out.println(userAppointments.get(0).getStatus().getName());
	}

}
