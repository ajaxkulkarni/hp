package com.rns.healthplease.web.util;

import org.apache.log4j.Logger;

public class LoggingUtil {

	private static Logger reportLogger = Logger.getLogger(LoggingUtil.class);
	
	private static Logger emailLogger = Logger.getLogger("email");
	
	public static void logMessage(String message) {
		reportLogger.info(message);
	}
	
	public static void mailLog(String message) {
		emailLogger.info(message);
	}

}
