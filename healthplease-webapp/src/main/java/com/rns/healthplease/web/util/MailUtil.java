package com.rns.healthplease.web.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang3.StringUtils;

import com.rns.healthplease.web.bo.domain.Appointment;
import com.rns.healthplease.web.bo.domain.PaymentType;
import com.rns.healthplease.web.bo.domain.RequestForm;
import com.rns.healthplease.web.bo.domain.User;

public class MailUtil implements Constants, Runnable {

	private static final String MAIL_ID = "info@healthplease.in";
	private static final String MAIL_AUTH = "true";
	private static final String MAIL_HOST = "smtp.zoho.com";
	private static final String MAIL_PORT = "465";
	private static final String MAIL_PASSWORD = "InfoHealthPlease01";

	private String type;
	private Appointment appointment;
	private RequestForm form;

	public void setForm(RequestForm form) {
		this.form = form;
	}

	public MailUtil(Appointment appointment2, String mailTypeActivation) {
		this.appointment = appointment2;
		this.type = mailTypeActivation;
	}

	public MailUtil(RequestForm form2, String type2) {
		this.form = form2;
		this.type = type2;
	}

	public void sendMail() {

		if (appointment == null && form == null) {
			return;
		}

		Session session = prepareMailSession();

		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(MAIL_ID, "Health Please"));
			if (form == null) {
				prepareMailContent(message, appointment);
			} else {
				prepareMailContent(message, form);
			}
			Transport.send(message);

		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	private String prepareMailContent(Message message, RequestForm form) {
		String result = "";
		try {
			result = readMailContent(message);
			result = StringUtils.replace(result, "{name}", form.getName());
			result = StringUtils.replace(result, "{email}", form.getEmail());
			result = StringUtils.replace(result, "{phone}", form.getPhone());
			result = StringUtils.replace(result, "{age}", form.getAge());
			result = StringUtils.replace(result, "{query}", form.getQuery());
			result = StringUtils.replace(result, "{testName}", form.getTestName());
			result = StringUtils.replace(result, "{labName}", form.getLabName());
			result = StringUtils.replace(result, "{company}", form.getCompanyName());
			result = StringUtils.replace(result, "{adminName}", form.getAdminName());
			result = StringUtils.replace(result, "{location}", form.getLocation());
			
			message.setContent(result, "text/html");
			
			if(MAIL_TYPE_CORPORATE_REQUEST_ADMIN.equals(type)) {
				message.setSubject(StringUtils.replace(message.getSubject(), "{labName}", form.getLabName()));
			}

			if (Arrays.asList(ADMIN_MAIL_TYPES).contains(StringUtils.trimToEmpty(type))) {
				message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(getEmails(form.getAdmins())));
			} else {
				message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(form.getEmail()));
			}

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static Session prepareMailSession() {
		Properties props = new Properties();

		props.put("mail.smtp.auth", MAIL_AUTH);
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		// props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", MAIL_HOST);
		props.put("mail.smtp.port", MAIL_PORT);

		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(MAIL_ID, MAIL_PASSWORD);
			}
		});
		return session;
	}

	private String prepareMailContent(Message message, Appointment appointment) {

		try {

			String result = readMailContent(message);
			result = StringUtils.replace(result, "{name}", appointment.getUser().getFirstName());
			result = StringUtils.replace(result, "{password}", appointment.getUser().getPassword());
			result = StringUtils.replace(result, "{link}", prepareActivationMailContent(appointment));
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
					result = StringUtils.replace(result, "{street}", appointment.getAddress().toString());
				} else {
					result = StringUtils.replace(result, "{street}", "NA");
				}
				if (appointment.getPayment() != null && appointment.getPayment().getType() != null) {
					result = StringUtils.replace(result, "{paymentType}", appointment.getPayment().getType().name());
				} else {
					result = StringUtils.replace(result, "{paymentType}", PaymentType.cod.name());
				}
				result = StringUtils.replace(result, "{printRequired}", CommonUtils.getAffirmation(appointment.getPrintRequired()));
				if (appointment.getLab().getPickUpCharge() != null) {
					result = StringUtils.replace(result, "{pickUpCharges}", appointment.getLab().getPickUpCharge().toString());
				} else {
					result = StringUtils.replace(result, "{pickUpCharges}", "0");
				}
				if (appointment.getStatus() != null) {
					result = StringUtils.replace(result, "{status}", appointment.getStatus().getName());
					result = StringUtils.replace(result, "{cancelReason}", appointment.getStatus().getCancellationReason());
				}
				result = StringUtils.replace(result, "{discount}", appointment.getPayment().getDiscount() != null ? appointment.getPayment().getDiscount().toString():"");
			}

			if (MAIL_TYPE_REPORT_UPLOAD.equals(type)) {
				attachReport(message, appointment, result);
			} else {
				message.setContent(result, "text/html");
			}

			if (ArrayUtils.contains(LAB_NAME_MAIL_TYPES, type)) {
				message.setSubject(StringUtils.replace(message.getSubject(), "{labName}", appointment.getLab().getName()));
				message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(getEmails(appointment.getLab().getUsers())));
			} else {
				message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(appointment.getUser().getEmail()));
			}
			if(MAIL_TYPE_BOOK_APP_LAB.equals(type) || MAIL_TYPE_BOOK_APP_USER.equals(type)) {
				String appointmentType = "Lab Visit";
				if(appointment.isHomeCollection()) {
					appointmentType = "Home Visit";
				}
				message.setSubject(StringUtils.replace(message.getSubject(), "{appointmentType}", appointmentType));
			}
			return result;

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return "";
	}

	private String getEmails(List<User> users) {
		if (CollectionUtils.isEmpty(users)) {
			return "";
		}
		StringBuilder builder = new StringBuilder();
		for (User user : users) {
			if(StringUtils.isEmpty(user.getEmail())) {
				continue;
			}
			builder.append(user.getEmail()).append(",");
		}
		return StringUtils.removeEnd(builder.toString(), ",");
		//return builder.toString();
	}

	private void attachReport(Message message, Appointment appointment, String result) throws MessagingException, IOException {
		Multipart mp = new MimeMultipart();
		BodyPart fileBody = new MimeBodyPart();
		DataSource source = new FileDataSource(getReport(appointment));
		fileBody.setDataHandler(new DataHandler(source));
		fileBody.setFileName(BusinessConverters.getReportName(appointment));
		BodyPart messsageBody = new MimeBodyPart();
		messsageBody.setText(result);
		messsageBody.setContent(result, "text/html");
		mp.addBodyPart(fileBody);
		mp.addBodyPart(messsageBody);
		message.setContent(mp);
		String subject = StringUtils.replace(message.getSubject(), "{labName}", appointment.getLab().getName());
		subject = StringUtils.replace(subject, "{testName}", appointment.getTests().get(0).getName());
		message.setSubject(subject);
	}

	private File getReport(Appointment appointment) throws IOException {
		if (appointment.getPrepareReport() != null) {
			return appointment.getPrepareReport();
		}
		return CommonUtils.multipartToFile(appointment.getReport());
	}

	public void run() {
		sendMail();
	}

	private String prepareActivationMailContent(Appointment appointment) {
		StringBuilder builder = new StringBuilder();
		builder.append(Constants.ROOT_URL).append("/").append(Constants.ACTIVATION_URL_GET).append("?").append(Constants.MODEL_USER).append("=").append(appointment.getUser().getEmail())
				.append("&").append(Constants.MODEL_ACTIVATION_CODE).append("=").append(appointment.getUser().getActivationCode());
		return builder.toString();
	}

	private String readMailContent(Message message) throws FileNotFoundException, MessagingException {
		String contentPath = "";
		contentPath = "email/" + MAIL_TEMPLATES.get(type);
		message.setSubject(MAIL_SUBJECTS.get(type));
		return CommonUtils.readFile(contentPath);
	}

	private static Map<String, String> MAIL_TEMPLATES = Collections.unmodifiableMap(new HashMap<String, String>() {
		{
			put(MAIL_TYPE_ACTIVATION, "activation_mail.html");
			put(MAIL_TYPE_REPORT_UPLOAD, "report_uploaded.html");
			put(MAIL_TYPE_BOOK_APP_USER, "book_appointment.html");
			put(MAIL_TYPE_BOOK_APP_LAB, "appointment_booked.html");
			put(MAIL_TYPE_REGISTRATION, "after_validate_account.html");
			put(MAIL_TYPE_CANCEL_APP, "cancel_appointment.html");
			put(MAIL_TYPE_CANCEL_APP_LAB, "cancel_appointment.html");
			put(MAIL_TYPE_REQUEST_CHECKUP, "user_request_check_up.html");
			put(MAIL_TYPE_REQUEST_CHECKUP_LAB, "admin_checkup.html");
			put(MAIL_TYPE_REQUEST_CALLBACK, "user_call_back.html");
			put(MAIL_TYPE_REQUEST_CALLBACK_LAB, "admin_call_back.html");
			put(MAIL_TYPE_FORGOT_PASSWORD, "user_temporary_password.html");
			put(MAIL_TYPE_CORPORATE_REQUEST, "corporate_request.html");
			put(MAIL_TYPE_CORPORATE_REQUEST_ADMIN, "admin_corp_call_back.html");
			put(MAIL_TYPE_CORPORATE_PARTNER, "corporate_partner.html");
			put(MAIL_TYPE_CORPORATE_PARTNER_ADMIN, "admin_corp_partner.html");
			put(MAIL_TYPE_LAB_PARTNER, "lab_partner.html");
			put(MAIL_TYPE_LAB_PARTNER_ADMIN, "admin_lab_partner.html");
		}
	});

	private static Map<String, String> MAIL_SUBJECTS = Collections.unmodifiableMap(new HashMap<String, String>() {
		{
			put(MAIL_TYPE_ACTIVATION, "Account activation");
			put(MAIL_TYPE_REPORT_UPLOAD, "Delivery: Your test report from {labName}");
			put(MAIL_TYPE_BOOK_APP_USER, "Congratulations! Your {appointmentType} appointment is booked successfully!");
			put(MAIL_TYPE_BOOK_APP_LAB, "New {appointmentType} Appointment booked for {labName}");
			put(MAIL_TYPE_REGISTRATION, "Thank you for choosing Health Please");
			put(MAIL_TYPE_CANCEL_APP, "Your Appointment has been cancelled!");
			put(MAIL_TYPE_CANCEL_APP_LAB, "Appointment for {labName} has been cancelled!");
			put(MAIL_TYPE_REQUEST_CHECKUP, "Thank you for requesting checkup!");
			put(MAIL_TYPE_REQUEST_CHECKUP_LAB, "New request check up");
			put(MAIL_TYPE_REQUEST_CALLBACK, "Thank you for requesting callback!");
			put(MAIL_TYPE_REQUEST_CALLBACK_LAB, "New request call back");
			put(MAIL_TYPE_FORGOT_PASSWORD, "Your temporary password is generated!");
			put(MAIL_TYPE_CORPORATE_REQUEST_ADMIN, "A new Corporate package has been requested for {labName}");
			put(MAIL_TYPE_CORPORATE_REQUEST, "Thank you for booking the Corporate Package with Health Please");
			put(MAIL_TYPE_CORPORATE_PARTNER, "Thank you for choosing Health Please");
			put(MAIL_TYPE_CORPORATE_PARTNER_ADMIN, "A new Corporate Partner request has been received");
			put(MAIL_TYPE_LAB_PARTNER, "Pathology & Diagnostics Lab Software by Health Please");
			put(MAIL_TYPE_LAB_PARTNER_ADMIN, "A new Lab Partner request has been received");
		}
	});

}
