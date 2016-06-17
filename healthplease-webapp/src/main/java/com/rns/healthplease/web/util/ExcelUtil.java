package com.rns.healthplease.web.util;

import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;

import com.rns.healthplease.web.bo.domain.Appointment;

//Appointment Id	Appointment Date	Appointment Time	Test Name	Test Charge	Payment Type	Lab Name	Name	Contact No.	Address	Gender	Email ID	Print Required	Status

public class ExcelUtil {

	private static final String EXCEL_FONT_ARIAL = "Arial";
	private static final String EXCEL_SHEET_APPOINTMENTS = "Appointments";

	public static void prepareAppointmentsExcel(HSSFWorkbook workbook, List<Appointment> appointments) {

		HSSFSheet sheet = workbook.createSheet(EXCEL_SHEET_APPOINTMENTS);
		sheet.setDefaultColumnWidth(30);

		// create style for header cells
		CellStyle style = workbook.createCellStyle();
		Font font = workbook.createFont();
		font.setFontName(EXCEL_FONT_ARIAL);
		style.setFillForegroundColor(HSSFColor.BLUE.index);
		style.setFillPattern(CellStyle.SOLID_FOREGROUND);
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		font.setColor(HSSFColor.WHITE.index);
		style.setFont(font);

		// create header row
		HSSFRow header = sheet.createRow(0);

		header.createCell(0).setCellValue("Appointment Id");
		header.getCell(0).setCellStyle(style);

		header.createCell(1).setCellValue("Date");
		header.getCell(1).setCellStyle(style);

		header.createCell(2).setCellValue("Time");
		header.getCell(2).setCellStyle(style);

		header.createCell(3).setCellValue("Tests");
		header.getCell(3).setCellStyle(style);

		header.createCell(4).setCellValue("Charges");
		header.getCell(4).setCellStyle(style);

		header.createCell(5).setCellValue("Payment Type");
		header.getCell(5).setCellStyle(style);

		header.createCell(6).setCellValue("Lab name");
		header.getCell(6).setCellStyle(style);

		header.createCell(7).setCellValue("Name");
		header.getCell(7).setCellStyle(style);

		header.createCell(8).setCellValue("Contact no");
		header.getCell(8).setCellStyle(style);

		header.createCell(9).setCellValue("Address");
		header.getCell(9).setCellStyle(style);

		header.createCell(10).setCellValue("Gender");
		header.getCell(10).setCellStyle(style);

		header.createCell(11).setCellValue("Email ID");
		header.getCell(11).setCellStyle(style);

		header.createCell(12).setCellValue("Print Required");
		header.getCell(12).setCellStyle(style);

		header.createCell(13).setCellValue("Status");
		header.getCell(13).setCellStyle(style);

		int rowCount = 1;
		
		if (CollectionUtils.isEmpty(appointments)) {
			return;
		}

		for (Appointment appointment : appointments) {
			HSSFRow aRow = sheet.createRow(rowCount++);
			aRow.createCell(0).setCellValue(appointment.getId());
			aRow.createCell(1).setCellValue(CommonUtils.convertDate(appointment.getDate()));
			if (appointment.getSlot() != null) {
				aRow.createCell(2).setCellValue(appointment.getSlot().getStartTime() + "-" + appointment.getSlot().getEndTime());
			}
			aRow.createCell(3).setCellValue(CommonUtils.getTests(appointment.getTests()));
			if (appointment.getPayment() != null) {
				aRow.createCell(4).setCellValue(appointment.getPayment().getAmount());
				aRow.createCell(5).setCellValue(appointment.getPayment().getType().name());
			}
			if (appointment.getLab() != null) {
				aRow.createCell(6).setCellValue(appointment.getLab().getName());
			}
			if (appointment.getUser() != null) {
				aRow.createCell(7).setCellValue(appointment.getUser().getFirstName());
				aRow.createCell(8).setCellValue(appointment.getUser().getPhone());
				aRow.createCell(10).setCellValue(appointment.getUser().getGender());
				aRow.createCell(11).setCellValue(appointment.getUser().getEmail());
			}
			if (appointment.getAddress() != null) {
				aRow.createCell(9).setCellValue(appointment.getAddress().toString());
			}
			aRow.createCell(12).setCellValue(CommonUtils.getAffirmation(appointment.getPrintRequired()));
			if (appointment.getStatus() != null) {
				aRow.createCell(13).setCellValue(appointment.getStatus().getName());
			}
		}

	}

}
