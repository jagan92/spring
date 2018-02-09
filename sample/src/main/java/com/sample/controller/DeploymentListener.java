package com.sample.controller;

import java.util.HashSet;
import java.util.Properties;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.commons.lang3.StringUtils;
import org.quartz.Scheduler;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.sample.constants.AppConstants;

public class DeploymentListener implements ServletContextListener {
	// private static final Logger LOGGER = LogManager.getLogger();
	private static final String CLASS_NAME = DeploymentListener.class.getName();
	private static final String METHOD_CONTEXT_INIT = "contextInitialized";
	private static final String METHOD_CONTEXT_DESTROYED = "contextDestroyed";

	@Override
	public void contextInitialized(ServletContextEvent event) {
		ServletContext context = event.getServletContext();

		try {
			ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(context);
			Properties applicationProperties = (Properties) applicationContext.getBean("applicationProperties");
			String formInputCss = applicationProperties.getProperty(AppConstants.APP_FORM_INPUT_CSS);
			context.setAttribute(AppConstants.FORM_INPUT_CSS, formInputCss);
			String formTableCss = applicationProperties.getProperty(AppConstants.APP_FORM_TABLE_CSS);
			context.setAttribute(AppConstants.FORM_TABLE_CSS, formTableCss);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	@Override
	public void contextDestroyed(ServletContextEvent event) {
		// This method will be invoked only once
		ServletContext context = event.getServletContext();

		// grab the application context
		ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(context);
		try {
			// Get a reference to the Scheduler and shut it down
			// Scheduler scheduler = (Scheduler)
			// applicationContext.getBean("schedulerFactoryBean");
			// scheduler.shutdown(true);

			// Sleep for a bit so that we don't get any errors
			Thread.sleep(2000);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}