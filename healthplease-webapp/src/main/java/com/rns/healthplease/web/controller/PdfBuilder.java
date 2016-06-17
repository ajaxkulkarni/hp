package com.rns.healthplease.web.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.document.AbstractPdfView;

import com.lowagie.text.Document;
import com.lowagie.text.pdf.PdfWriter;
import com.rns.healthplease.web.bo.domain.Appointment;
import com.rns.healthplease.web.util.Constants;
import com.rns.healthplease.web.util.PdfUtil;

public class PdfBuilder extends AbstractPdfView implements Constants {

	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document document, PdfWriter writer, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Appointment appointment = (Appointment) model.get(MODEL_APPOINTMENT);
		if (appointment != null) {
			PdfUtil.prepareReportDocument(appointment, document);
		}
	}

}
