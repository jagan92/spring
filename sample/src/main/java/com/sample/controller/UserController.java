package com.sample.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import com.sample.service.UserService;

@Controller
public class UserController {

	@Autowired
	UserService userService;


//	@RequestMapping(value = "/users.htm", method = RequestMethod.GET)
//	public String users(HttpSession session, ModelMap model) {
//		List<UserVO> userVOs = userService.listUsers();
//		model.addAttribute("userVO", userVOs);
//		return "user/users-list";
//	}
	
	@RequestMapping(value = "/userProfile.htm")
	public String userProfile(ModelMap model) {
		return "user/user-profile";
	}

}
