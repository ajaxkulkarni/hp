package com.rns.healthplease.web.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import com.rns.healthplease.web.bo.domain.Appointment;
import com.rns.healthplease.web.util.CommonUtils;
import com.rns.healthplease.web.util.Constants;
import com.rns.healthplease.web.util.ExcelUtil;

public class ExcelBuilder extends AbstractExcelView implements Constants {

	@Override
	protected void buildExcelDocument(Map<String, Object> model, HSSFWorkbook workbook, HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Appointment> appointments = (List<Appointment>) model.get(MODEL_APPOINTMENTS);
		ExcelUtil.prepareAppointmentsExcel(workbook, appointments);
		response.setHeader("Content-Disposition", "attachment; filename=\"Health_Please" + CommonUtils.convertDate(new Date()) + ".xls\"");
	}

}
