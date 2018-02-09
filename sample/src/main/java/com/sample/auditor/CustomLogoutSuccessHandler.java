package com.sample.auditor;

import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.web.context.support.WebApplicationContextUtils;

public class CustomLogoutSuccessHandler implements LogoutSuccessHandler {
	@Autowired
	HttpSession session;

	// private static final Logger LOGGER = LogManager.getLogger();
	private static final String CLASS_NAME = CustomLogoutSuccessHandler.class.getName();
	private static final String FUNCTION_NAME = "onLogoutSuccess";

	@Override
	public void onLogoutSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse,
			Authentication authentication) {
		String contextPath = httpServletRequest.getContextPath();
		ApplicationContext applicationContext = WebApplicationContextUtils
				.getWebApplicationContext(httpServletRequest.getServletContext());
		Properties applicationProperties = (Properties) applicationContext.getBean("applicationProperties");
		httpServletRequest.getSession().invalidate();
	}
}
