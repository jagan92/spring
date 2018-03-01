package com.sample.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sample.dto.ConsultantVO;
import com.sample.dto.HrPayVO;
import com.sample.dto.TransVO;
import com.sample.entity.Consultant;
import com.sample.entity.Trans;
import com.sample.repository.TransRepository;
import com.sample.service.ConsultantService;
import com.sample.service.TransService;
import com.sample.service.UserService;

@Controller
public class UserController {

	@Autowired
	UserService userService;

	@Autowired
	private ConsultantService consultantService;

	@Autowired
	private TransService transService;
	
	@Autowired
	private TransRepository transRepository;

	@RequestMapping(value = "/users.htm", method = RequestMethod.GET)
	public String users(HttpSession session, ModelMap model) {
		return "user/users-list";
	}

	@RequestMapping(value = "/consultant.htm", method = RequestMethod.GET)
	public String screen_consultant(@RequestParam(required = false) Long consultantId, ModelMap model) {
		ConsultantVO consultantVO = new ConsultantVO();
		if (consultantId != null) {
			consultantVO = consultantService.getConsultantVO(consultantId);
		}
		model.addAttribute("consultantVO", consultantVO);
		return "consultant";
	}

	@RequestMapping(value = "/consultant.htm", method = RequestMethod.POST)
	public String screen_consultant(@ModelAttribute ConsultantVO consultantVO, ModelMap model) {
		consultantService.saveConsultant(consultantVO);
		return "redirect:consultant.htm";
	}

	@RequestMapping(value = "/allconsultant.htm", method = RequestMethod.GET)
	public String consultants(ModelMap model) {
		List<ConsultantVO> consultantVOs = consultantService.getAllConsultant();
		model.addAttribute("consultantVOs", consultantVOs);
		return "consultantlist";
	}

	@RequestMapping(value = "/hr_pay.htm", method = RequestMethod.GET)
	public String payroll(@RequestParam(required = false) Long consultantId, ModelMap model) {
		List<ConsultantVO> consultantVOs = consultantService.getAllConsultant();
		HrPayVO hrPayVO = new HrPayVO();
		if (consultantId != null) {
			hrPayVO.setConsultantId(consultantId);
			ConsultantVO consultantVO = consultantService.getConsultantVO(consultantId);
			hrPayVO.setFirst_name(consultantVO.getFirst_name());
			hrPayVO.setLast_name(consultantVO.getLast_name());
			hrPayVO.setMiddle_name(consultantVO.getMiddle_name());
			hrPayVO.setrate_per(consultantVO.getRate_per());
			hrPayVO.sethour_day(consultantVO.getHour_day());
			hrPayVO.setday(consultantVO.getDay());
			hrPayVO.setsalary(consultantVO.getSalary());

		}
		// consultantService.mailConsultant(consultantId);
		model.addAttribute("consultantVOs", consultantVOs);
		model.addAttribute("hrPayVO", hrPayVO);
		return "hr_pay";
	}

	@RequestMapping(value = "/hr_pay_email.htm", method = RequestMethod.GET)
	public String payrollEmail(@RequestParam Long consultantId, ModelMap model) {
		List<ConsultantVO> consultantVOs = consultantService.getAllConsultant();
		HrPayVO hrPayVO = new HrPayVO();
		if (consultantId != null) {
			hrPayVO.setConsultantId(consultantId);
			ConsultantVO consultantVO = consultantService.getConsultantVO(consultantId);
			hrPayVO.setFirst_name(consultantVO.getFirst_name());
			hrPayVO.setLast_name(consultantVO.getLast_name());
			hrPayVO.setMiddle_name(consultantVO.getMiddle_name());
			hrPayVO.setrate_per(consultantVO.getRate_per());
			hrPayVO.sethour_day(consultantVO.getHour_day());
			hrPayVO.setday(consultantVO.getDay());
			hrPayVO.setsalary(consultantVO.getSalary());

		}
		consultantService.mailConsultant(consultantId);
		model.addAttribute("consultantVOs", consultantVOs);
		model.addAttribute("hrPayVO", hrPayVO);
		return "redirect:hr_pay.htm?consultantId=" + consultantId;
	}

	@RequestMapping(value = "/hr_pay.htm", method = RequestMethod.POST)
	public String payroll(@ModelAttribute HrPayVO hrPayVO, ModelMap model) {

		transService.saveTrans(hrPayVO);

		return "redirect:hr_pay.htm";
	}

	@RequestMapping(value = "/hr.htm", method = RequestMethod.GET)
	public String hr_consultant(@RequestParam(required = false) Long consultantId, ModelMap model) {
		ConsultantVO consultantVO = new ConsultantVO();
		if (consultantId != null) {
			consultantVO = consultantService.getConsultantVO(consultantId);
			consultantService.mailConsultant(consultantId);
		}
		model.addAttribute("consultantVO", consultantVO);
		return "hr";
	}

	@RequestMapping(value = "/consultant-delete.htm", method = RequestMethod.GET)
	public String removeAd(@RequestParam Long consultantId, ModelMap model) {
		consultantService.deleteConsultant(consultantId);
		return "redirect:allconsultant.htm";
	}

	@RequestMapping(value = "/hrmail.htm", method = RequestMethod.GET)
	public String mail(@RequestParam(required = false) Long consultantId, ModelMap model) {

		consultantService.mailConsultant(consultantId);

		return "hr_pay";
	}

	@RequestMapping(value = "/getStatus.htm", method = RequestMethod.GET)
	public @ResponseBody String getStatus(@RequestParam Long consultantId, @RequestParam String date, ModelMap model) {

		String lsReturn = "false";
		List<Trans> trans = transRepository.getDataByDate(consultantId.toString(), date);
		if(trans.size() > 0) {
			lsReturn = "true";
		}
		return lsReturn;
	}

}
