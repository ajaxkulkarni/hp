package com.rns.healthplease.web.util;

import org.apache.log4j.Logger;

public class LoggingUtil {

	private static Logger reportLogger = Logger.getLogger(LoggingUtil.class);

	public static void logMessage(String message) {
		reportLogger.info(message);
	}

}
