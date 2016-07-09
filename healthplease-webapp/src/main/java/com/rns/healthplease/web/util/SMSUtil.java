package com.rns.healthplease.web.util;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;

import com.rns.healthplease.web.bo.domain.Appointment;
import com.rns.healthplease.web.bo.domain.RequestForm;
import com.rns.healthplease.web.bo.domain.User;

public class SMSUtil implements Constants {

	private static void sendSMS(String message, String mobiles) {

		if (StringUtils.isEmpty(message)) {
			return;
		}

		// Your authentication key
		String authkey = "84917Ay21wooGYP55b1313b";
		// Multiple mobiles numbers separated by comma
		// String mobiles = "9423040642";
		// Sender ID,While using route4 sender id should be 6 characters long.
		String senderId = "HLTPLS";
		// Your message to send, Add URL encoding here.
		// define route
		String route = "4";

		// Prepare Url
		URLConnection myURLConnection = null;
		URL myURL = null;
		BufferedReader reader = null;

		// encoding message
		String encoded_message = URLEncoder.encode(message);

		// Send SMS API
		String mainUrl = "http://login.wishbysms.com/api/sendhttp.php?";

		// Prepare parameter string
		StringBuilder sbPostData = new StringBuilder(mainUrl);
		sbPostData.append("authkey=" + authkey);
		sbPostData.append("&mobiles=" + mobiles);
		sbPostData.append("&message=" + encoded_message);
		sbPostData.append("&route=" + route);
		sbPostData.append("&sender=" + senderId);

		// final string
		mainUrl = sbPostData.toString();
		try {
			// prepare connection
			myURL = new URL(mainUrl);
			myURLConnection = myURL.openConnection();
			myURLConnection.connect();
			reader = new BufferedReader(new InputStreamReader(myURLConnection.getInputStream()));
			// reading response
			String response;
			while ((response = reader.readLine()) != null)
				// print response
				System.out.println(response);

			// finally close connection
			reader.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static void sendSMS(Appointment appointment, String type) {
		String result = "";
		try {
			result = CommonUtils.readFile("sms/" + SMS_TEMPLATES.get(type));
			result = StringUtils.replace(result, "{name}", appointment.getUser().getFirstName());
			if (appointment.getLab() != null) {
				result = StringUtils.replace(result, "{labName}", appointment.getLab().getName());
				result = StringUtils.replace(result, "{testName}", CommonUtils.getTests(appointment.getTests()));
				result = StringUtils.replace(result, "{id}", appointment.getId().toString());
				if (appointment.getLab().getPrice() != null) {
					result = StringUtils.replace(result, "{price}", appointment.getLab().getPrice().toString());
				}
				result = StringUtils.replace(result, "{date}", CommonUtils.convertDate(appointment.getDate()));
				result = StringUtils.replace(result, "{slot}", appointment.getSlot().getStartTime() + " to " + appointment.getSlot().getEndTime());
				result = StringUtils.replace(result, "{phone}", appointment.getUser().getPhone());
				if (appointment.getAddress() != null) {
					result = StringUtils.replace(result, "{street}", appointment.getAddress().getStreet());
				}
				if (appointment.getPayment() != null && appointment.getPayment().getType() != null) {
					result = StringUtils.replace(result, "{paymentType}", appointment.getPayment().getType().name());
				}
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		sendSMS(result, getMobiles(appointment, type));
	}

	public static void sendSMS(RequestForm form, String type) {
		String result = "";
		try {
			result = CommonUtils.readFile("sms/" + SMS_TEMPLATES.get(type));
			result = StringUtils.replace(result, "{name}", form.getName());
			result = StringUtils.replace(result, "{email}", form.getEmail());
			result = StringUtils.replace(result, "{phone}", form.getPhone());
			result = StringUtils.replace(result, "{age}", form.getAge());
			result = StringUtils.replace(result, "{query}", form.getQuery());
			result = StringUtils.replace(result, "{testName}", form.getTestName());
			result = StringUtils.replace(result, "{labName}", form.getLabName());
			result = StringUtils.replace(result, "{company}", form.getCompanyName());
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		sendSMS(result, getMobiles(form, type));
	}

	private static String getMobiles(RequestForm form, String type) {
		if (Arrays.asList(ADMIN_MAIL_TYPES).contains(type)) {
			if (CollectionUtils.isEmpty(form.getAdmins())) {
				return "";
			}
			StringBuilder builder = new StringBuilder();
			for (User user : form.getAdmins()) {
				if(StringUtils.isEmpty(user.getPhone())) {
					continue;
				}
				builder.append(user.getPhone()).append(",");
			}
			return builder.toString();
		}
		return form.getPhone();
	}

	private static String getMobiles(Appointment appointment, String type) {
		if (appointment.getUser() == null) {
			return "";
		}
		if (MAIL_TYPE_BOOK_APP_LAB.equals(type) || MAIL_TYPE_CANCEL_APP_LAB.equals(type)) {
			if (appointment.getLab() == null || CollectionUtils.isEmpty(appointment.getLab().getUsers())) {
				return "";
			}
			StringBuilder builder = new StringBuilder();
			for (User user : appointment.getLab().getUsers()) {
				builder.append(user.getPhone()).append(",");
			}
			return builder.toString();
		}
		return appointment.getUser().getPhone();
	}

	private static Map<String, String> SMS_TEMPLATES = Collections.unmodifiableMap(new HashMap<String, String>() {
		{
			put(MAIL_TYPE_ACTIVATION, "activation.txt");
			put(MAIL_TYPE_REGISTRATION, "registration.txt");
			put(MAIL_TYPE_REPORT_UPLOAD, "report_uploaded.txt");
			put(MAIL_TYPE_BOOK_APP_USER, "book_appointment.txt");
			put(MAIL_TYPE_BOOK_APP_LAB, "book_appointment_lab.txt");
			put(MAIL_TYPE_CANCEL_APP, "cancel_appointment.txt");
			put(MAIL_TYPE_CANCEL_APP_LAB, "cancel_appointment.txt");
			put(MAIL_TYPE_REQUEST_CHECKUP, "request_checkup_user.txt");
			put(MAIL_TYPE_REQUEST_CHECKUP_LAB, "request_checkup_admin.txt");
			put(MAIL_TYPE_REQUEST_CALLBACK, "request_call_back_user.txt");
			put(MAIL_TYPE_REQUEST_CALLBACK_LAB, "request_call_back_admin.txt");
			put(MAIL_TYPE_CORPORATE_REQUEST_ADMIN, "admin_corp_call_back.txt");
			put(MAIL_TYPE_CORPORATE_REQUEST, "corporate_request.txt");
		}
	});

}
