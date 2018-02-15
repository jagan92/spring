package com.sample.controller;

import com.sample.service.UserService;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sample.auditor.AuditorAwareService;
import com.sample.constants.AppConstants;
import com.sample.dto.UserPreferences;

@Controller
public class AccessController {
	
	@Autowired
	private AuditorAwareService auditorAwareService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private UserPreferences pref;
	
	@RequestMapping(value = "/home.htm")
	public String statusCheck(Principal principal, HttpServletRequest request, HttpSession session,
			HttpServletResponse response) {
				
		return "redirect:/dashboard.htm";	}

}
