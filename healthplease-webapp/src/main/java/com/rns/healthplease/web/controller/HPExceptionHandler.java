package com.rns.healthplease.web.controller;

import org.apache.commons.lang.exception.ExceptionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rns.healthplease.web.util.LoggingUtil;

@ControllerAdvice
public class HPExceptionHandler {

	@ExceptionHandler(value = Exception.class)
	public @ResponseBody String onGenericException(Exception exception) {
		exception.printStackTrace();
		LoggingUtil.logMessage(exception.getMessage());
		LoggingUtil.logMessage(ExceptionUtils.getFullStackTrace(exception));
		LoggingUtil.mailLog(ExceptionUtils.getFullStackTrace(exception));
		return StringUtils.isNotEmpty(exception.getMessage()) ? exception.getMessage() : "Error occurred while processing!";
	}
	
}
