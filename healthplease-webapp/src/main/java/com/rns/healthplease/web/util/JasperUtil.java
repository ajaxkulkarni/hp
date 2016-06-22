package com.rns.healthplease.web.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;

import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

import com.rns.healthplease.web.bo.domain.Appointment;
import com.rns.healthplease.web.bo.domain.LabTest;

public class JasperUtil {

	private static final String LAB_REPORT_TEMPLATE = "hp_lab_report.jasper";
	private static final String LAB_REPORT_TEMPLATE_DESC = "hp_lab_report_descriptive.jasper";
	private static final String LAB_INVOICE_TEMPLATE = "hp_lab_invoice.jasper";

	public static byte[] generateReport(Map<String, Object> parameters, JRBeanCollectionDataSource testsSource, String template) throws JRException, IOException {

		// String sourceFileName =
		// "F://Resoneuronance//Health Chekup Labs Project//Docs//reports/hp_lab_report_2.jasper";
		// String printFileName = null;

		try {
			ClassLoader classLoader = new CommonUtils().getClass().getClassLoader();
			URL resource = classLoader.getResource(template);
			File file = new File(resource.getFile());
			FileInputStream is = new FileInputStream(file);
			JasperPrint jasperPrint = null;

			if (testsSource == null) {
				jasperPrint = JasperFillManager.fillReport(is, parameters, new JREmptyDataSource());
			} else {
				jasperPrint = JasperFillManager.fillReport(is, parameters, testsSource);
			}

			// JasperReport report =
			// JasperCompileManager.compileReport(sourceFileName);
			// printFileName =
			// JasperFillManager.fillReportToFile(sourceFileName, parameters,
			// testsSource);
			// JasperPrint print = JasperFillManager.fillReport(report,
			// parameters, testsSource);

			if (jasperPrint != null) {
				/**
				 * 1- export to PDF
				 */
				// JasperExportManager.exportReportToPdfFile(printFileName,
				// "sample_report.pdf");

				byte[] bytes = JasperExportManager.exportReportToPdf(jasperPrint);
				return bytes;

			}
		} catch (JRException e) {
			e.printStackTrace();
			throw e;
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			throw e;
		} catch (IOException e) {
			e.printStackTrace();
			throw e;
		}
		return null;
	}

	public static void getReport(Appointment appointment) throws JRException, IOException {
		if (appointment == null || appointment.getLab() == null || appointment.getUser() == null) {
			return;
		}
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("labName", appointment.getLab().getName());
		parameters.put("patientName", appointment.getUser().getFirstName());
		parameters.put("patientGender", appointment.getUser().getGender());
		parameters.put("patientAge", String.valueOf(appointment.getUser().getAge() == null ? "" : appointment.getUser().getAge()));
		parameters.put("appointmentId", String.valueOf(appointment.getId()));
		parameters.put("appointmentDate", CommonUtils.convertDate(appointment.getDate()));
		parameters.put("labAddress", appointment.getLab().getAddress());
		parameters.put("doctorName", appointment.getDoctorName());

		JRBeanCollectionDataSource testSource = new JRBeanCollectionDataSource(appointment.getTests());
		String reportName = LAB_REPORT_TEMPLATE;
		if(CollectionUtils.isNotEmpty(appointment.getTests()) && CollectionUtils.isNotEmpty(appointment.getTests().get(0).getParameters()) && StringUtils.equalsIgnoreCase("D", appointment.getTests().get(0).getParameters().get(0).getType())) {
			reportName = LAB_REPORT_TEMPLATE_DESC;
		}
		appointment.setReportData(generateReport(parameters, testSource, reportName));

	}

	public static void getInvoice(Appointment appointment) throws JRException, IOException {
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("labName", appointment.getLab().getName());
		parameters.put("patientName", appointment.getUser().getFirstName());
		parameters.put("patientGender", appointment.getUser().getGender());
		parameters.put("patientAge", String.valueOf(appointment.getUser().getAge()));
		parameters.put("appointmentId", appointment.getId());
		parameters.put("appointmentDate", CommonUtils.convertDate(appointment.getDate()));
		parameters.put("labAddress", appointment.getLab().getAddress());
		parameters.put("doctorName", appointment.getDoctorName());
		parameters.put("patientId", appointment.getUser().getId());
		parameters.put("date", CommonUtils.convertDate(appointment.getDate()));
		if (appointment.getPayment() != null) {
			parameters.put("invoiceId", appointment.getPayment().getPaymentId());
		}
		parameters.put("pickupCharges", appointment.getLab().getPickUpCharge());
		parameters.put("total", appointment.getLab().getPrice());
		parameters.put("phone", appointment.getUser().getPhone());
		parameters.put("address", appointment.getUser().getAddress().getArea());
		addSerialNumbers(appointment.getTests());
		//JRBeanCollectionDataSource testSource = new JRBeanCollectionDataSource(new ArrayList());
		parameters.put("labTests", appointment.getTests());

		appointment.setInvoiceData(generateReport(parameters, null, LAB_INVOICE_TEMPLATE));
	}

	private static void addSerialNumbers(List<LabTest> tests) {
		if (CollectionUtils.isEmpty(tests)) {
			return;
		}
		int count = 1;
		for (LabTest test : tests) {
			test.setSrNo(count);
			count++;
		}

	}

}
