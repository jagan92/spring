package com.sample.controller;

import com.sample.auditor.AuditorAwareService;
import com.sample.constants.AppConstants;
import com.sample.dto.UserVO;
import com.sample.logging.LogManager;
import com.sample.logging.Logger;
import com.sample.service.UserService;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = "/auth")
public class AuthenticationController {

	@Autowired
	UserService userService;
	
	@Autowired
	private AuditorAwareService auditorAwareService;

	@Autowired
	HttpSession httpSession;

	private static final Logger LOGGER = LogManager.getLogger();
	private static final String CLASS_NAME = AuthenticationController.class.getName();
	private static final String METHOD_FORGOT_PASSWORD = "forgotPassword";

	@RequestMapping(value = "login.htm", method = RequestMethod.GET)
	public String login(@RequestParam(required = false) String error, ModelMap model,
			RedirectAttributes redirectAttrs) {
		if (error != null) {
			if (error.equals("1")) {
				redirectAttrs.addFlashAttribute(AppConstants.UI_ERROR, "Invalid User!!");
				redirectAttrs.addFlashAttribute(AppConstants.UI_ALERT_TITLE, "Login");
				model.addAttribute(AppConstants.UI_ERROR, error);
			}
		}
		/*
		 * String ResetMsgLogin = (String)
		 * httpSession.getAttribute("ResetMsgLogin"); if(ResetMsgLogin != null){
		 * model.addAttribute("ResetMsgLogin", ResetMsgLogin);
		 * httpSession.removeAttribute("ResetMsgLogin"); }
		 */
		return "auth/login";
	}

	@RequestMapping(value = "forgot.htm", method = RequestMethod.GET)
	public String forgot(ModelMap model) {
		UserVO userVO = new UserVO();
		model.addAttribute("userVO", userVO);
		return "auth/reset-password";
	}
	
	

	@RequestMapping(value = "resetPassword.htm", method = RequestMethod.POST)
	public String getNewPassword(@ModelAttribute UserVO userVO, RedirectAttributes redirectAttrs) {
		
		return "auth/login";
	}
}
