package com.rns.healthplease.web.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URL;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.Scanner;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.hibernate.Session;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.rns.healthplease.web.bo.api.HPSessionManager;
import com.rns.healthplease.web.bo.domain.Appointment;
import com.rns.healthplease.web.bo.domain.HPCalendar;
import com.rns.healthplease.web.bo.domain.HPDay;
import com.rns.healthplease.web.bo.domain.HPWeek;
import com.rns.healthplease.web.bo.domain.Lab;
import com.rns.healthplease.web.bo.domain.LabTest;
import com.rns.healthplease.web.bo.domain.PaymentStatus;
import com.rns.healthplease.web.bo.domain.PaymentType;
import com.rns.healthplease.web.bo.domain.Slot;
import com.rns.healthplease.web.bo.domain.User;
import com.rns.healthplease.web.dao.api.AppointmentDao;
import com.rns.healthplease.web.dao.api.UserDao;
import com.rns.healthplease.web.dao.domain.LabBlockedSlots;
import com.rns.healthplease.web.dao.domain.LocationWiseLabCharges;
import com.rns.healthplease.web.dao.domain.TestLabs;
import com.rns.healthplease.web.dao.domain.Tests;
import com.rns.healthplease.web.dao.domain.Users;
import com.rns.healthplease.web.dao.domain.Users1;
import com.rns.healthplease.web.dao.impl.UserDaoImpl;

public class CommonUtils implements Constants {

	public static Date convertDate(String date) {
		if(StringUtils.isEmpty(date)) {
			return null;
		}
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
		try {
			return sdf.parse(date);
		} catch (ParseException e) {

		}
		return null;
	}

	public static String convertDate(Date date) {
		if (date == null) {
			return "";
		}
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
		return sdf.format(date);
	}

	public static String convertDate(Date date, String format) {
		if (date == null) {
			return "";
		}
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		return sdf.format(date);
	}

	public static String getGender(Character gender) {
		if (gender == null) {
			return null;
		}
		if (StringUtils.equalsIgnoreCase(gender.toString(), "M")) {
			return GENDER_MALE;
		}
		return GENDER_FEMALE;
	}

	public static PaymentType getPaymentType(String paymentType) {
		if (PaymentType.cod.name().equals(paymentType)) {
			return PaymentType.cod;
		}
		if (PaymentType.online.name().equals(paymentType)) {
			return PaymentType.online;
		}
		return null;
	}

	public static com.rns.healthplease.web.bo.domain.PaymentStatus getPaymentStatus(String status) {
		if (com.rns.healthplease.web.bo.domain.PaymentStatus.SUCCESS.equals(status)) {
			return PaymentStatus.SUCCESS;
		}
		return PaymentStatus.FAILURE;
	}

	public static String generatePasswordForuser(Users1 loginDetails) {
		return StringUtils.substring(loginDetails.getUsername(), 0, 1) + new Random().nextInt(10000);
	}

	public static List<Integer> splitValues(String testIds) {
		if (StringUtils.isEmpty(testIds)) {
			return null;
		}
		String[] values = StringUtils.split(testIds, ",");
		if (values == null || values.length == 0) {
			return null;
		}
		List<Integer> ids = new ArrayList<Integer>();
		for (int i = 0; i < values.length; i++) {
			if (StringUtils.isEmpty(values[i])) {
				continue;
			}
			try {
				ids.add(Integer.valueOf(values[i]));
			} catch (Exception e) {
			}
		}
		return ids;
	}

	public static List<String> getDatesAsStrings(List<Date> blockedDates) {
		if (CollectionUtils.isEmpty(blockedDates)) {
			return null;
		}
		List<String> strings = new ArrayList<String>();
		for (Date date : blockedDates) {
			strings.add(convertDate(date));
		}
		return strings;
	}

	public static String getDatesAsString(List<Date> blockedDates) {
		if (CollectionUtils.isEmpty(blockedDates)) {
			return null;
		}
		StringBuilder result = new StringBuilder();
		for (Date date : blockedDates) {
			result.append(convertDate(date)).append("*");
		}
		return result.toString();
	}

	public static Date getDate(int day, int month, int year) {
		Calendar cal = Calendar.getInstance();
		cal.set(year, month - 1, day);
		return cal.getTime();
	}

