package com.sample.controller;

import com.sample.auditor.AuditorAwareService;
import com.sample.constants.AppConstants;
import com.sample.dto.UserVO;
import com.sample.entity.User;
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

	@RequestMapping(value = "login.htm", method = RequestMethod.GET)
	public String login(@RequestParam(required = false) String error, ModelMap model,
			RedirectAttributes redirectAttrs) {
		if (error != null) {
			if (error.equals("1")) {
				model.addAttribute(AppConstants.UI_ERROR, error);
			}
		}		
		return "auth/login";
	}
	
	@RequestMapping(value = "register.htm", method = RequestMethod.GET)
	public String register(@RequestParam(required = false) String error, ModelMap model,
			RedirectAttributes redirectAttrs) {
		UserVO userVO = new UserVO();
		model.addAttribute("userVO", userVO);
		return "auth/register";
	}
	
	@RequestMapping(value = "register.htm", method = RequestMethod.POST)
	public String register_post(@ModelAttribute UserVO userVO,
			RedirectAttributes redirectAttrs) {
		
		userService.saveUser(userVO);
		return "redirect:login.htm";
	}
	

}
