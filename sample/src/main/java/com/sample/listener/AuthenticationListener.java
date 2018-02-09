package com.sample.listener;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.security.authentication.event.AbstractAuthenticationEvent;
import org.springframework.security.authentication.event.AbstractAuthenticationFailureEvent;
import org.springframework.security.authentication.event.AuthenticationSuccessEvent;
import org.springframework.security.web.authentication.session.SessionFixationProtectionEvent;
import org.springframework.stereotype.Component;

import com.sample.auditor.SecurityUser;
import com.sample.entity.AppAccessLog;
import com.sample.service.UserService;

import eu.bitwalker.useragentutils.Browser;
import eu.bitwalker.useragentutils.OperatingSystem;
import eu.bitwalker.useragentutils.UserAgent;

@Component
public class AuthenticationListener implements ApplicationListener<AbstractAuthenticationEvent> {

	@Autowired
	private UserService userService;

	@Autowired
	private HttpServletRequest httpRequest;

	@Override
	public void onApplicationEvent(AbstractAuthenticationEvent appEvent) {

		// Get an UserAgentStringParser and analyze the requesting client
		UserAgent userAgent = UserAgent.parseUserAgentString(httpRequest.getHeader("User-Agent"));
		OperatingSystem os = userAgent.getOperatingSystem();
		Browser browser = userAgent.getBrowser();

		String ipAddress = httpRequest.getHeader("X-FORWARDED-FOR");
		if (ipAddress == null) {
			ipAddress = httpRequest.getRemoteAddr();
		}
		AppAccessLog appAccessLog = new AppAccessLog(httpRequest.getSession().getId(), null, ipAddress, ipAddress,
				os.getName(), browser.getName(), AppAccessLog.STATUS_SUCCESS);
		if (appEvent instanceof AuthenticationSuccessEvent) {
			AuthenticationSuccessEvent event = (AuthenticationSuccessEvent) appEvent;
			SecurityUser securityUser = (SecurityUser) event.getAuthentication().getPrincipal();
			// userService.updateSuccessfulLogin(securityUser.getUsername());
		} else if (appEvent instanceof AbstractAuthenticationFailureEvent) {
			AbstractAuthenticationFailureEvent event = (AbstractAuthenticationFailureEvent) appEvent;
			String userName = (String) event.getAuthentication().getPrincipal();
			// userService.updateFailureLogin(userName);

			appAccessLog.setLoginId(userName);
			appAccessLog.setStatus(event.getException().getMessage());
			//userService.saveAppAccessLog(appAccessLog);
		} else if (appEvent instanceof SessionFixationProtectionEvent) {
			SessionFixationProtectionEvent event = (SessionFixationProtectionEvent) appEvent;
			SecurityUser securityUser = (SecurityUser) event.getAuthentication().getPrincipal();
			// Post Authentication Success Event, Session Fixation Protection Event is
			// triggered with New HTTP Session id.
			// Log the New HTTP Session id.
			appAccessLog.setLoginId(securityUser.getUsername());
			//userService.saveAppAccessLog(appAccessLog);
		}
	}
}
