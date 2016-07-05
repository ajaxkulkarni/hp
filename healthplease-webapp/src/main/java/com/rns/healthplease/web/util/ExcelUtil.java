package com.rns.healthplease.web.util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;

import com.rns.healthplease.web.bo.domain.Appointment;
import com.rns.healthplease.web.bo.domain.TestParameter;
import com.rns.healthplease.web.dao.domain.Labs;
import com.rns.healthplease.web.dao.domain.TestLabs;
import com.rns.healthplease.web.dao.domain.Tests;

//Appointment Id	Appointment Date	Appointment Time	Test Name	Test Charge	Payment Type	Lab Name	Name	Contact No.	Address	Gender	Email ID	Print Required	Status

public class ExcelUtil {

	private static final String TEST_ID_COL = "Test ID";
	private static final int PARAMETER_NAME = 1;
	private static final int UNIT = 2;
	private static final int MALE_VALUE_LOWER = 3;
	private static final int MALE_VALUE_HIGHER = 4;
	private static final int FEMALE_VALUE_LOWER = 5;
	private static final int FEMALE_VALUE_HIGHER = 6;
	private static final int CHILD_VALUE_LOWER = 7;
	private static final int CHILD_VALUE_HIGHER = 8;
	private static final int RESULT_TYPE = 9;
	// private static final int LOW = 5;
	// private static final int HIGH = 6;
	private static final int METHOD = 10;
	private static final String EXCEL_FONT_ARIAL = "Arial";
	private static final String EXCEL_SHEET_APPOINTMENTS = "Appointments";
	private static final int TEST_ID = 1;
	private static final int LAB_ID = 2;
	private static final int TEST_CHARGES = 3;

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

	public static List<TestParameter> extractTestParameters(MultipartFile file) {

		FileInputStream inputStream = null;
		XSSFWorkbook workbook = null;
		List<TestParameter> parameters = new ArrayList<TestParameter>();
		try {
			inputStream = new FileInputStream(CommonUtils.multipartToFile(file));
			workbook = (XSSFWorkbook) WorkbookFactory.create(inputStream);
			Sheet firstSheet = workbook.getSheetAt(0);
			Iterator<Row> iterator = firstSheet.iterator();
			boolean startFound = false;
			int startCell = 0;
			while (iterator.hasNext()) {
				Row nextRow = iterator.next();
				Iterator<Cell> cellIterator = nextRow.cellIterator();
				int cellNo = 0;
				if (startFound) {
					TestParameter parameter = new TestParameter();
					parameter.setName(getCellValue(startCell, nextRow, PARAMETER_NAME));
					if(StringUtils.isEmpty(parameter.getName())) {
						continue;
					}
					parameter.setUnit(getCellValue(startCell, nextRow, UNIT));
					parameter.setNormalValueMale(StringUtils.join(getCellValue(startCell, nextRow, MALE_VALUE_LOWER),"-",getCellValue(startCell, nextRow, MALE_VALUE_HIGHER)));
					parameter.setNormalValueFemale(StringUtils.join(getCellValue(startCell, nextRow, FEMALE_VALUE_LOWER),"-",getCellValue(startCell, nextRow, FEMALE_VALUE_HIGHER)));
					parameter.setNormalValueChild(StringUtils.join(getCellValue(startCell, nextRow, CHILD_VALUE_LOWER),"-",getCellValue(startCell, nextRow, CHILD_VALUE_HIGHER)));
					parameter.setNormalValue(parameter.getNormalValueMale() != null ? parameter.getNormalValueMale() : parameter.getNormalValueFemale());
					parameter.setType(getCellValue(startCell, nextRow, RESULT_TYPE));
					parameter.setMethods(CommonUtils.getStrings(getCellValue(startCell, nextRow, METHOD)));
					parameters.add(parameter);
				} else {
					while (cellIterator.hasNext()) {
						Cell cell = cellIterator.next();
						if ("Parameter Name".equals(StringUtils.trimToEmpty(cell.getStringCellValue()))) {
							startFound = true;
							startCell = cellNo;
							break;
						}
						cellNo++;
					}
				}
			}

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (InvalidFormatException e) {
			e.printStackTrace();
		} finally {
			try {
				/*if (workbook != null) {
					workbook.close();
				}*/
				if (inputStream != null) {
					inputStream.close();
				}
			} catch (Exception e) {

			}
		}
		return parameters;
	}

	private static String getCellValue(int startCell, Row nextRow, int offset) {
		if(nextRow == null) {
			return null;
		}
		Cell cell = nextRow.getCell(startCell + offset);
		if(cell == null) {
			return null;
		}
		return StringUtils.trimToEmpty(cell.getStringCellValue());
	}
	
	private static Integer getNumCellValue(int startCell, Row nextRow, int offset) {
		if(nextRow == null) {
			return null;
		}
		Cell cell = nextRow.getCell(startCell + offset);
		if(cell == null) {
			return null;
		}
		return (int) cell.getNumericCellValue();
	}
	
	public static List<TestLabs> extractTestLabMappings(MultipartFile file) {

		FileInputStream inputStream = null;
		XSSFWorkbook workbook = null;
		List<TestLabs> testLabs = new ArrayList<TestLabs>();
		try {
			inputStream = new FileInputStream(CommonUtils.multipartToFile(file));
			workbook = (XSSFWorkbook) WorkbookFactory.create(inputStream);
			Sheet firstSheet = workbook.getSheetAt(0);
			Iterator<Row> iterator = firstSheet.iterator();
			boolean startFound = false;
			int startCell = 0;
			while (iterator.hasNext()) {
				Row nextRow = iterator.next();
				Iterator<Cell> cellIterator = nextRow.cellIterator();
				int cellNo = 0;
				if (startFound) {
					TestLabs testLab = new TestLabs();
					Tests test = new Tests();
					Integer testId = getNumCellValue(startCell, nextRow, TEST_ID);
					if(testId == null) {
						continue;
					}
					test.setId(Integer.valueOf(testId));
					testLab.setTest(test);
					Labs lab = new Labs();
					lab.setId(Integer.valueOf(getNumCellValue(startCell, nextRow, LAB_ID)));
					testLab.setLab(lab);
					testLab.setLabPrice(getNumCellValue(startCell, nextRow, TEST_CHARGES).shortValue());
					testLabs.add(testLab);
				} else {
					while (cellIterator.hasNext()) {
						Cell cell = cellIterator.next();
						if (TEST_ID_COL.equals(StringUtils.trimToEmpty(cell.getStringCellValue()))) {
							startFound = true;
							startCell = cellNo;
							break;
						}
						cellNo++;
					}
				}
			}

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (InvalidFormatException e) {
			e.printStackTrace();
		} finally {
			try {
				/*if (workbook != null) {
					workbook.close();
				}*/
				if (inputStream != null) {
					inputStream.close();
				}
			} catch (Exception e) {

			}
		}
		return testLabs;
	}
	
}
