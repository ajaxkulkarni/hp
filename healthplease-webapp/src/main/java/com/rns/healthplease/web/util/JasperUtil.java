package com.rns.healthplease.web.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;

import com.rns.healthplease.web.bo.domain.Appointment;
import com.rns.healthplease.web.bo.domain.LabTest;
import com.rns.healthplease.web.bo.domain.ReportConfigurations;
import com.rns.healthplease.web.bo.domain.TestParameter;

public class JasperUtil {

	private static final String LAB_REPORT_TEMPLATE = "hp_lab_report.jasper";
	private static final String LAB_REPORT_TEMPLATE_DESC = "hp_lab_report_descriptive.jasper";
	private static final String LAB_REPORT_TEMPLATE_SEP = "hp_lab_report_sep.jasper";
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
		parameters.put("patientGender", CommonUtils.getStringValue(appointment.getUser().getGender()));
		parameters.put("patientAge", String.valueOf(appointment.getUser().getAge() == null ? "" : appointment.getUser().getAge()));
		parameters.put("appointmentId", String.valueOf(appointment.getId()));
		parameters.put("appointmentDate", CommonUtils.convertDate(appointment.getDate(), Constants.DATE_FORMAT_2));
		parameters.put("labAddress", appointment.getLab().getAddress());
		parameters.put("doctorName", appointment.getDoctorName());
		parameters.put("printRequired", "y");
		parameters.put("printFooter", "y");
		parameters.put("printSign", "y");
		parameters.put("remark", appointment.getRemark());
		parameters.put("logopath", appointment.getLab().getLogo());
		parameters.put("reportTime", new SimpleDateFormat("dd-MM-yyyy hh:mm:ss").format(new Date()));
		parameters.put("accountHolder", "");
		if (appointment.getAccountHolder() != null) {
			parameters.put("accountHolder", appointment.getAccountHolder().getEmail());
		}
		ReportConfigurations reportConfig = appointment.getLab().getReportConfig();
		if (reportConfig != null) {
			parameters.put("printRequired", CommonUtils.getStringValue(StringUtils.lowerCase(reportConfig.getIsHeader())));
			parameters.put("printFooter", CommonUtils.getStringValue(StringUtils.lowerCase(reportConfig.getIsFooter())));
			parameters.put("printSign", CommonUtils.getStringValue(StringUtils.lowerCase(reportConfig.getIsSignature())));
			parameters.put("printDesignation", CommonUtils.getStringValue(StringUtils.lowerCase(reportConfig.getIsDesignation())));
			parameters.put("printTime", CommonUtils.getStringValue(StringUtils.lowerCase(reportConfig.getIsTime())));
			parameters.put("printColor", CommonUtils.getStringValue(StringUtils.lowerCase(reportConfig.getIsColor())));
			System.out.println(CommonUtils.getStringValue(StringUtils.lowerCase(reportConfig.getIsColor())));
			parameters.put("pathName", reportConfig.getName());
			parameters.put("designation", reportConfig.getDesignation());
			parameters.put("headerLogo", reportConfig.getHeader());
			parameters.put("footerLogo", reportConfig.getFooter());

			if (StringUtils.isNotBlank(reportConfig.getSignaturePath())) {
				parameters.put("imagePath", reportConfig.getSignaturePath());
			} else {
				parameters.put("printSign", "n");
			}

			// parameters.put("separatePage", reportConfig.getIsSeparatePage());
		}
		// parameters.put("isbold", "");
		analyzeTestParameters(appointment.getTests(), reportConfig);
		JRBeanCollectionDataSource testSource = new JRBeanCollectionDataSource(appointment.getTests());
		String reportName = LAB_REPORT_TEMPLATE;
		if (CollectionUtils.isNotEmpty(appointment.getTests()) && CollectionUtils.isNotEmpty(appointment.getTests().get(0).getParameters())
				&& StringUtils.equalsIgnoreCase("D", appointment.getTests().get(0).getParameters().get(0).getType())) {
			reportName = LAB_REPORT_TEMPLATE_DESC;
		}
		if (StringUtils.equals("y", reportConfig.getIsSeparatePage())) {
			reportName = LAB_REPORT_TEMPLATE_SEP;
		}
		appointment.setReportData(generateReport(parameters, testSource, reportName));
	}

	private static void analyzeTestParameters(List<LabTest> tests, ReportConfigurations reportConfig) {
		if (CollectionUtils.isEmpty(tests)) {
			return;
		}
		for (LabTest test : tests) {
			if (CollectionUtils.isNotEmpty(test.getParameters())) {
				for (TestParameter parameter : test.getParameters()) {
					if (StringUtils.equals("y", parameter.getIsBold())) {
						continue;
					}
					if (parameter.getActualValue() == null) {
						continue;
					}
					parameter.setIsBold("");
					parameter.setIsColor("");
					parameter.setColor("#000000");
					String[] values = StringUtils.split(parameter.getNormalValue(), "-");
					if (values == null || values.length < 2) {
						continue;
					}
					double min = new Double(StringUtils.trimToEmpty(values[0]));
					double max = new Double(StringUtils.trimToEmpty(values[1]));
					double value = new Double(parameter.getActualValue());
					if (value < min || value > max) {
						parameter.setIsBold("y");
						parameter.setIsColor(CommonUtils.getStringValue(reportConfig.getIsColor()));
						if(StringUtils.equals("y", parameter.getIsColor())) {
							parameter.setColor("#FF0703");
						}
					}
					
				}
			}
		}
	}

	public static void getInvoice(Appointment appointment) throws JRException, IOException {
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("labName", appointment.getLab().getName());
		parameters.put("patientName", appointment.getUser().getFirstName());
		parameters.put("patientGender", appointment.getUser().getGender());
		parameters.put("patientAge", String.valueOf(appointment.getUser().getAge()));
		parameters.put("appointmentId", appointment.getId());
		parameters.put("appointmentDate", CommonUtils.convertDate(appointment.getDate(), Constants.DATE_FORMAT_2));
		parameters.put("labAddress", appointment.getLab().getAddress());
		parameters.put("doctorName", appointment.getDoctorName());
		parameters.put("patientId", appointment.getUser().getId());
		parameters.put("date", CommonUtils.convertDate(appointment.getDate()));
		parameters.put("logopath", appointment.getLab().getLogo());
		if (appointment.getPayment() != null) {
			parameters.put("invoiceId", appointment.getPayment().getPaymentId());
		}
		parameters.put("pickupCharges", 0);
		if (appointment.getLab().getPickUpCharge() != null) {
			parameters.put("pickupCharges", appointment.getLab().getPickUpCharge());
		}
		parameters.put("printRequired", "y");
		ReportConfigurations reportConfig = appointment.getLab().getReportConfig();
		if (reportConfig != null) {
			parameters.put("printRequired", CommonUtils.getStringValue(StringUtils.lowerCase(reportConfig.getIsHeader())));
			parameters.put("printFooter", CommonUtils.getStringValue(StringUtils.lowerCase(reportConfig.getIsFooter())));
			parameters.put("printSign", CommonUtils.getStringValue(StringUtils.lowerCase(reportConfig.getIsInvoiceSignature())));
			parameters.put("pathName", reportConfig.getInvoiceName());
			parameters.put("designation", reportConfig.getInvoiceDesignation());
			parameters.put("imagePath", reportConfig.getInvoiceSignaturePath());
		}
		parameters.put("total", getTotalPrice(appointment));
		parameters.put("discount", appointment.getPayment().getDiscount() != null ? appointment.getPayment().getDiscount().toString() : "0");
		parameters.put("price", appointment.getPayment().getAmount());
		parameters.put("phone", appointment.getUser().getPhone());
		parameters.put("address", appointment.getUser().getAddress().getArea());
		addSerialNumbers(appointment.getTests());
		// JRBeanCollectionDataSource testSource = new
		// JRBeanCollectionDataSource(new ArrayList());
		parameters.put("labTests", appointment.getTests());
		appointment.setInvoiceData(generateReport(parameters, null, LAB_INVOICE_TEMPLATE));
	}

	private static Integer getTotalPrice(Appointment appointment) {
		if (appointment.getPayment().getDiscount() == null || appointment.getPayment().getAmount() == null) {
			return appointment.getPayment().getAmount();
		}
		return appointment.getPayment().getAmount() + appointment.getPayment().getDiscount();
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
