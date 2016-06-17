package com.rns.healthplease.web.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.util.Date;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;

import com.lowagie.text.BadElementException;
import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.Image;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.Rectangle;
import com.lowagie.text.pdf.PdfContentByte;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import com.lowagie.text.pdf.draw.DottedLineSeparator;
import com.lowagie.text.pdf.draw.LineSeparator;
import com.rns.healthplease.web.bo.domain.Appointment;
import com.rns.healthplease.web.bo.domain.LabTest;
import com.rns.healthplease.web.bo.domain.TestParameter;

public class PdfUtil {

	private static final int DOCUMENT_FONT = Font.COURIER;

	public static File createPdf(Appointment appointment) {
		try {
			File file = new File("test_report.pdf");
			FileOutputStream fileout = new FileOutputStream(file);
			Document document = new Document();
			PdfWriter.getInstance(document, fileout);
			prepareReportDocument(appointment, document);
			document.close();
			return file;
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static void prepareReportDocument(Appointment appointment, Document document) throws DocumentException, BadElementException {
		document.addAuthor("HP");
		document.addTitle("HP Test Report");
		/*
		 * PdfWriter writer; try { writer = PdfWriter.getInstance(document, new
		 * FileOutputStream("test_report.pdf")); } catch (FileNotFoundException
		 * e1) { e1.printStackTrace(); }
		 */
		document.open();

		/*
		 * PdfContentByte canvas = writer.getDirectContent(); Rectangle rect =
		 * new Rectangle(36, 36, 559, 806); rect.setBorder(Rectangle.BOX);
		 * rect.setBorderWidth(2); canvas.rectangle(rect);
		 */

		// chunk.setBackground(Color.CYAN);
		Paragraph labTitle = getParagraph(appointment.getLab().getName());
		labTitle.setAlignment(Element.ALIGN_CENTER);
		labTitle.getFont().setStyle(Font.BOLD);
		LineSeparator line = new LineSeparator();
		//dottedline.setOffset(-2);
		//dottedline.setGap(2f);
		line.setPercentage(100);

		// PdfPCell titleCell = new PdfPCell(labTitle);
		// titleCell.setBorder(Rectangle.BOTTOM);

		document.add(labTitle);
		Paragraph address = getParagraph(appointment.getLab().getAddress());
		address.setAlignment(Element.ALIGN_CENTER);
		address.getFont().setSize(10);
		document.add(address);
		document.add(getParagraph("\n"));
		document.add(line);
		document.add(getParagraph("\n"));
		document.add(getParagraph("\n"));

		document.add(getParagraph("Appointment ID :" + appointment.getId()));
		document.add(getParagraph("User Name :" + appointment.getUser().getFirstName()));
		document.add(getParagraph("Date :" + CommonUtils.convertDate(new Date())));
		document.add(getParagraph("\n"));
		document.add(line);
		document.add(getParagraph("\n"));
		
		Image image;
		try {
			image = Image.getInstance("http://db.puneconnect.com/site_media/company_logos/Health_Please_Logo_png.png");
			image.setAbsolutePosition(20f, 750f);
			image.scalePercent(30);
			document.add(image);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		if (CollectionUtils.isEmpty(appointment.getTests())) {
			return;
		}

		
		for (LabTest test : appointment.getTests()) {
			if (CollectionUtils.isEmpty(test.getParameters())) {
				continue;
			}
			int i = 1;
			PdfPTable table = new PdfPTable(5);
			Paragraph testName = getParagraph("Test : " + test.getName());
			testName.getFont().setStyle(Font.BOLD);
			document.add(testName);
			document.add(getParagraph("\n"));
			document.add(line);
			document.add(getParagraph("\n"));
			table.addCell(getPdfPCell("Sr No.", Font.BOLD));
			table.addCell(getPdfPCell("Parameter Name", Font.BOLD));
			table.addCell(getPdfPCell("Parameter Value", Font.BOLD));
			table.addCell(getPdfPCell("Normal Value", Font.BOLD));
			table.addCell(getPdfPCell("Unit", Font.BOLD));
			// PdfPCell cell = new PdfPCell("");
			for (TestParameter parameter : test.getParameters()) {
				if (StringUtils.isEmpty(parameter.getActualValue())) {
					continue;
				}
				table.addCell(getPdfPCell(String.valueOf(i), 0));
				table.addCell(getPdfPCell(parameter.getName(), 0));
				table.addCell(getPdfPCell(parameter.getActualValue(), 0));
				table.addCell(getPdfPCell(parameter.getNormalValue(), 0));
				table.addCell(getPdfPCell(parameter.getUnit(), 0));
				i++;
			}
			document.add(table);
			document.add(getParagraph("\n"));
		}
	}

	private static PdfPCell getPdfPCell(String string, int style) {
		Phrase phrase = new Phrase(string);
		Font font = new Font(DOCUMENT_FONT);
		font.setStyle(style);
		if (style == Font.BOLD) {
			font.setStyle(Font.UNDERLINE);
		}
		phrase.setFont(font);
		PdfPCell cell = new PdfPCell(phrase);
		cell.setBorder(Rectangle.NO_BORDER);
		return cell;
	}

	private static Paragraph getParagraph(String text) {
		// Chunk chunk = new Chunk(text);
		Paragraph paragraph = new Paragraph();
		Font font = new Font(DOCUMENT_FONT);
		/*
		 * font.setStyle(Font.UNDERLINE); font.setStyle(Font.ITALIC);
		 */
		paragraph.setFont(font);
		paragraph.add(text);
		paragraph.setAlignment(Element.ALIGN_LEFT);
		return paragraph;
	}

}
