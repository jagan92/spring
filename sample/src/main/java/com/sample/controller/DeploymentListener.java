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

	@Override
	public void contextInitialized(ServletContextEvent event) {
		ServletContext context = event.getServletContext();

		try {
			ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(context);
			Properties applicationProperties = (Properties) applicationContext.getBean("applicationProperties");
			
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
			Thread.sleep(2000);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}