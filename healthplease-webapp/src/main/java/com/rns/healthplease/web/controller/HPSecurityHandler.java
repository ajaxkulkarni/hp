package com.rns.healthplease.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.rns.healthplease.web.bo.api.HPSessionManager;
import com.rns.healthplease.web.util.Constants;

public class HPSecurityHandler implements HandlerInterceptor {

	@Autowired(required = true)
	@Qualifier(value = "manager")
	private HPSessionManager manager;

	public void setManager(HPSessionManager manager) {
		this.manager = manager;
	}

	public HPSessionManager getManager() {
		return manager;
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		StringBuffer requestURL = request.getRequestURL();
		if (StringUtils.contains(requestURL, "/resources/")) {
			return true;
		}
		if (StringUtils.equals(StringUtils.removeEnd(requestURL.toString(), "/"), Constants.ROOT_URL)) {
			return true;
		}
		if (containsAny(requestURL, Constants.OPEN_URLS)) {
			return true;
		}
		if (manager.getUser().getId() != null) {
			if (manager.getUser().getGroup() != null && (manager.getUser().getGroup().getId().intValue() == 2 || manager.getUser().getGroup().getId().intValue() == 4 )) {
				if(manager.getUser().getGroup().getId().intValue() == 4) {
					if (containsAny(requestURL, Constants.CC_ALLOWED_URLS)) {
						return true;
					} else {
						response.sendRedirect(Constants.HOME_GET_URL);
						return false;
					}
				}
				return true;
			} else if (StringUtils.containsIgnoreCase(requestURL, "lab") && manager.getUser().getLab() == null) {
				response.sendRedirect(Constants.HOME_GET_URL);
				return false;
			} else if (StringUtils.containsIgnoreCase(requestURL, "admin") && (manager.getUser().getGroup() == null || manager.getUser().getGroup().getId().intValue() != 2)) {
				response.sendRedirect(Constants.HOME_GET_URL);
				return false;
			}
			return true;
		}
		response.sendRedirect(Constants.HOME_GET_URL);
		return false;
	}

	private boolean containsAny(StringBuffer requestURL, String[] allowedUrls) {
		String[] splitString = StringUtils.split(requestURL.toString(), "/");
		if (splitString.length == 0) {
			return true;
		}
		String relativeUrl = splitString[splitString.length - 1];
		relativeUrl = StringUtils.split(relativeUrl, "?")[0];
		for (String allowedUrl : allowedUrls) {
			if (StringUtils.equals(relativeUrl, allowedUrl)) {
				return true;
			}
		}
		return false;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

	}

}
