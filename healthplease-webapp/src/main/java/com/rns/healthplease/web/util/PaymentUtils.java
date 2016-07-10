package com.rns.healthplease.web.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.TreeMap;

import com.rns.healthplease.web.bo.domain.Appointment;
import com.rns.healthplease.web.bo.domain.PayTMDetails;
import com.rns.healthplease.web.bo.domain.PayUDetails;
import com.rns.healthplease.web.bo.domain.User;

public class PaymentUtils implements Constants {


	public static String generateCheckSum(PayTMDetails payTMDetails) throws Exception {
		com.paytm.merchant.CheckSumServiceHelper checkSumServiceHelper = com.paytm.merchant.CheckSumServiceHelper.getCheckSumServiceHelper();
		TreeMap<String, String> parameters = new TreeMap<String, String>();
		String merchantKey = PAY_TM_MERCHANT_KEY; // Key provided by Paytm
		parameters.put("REQUEST_TYPE", payTMDetails.getRequestType());
		parameters.put("MID", payTMDetails.getMid()); // Merchant ID (MID)
		parameters.put("ORDER_ID", payTMDetails.getOrderId()); // Merchant’s
		parameters.put("CUST_ID", payTMDetails.getCustomerId()); // Customer ID
		parameters.put("TXN_AMOUNT", payTMDetails.getTransactionAmount());
		parameters.put("CHANNEL_ID", payTMDetails.getChannelId());
		parameters.put("INDUSTRY_TYPE_ID", payTMDetails.getIndustryTypeId()); // Provided
		parameters.put("WEBSITE", payTMDetails.getWebsite()); // Provided by
		parameters.put("MOBILE_NO", payTMDetails.getMobileNo());
		parameters.put("EMAIL", payTMDetails.getEmail());
		parameters.put("CALLBACK_URL", payTMDetails.getCallbackUrl());
		return checkSumServiceHelper.genrateCheckSum(merchantKey, parameters);
	}

	public static PayTMDetails generatePayTmDetails(Appointment appointment) {
		if (appointment == null || appointment.getUser() == null || appointment.getLab() == null) {
			return null;
		}
		User user = appointment.getUser();
		PayTMDetails payTMDetails = new PayTMDetails();
		payTMDetails.setCallbackUrl(RESULT_URL);
		payTMDetails.setChannelId("WEB");
		payTMDetails.setCustomerId("0");
		if (user.getId() != null) {
			payTMDetails.setCustomerId(user.getId().toString());
		}
		payTMDetails.setEmail(user.getEmail());
		payTMDetails.setIndustryTypeId(PAY_TM_INDUSTRY_TYPE);
		payTMDetails.setMid(PAY_TM_MID);
		payTMDetails.setMobileNo(user.getPhone());
		payTMDetails.setOrderId(String.valueOf(System.currentTimeMillis()));
		payTMDetails.setRequestType("DEFAULT");
		payTMDetails.setTransactionAmount(appointment.getLab().getPrice().toString());
		payTMDetails.setWebsite(PAY_TM_WEBSITE);
		try {
			payTMDetails.setCheckSum(generateCheckSum(payTMDetails));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return payTMDetails;

	}

	public static PayUDetails preparePayUDetails(Appointment appointment) {
		if (appointment == null || appointment.getUser() == null || appointment.getLab() == null) {
			return null;
		}
		PayUDetails payUDetails = new PayUDetails();
		payUDetails.setId(String.valueOf(System.currentTimeMillis()));
		payUDetails.setMerchantKey(MERCHANT_KEY);
		payUDetails.setAmount(Float.valueOf(appointment.getLab().getPrice()));
		payUDetails.setName(appointment.getUser().getFirstName());
		payUDetails.setEmail(appointment.getUser().getEmail());
		payUDetails.setPhone(appointment.getUser().getPhone());
		payUDetails.setProductInfo(PRODUCT_INFO);
		payUDetails.setSuccessUrl(RESULT_URL);
		payUDetails.setFailureUrl(RESULT_URL);
		try {
			payUDetails.setHashKey(prepareHashKey(payUDetails));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return payUDetails;
	}

	public static String prepareHashKey(PayUDetails payUDetails) throws NoSuchAlgorithmException {
		StringBuilder keyBuilder = new StringBuilder();
		keyBuilder.append(payUDetails.getMerchantKey()).append("|");
		keyBuilder.append(payUDetails.getId()).append("|");
		keyBuilder.append(payUDetails.getAmount()).append("|");
		keyBuilder.append(payUDetails.getProductInfo()).append("|");
		keyBuilder.append(payUDetails.getName()).append("|");
		keyBuilder.append(payUDetails.getEmail()).append("|");
		keyBuilder.append("").append("|"); // udf1
		keyBuilder.append("").append("|"); // udf2
		keyBuilder.append("").append("|"); // udf3
		keyBuilder.append("").append("|"); // udf4
		keyBuilder.append("").append("|"); // udf5
		keyBuilder.append("|||||" + MERCHANT_SALT);
		return generateKey(keyBuilder.toString());
	}

	private static String generateKey(String key) throws NoSuchAlgorithmException {
		System.out.println("Hash :" + key);
		MessageDigest md = MessageDigest.getInstance("SHA-512");
		md.update(key.getBytes());

		byte byteData[] = md.digest();

		// convert the byte to hex format method 1
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < byteData.length; i++) {
			sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
		}

		// convert the byte to hex format method 2
		StringBuffer hexString = new StringBuffer();
		for (int i = 0; i < byteData.length; i++) {
			String hex = Integer.toHexString(0xff & byteData[i]);
			if (hex.length() == 1)
				hexString.append('0');
			hexString.append(hex);
		}
		System.out.println("Hex format : " + hexString.toString());
		return hexString.toString();
	}

}