	public static List<LabTest> prepareTests(String testIds) {
		List<LabTest> tests = new ArrayList<LabTest>();
		List<Integer> ids = CommonUtils.splitValues(testIds);
		if (ids == null) {
			return null;
		}
		for (Integer id : ids) {
			LabTest test = new LabTest();
			test.setId(id);
			tests.add(test);
		}
		return tests;
	}

	public static HPCalendar getCalendar(int month, int year, List<Date> blockedDates) {
		HPCalendar calendar = new HPCalendar();
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.MONTH, month);
		cal.set(Calendar.DAY_OF_MONTH, 1);
		cal.set(Calendar.YEAR, year);

		int myMonth = cal.get(Calendar.MONTH);
		HPWeek week = new HPWeek();
		boolean incompleteWeek = false;
		while (myMonth == cal.get(Calendar.MONTH)) {
			int weekDay = cal.get(Calendar.DAY_OF_WEEK);
			if (weekDay == 2) {
				calendar.getWeeks().add(week);
				incompleteWeek = true;
				if (CollectionUtils.isNotEmpty(calendar.getWeeks())) {
					week = new HPWeek();
					incompleteWeek = true;
				}
			}
			HPDay day = new HPDay();
			if (new Date().compareTo(cal.getTime()) > 0) {
				day.setActive("P");
			} else if (isBlockedDate(cal.getTime(), blockedDates)) {
				day.setActive("B");
			} else {
				day.setActive("A");
			}
			day.setDay(String.valueOf(cal.get(Calendar.DAY_OF_MONTH)));
			switch (weekDay) {
			case 1:
				week.setSunday(day);
				break;
			case 2:
				week.setMonday(day);
				break;
			case 3:
				week.setTuesday(day);
				break;
			case 4:
				week.setWednesday(day);
				break;
			case 5:
				week.setThursday(day);
				break;
			case 6:
				week.setFriday(day);
				break;
			case 7:
				week.setSaturday(day);
				break;

			default:
				break;
			}
			cal.add(Calendar.DAY_OF_MONTH, 1);
		}
		if (incompleteWeek) {
			calendar.getWeeks().add(week);
		}
		return calendar;

	}

	private static boolean isBlockedDate(Date time, List<Date> blockedDates) {
		if (CollectionUtils.isEmpty(blockedDates)) {
			return false;
		}
		for (Date date : blockedDates) {
			if (DateUtils.isSameDay(time, date)) {
				return true;
			}
		}
		return false;
	}

	public static List<Slot> getSlots(String[] blockedSlots, String date, String type) {
		if (blockedSlots == null || blockedSlots.length == 0 || StringUtils.isEmpty(date)) {
			return null;
		}
		List<Slot> slots = new ArrayList<Slot>();
		for (String slotId : blockedSlots) {
			Slot slot = new Slot();
			slot.setId(Integer.valueOf(slotId));
			slot.setBlockedDate(convertDate(date));
			slot.setType(type);
			slots.add(slot);
		}
		return slots;
	}

	public static File multipartToFile(MultipartFile multipart) throws IllegalStateException, IOException {
		File convFile = new File("report");
		multipart.transferTo(convFile);
		return convFile;
	}

	public static CommonsMultipartFile fileToMultipart(File file) {
		DiskFileItem fileItem = new DiskFileItem("file", "text/plain", false, file.getName(), (int) file.length(), file.getParentFile());
		try {
			fileItem.getOutputStream();
		} catch (IOException e) {
			e.printStackTrace();
		}
		CommonsMultipartFile multipart = new CommonsMultipartFile(fileItem);
		return multipart;
	}

	public static String readFile(String contentPath) throws FileNotFoundException {
		ClassLoader classLoader = new CommonUtils().getClass().getClassLoader();
		URL resource = classLoader.getResource(contentPath);
		File file = new File(resource.getFile());
		Scanner scanner = new Scanner(file);
		StringBuilder result = new StringBuilder();
		while (scanner.hasNextLine()) {
			String line = scanner.nextLine();
			result.append(line).append("\n");
		}

		scanner.close();
		return result.toString();
	}

	public static void populateLabUsers(Appointment appointment, Session session) {
		Lab lab = appointment.getLab();
		getLabUsers(session, lab);
		lab.getUsers().addAll(prepareContactUsers(lab.getEmail(), "mail"));
		lab.getUsers().addAll(prepareContactUsers(lab.getContact(), "phone"));
	}

	public static List<User> prepareContactUsers(String contacts, String type) {
		List<String> contactList = CommonUtils.getStrings(contacts);
		List<User> contactUsers = new ArrayList<User>();
		if (CollectionUtils.isNotEmpty(contactList)) {
			for (String contact : contactList) {
				User user = new User();
				if ("mail".equals(type)) {
					user.setEmail(contact);
				} else {
					user.setPhone(contact);
				}
				contactUsers.add(user);
			}
		}
		return contactUsers;
	}

	public static void getLabUsers(Session session, Lab lab) {
		UserDao userDao = new UserDaoImpl();
		List<Users> labUsers = userDao.getUsersForLab(lab.getId(), session);
		if (CollectionUtils.isEmpty(labUsers)) {
			return;
		}
		//Admin should not receive emails as per discussion on 27th July
		/*List<Users> admins = userDao.getAdmins(session);
		if (CollectionUtils.isNotEmpty(admins)) {
			labUsers.addAll(admins);
		}*/
		for (Users users : labUsers) {
			User user = new User();
			DataConverters.getUser(users, user);
			lab.getUsers().add(user);
		}
	}

	public static String getAffirmation(Character printRequired) {
		if (null != printRequired && YES == printRequired.charValue()) {
			return "Yes";
		}
		return "No";
	}

	public static String getTests(List<LabTest> tests) {
		if (CollectionUtils.isEmpty(tests)) {
			return "";
		}
		StringBuilder builder = new StringBuilder();
		for (LabTest labTest : tests) {
			builder.append(labTest.getName()).append(",");
		}
		return StringUtils.removeEnd(builder.toString(), ",");
	}

	public static void setAppointments(User user, Appointment appointment) {
		if (appointment.getStatus() == null) {
			return;
		}
		if (appointment.getStatus().getId() == 1) {
			user.getPendingAppointments().add(appointment);
		} else if (appointment.getStatus().getId() == 2) {
			user.getCancelledAppointments().add(appointment);
		}
		if (DateUtils.isSameDay(appointment.getDate(), new Date())) {
			user.getTodaysAppointments().add(appointment);
		}
	}

	public static boolean getBoolean(String value) {
		if (StringUtils.isEmpty(value)) {
			return false;
		}
		if (YES == value.charAt(0)) {
			return true;
		}
		return false;
	}

	public static void calculatePrice(Lab lab, Appointment appointment, AppointmentDao appointmentDao, Session session) {
		if(lab == null || lab.getId() == null) {
			return;
		}
		List<LabTest> tests = new ArrayList<LabTest>();
		Integer totalPrice = 0;
		Integer testChargeMultiplier = 1;
		for (LabTest test : appointment.getTests()) {
			String fileLoc = test.getFileLocation();
			Tests testById = appointmentDao.getTestById(test.getId(), session);
			if (testById == null) {
				continue;
			}
			TestLabs testLabs = appointmentDao.getTestLabsForTestLab(testById.getId(), lab.getId(), session);
			if (testLabs == null) {
				continue;
			}
			if (CollectionUtils.isEmpty(test.getParameters())) {
				test = DataConverters.getTest(testById);
			}
			test.setPrice(Integer.valueOf(testLabs.getLabPrice()));
			totalPrice = totalPrice + Integer.valueOf(testLabs.getLabPrice());
			if(ArrayUtils.contains(Constants.DOUBLE_TEST_CHARGE, test.getId().intValue())) {
				testChargeMultiplier = 2;
			}
			test.setFileLocation(fileLoc);
			tests.add(test);
		}
		lab.setTestPrice(totalPrice);
		if (appointment.getLocation() != null && appointment.isHomeCollection()) {
			LocationWiseLabCharges charges = appointmentDao.getLocationCharges(lab.getId(), appointment.getLocation().getId(), session);
			if (charges != null) {
				lab.setPickUpCharge(testChargeMultiplier*Integer.valueOf(charges.getPickUpCharge()));
				totalPrice = totalPrice + lab.getPickUpCharge();
			}
		}
		if(appointment.getPayment() != null && appointment.getPayment().getDiscount() != null) {
			totalPrice = totalPrice - appointment.getPayment().getDiscount();
		}
		lab.setPrice(totalPrice);
		appointment.setTests(tests);
	}

	public static List<Appointment> getAppointmentsByType(HPSessionManager manager, String header) {
		if (PENDING_HEADER.equals(StringUtils.trimToEmpty(header))) {
			return manager.getUser().getPendingAppointments();
		} else if (CANCELLED_HEADER.equals(StringUtils.trimToEmpty(header))) {
			return manager.getUser().getCancelledAppointments();
		} else if (TOTAL_HEADER.equals(StringUtils.trimToEmpty(header))) {
			return manager.getUser().getAppointments();
		} else if (StringUtils.containsIgnoreCase(header, "From")) {
			return manager.getUser().getAppointments();
		}
		return manager.getUser().getTodaysAppointments();
	}

	public static String getStringValue(String value) {
		return value == null ? "" : value;
	}

	public static String getGenderValue(String genderValues, int i) {
		if (StringUtils.isEmpty(genderValues)) {
			return null;
		}
		String[] genderValueArray = StringUtils.split(genderValues, ",");
		if (genderValueArray.length < 2) {
			return null;
		}
		return genderValueArray[i];
	}

	public static List<String> getStrings(String stringValues) {
		if (StringUtils.isEmpty(stringValues)) {
			return null;
		}
		String[] stringArray = StringUtils.split(stringValues, ",");
		if (stringArray.length == 0) {
			return null;
		}
		return Arrays.asList(stringArray);
	}

	public static String getAppendedString(List<String> strings) {
		if (CollectionUtils.isEmpty(strings)) {
			return null;
		}
		StringBuilder builder = new StringBuilder();
		for (String string : strings) {
			if(StringUtils.isBlank(StringUtils.trimToEmpty(string))) {
				continue;
			}
			builder.append(StringUtils.trimToEmpty(string)).append(",");
		}
		return StringUtils.removeEnd(builder.toString(), ",");
	}

	public static String getEncryptedPassword(String password) {
		MessageDigest md;
		try {
			md = MessageDigest.getInstance("SHA-256");
			md.update(password.getBytes());
			byte byteData[] = md.digest();
			// convert the byte to hex format method 1
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
			}
			System.out.println("Hex format : " + sb.toString());
			return sb.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return null;

	}

	public static String getFormValue(String remark, int i) {
		if (StringUtils.isEmpty(remark)) {
			return null;
		}
		String[] formValues = remark.split(":");
		if (formValues.length < 2 || i >= formValues.length) {
			return null;
		}
		return StringUtils.trimToEmpty(formValues[i]);
	}
	
	public static int getDay(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		return cal.get(Calendar.DATE);
	}
	
	public static void filterTests(Appointment appointmentDetails, Appointment appointment) {
		if(CollectionUtils.isEmpty(appointmentDetails.getTests()) || CollectionUtils.isEmpty(appointment.getTests())) {
			return;
		}
		List<LabTest> filteredTests = new ArrayList<LabTest>();
		for(LabTest currentTest: appointmentDetails.getTests()) {
			boolean found = false;
			for(LabTest uploadedTest: appointment.getTests()) {
				if(currentTest.getId().intValue() == uploadedTest.getId().intValue()) {
					found = true;
					break;
				}
			}
			if(found) {
				filteredTests.add(currentTest);
			}
		}
		appointmentDetails.setTests(filteredTests);
	}
	
	public static boolean isSameSlotType(LabBlockedSlots slot, Slot activateSlot) {
		/*if(StringUtils.isEmpty(slot.getSlotType())) {
			return true;
		}*/
		/*if(StringUtils.equalsIgnoreCase(slot.getSlotType(), activateSlot.getType())) {
			return true;
		}
		return false;*/
		return isSameSlotType(slot.getSlotType(), activateSlot);
	}

	public static boolean isSameSlotType(String slotType, Slot activateSlot) {
		if(StringUtils.equalsIgnoreCase(slotType, activateSlot.getType())) {
			return true;
		}
		return false;
	}
	
	/*public static void main(String[] args) {
		//System.out.println(getEncryptedPassword("123456³!õ"));
		System.out.println(StringUtils.join("123456","").length());
	}*/

}
