package com.sample.service;

import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sample.dto.HrPayVO;

import com.sample.entity.Trans;

import com.sample.repository.TransRepository;

@Service("transService")
public class TransServiceImpl implements TransService {

	@Autowired
	private TransRepository transRepository;
	
	@Autowired
	private ConsultantService consultantService;

	public void saveTrans(HrPayVO hrPayVO) {
		try {
			Trans trans = new Trans();
			BeanUtils.copyProperties(trans, hrPayVO);
			List<Trans> transList = transRepository.getDataByDate(hrPayVO.getConsultantId().toString(), hrPayVO.gettrans_date());
			if(transList.size() > 0) {
				trans = transList.get(0);
				trans.setno_days(hrPayVO.getno_days());
				trans.setno_hours(hrPayVO.getno_hours());
				trans.settake_home(hrPayVO.gettake_home());
				trans.settrans_date(hrPayVO.gettrans_date());
			}
			transRepository.save(trans);
			//Send Mail
			consultantService.mailConsultant(hrPayVO.getConsultantId(), hrPayVO.gettrans_date());
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	@Override
	public Trans getTrans(Long consultantId, String strDate) {
		Trans trans = new Trans();
		List<Trans> transList = transRepository.getDataByDate(consultantId.toString(), strDate);
		if(transList.size() > 0) {
			trans = transList.get(0);
		} else {
			trans = null;
		}
		return trans;
	}

	@Override
	public Trans getTrans1(Long consultantId, String strDate) {
		Trans trans = new Trans();
		
		trans = transRepository.getDataByDate1(consultantId.toString(), strDate);
		
		
		return trans;
		
		
		
	}
	
	
	
	
	@Override
	public boolean updateTrans(Long consultantId, String strDate) {
		boolean isSave = true;
		Trans trans = new Trans();
		List<Trans> transList = transRepository.getDataByDate(consultantId.toString(), strDate);
		if(transList.size() > 0) {
			trans = transList.get(0);
			trans.setIs_paid('Y');
			transRepository.save(trans);
			isSave = true;
		} else {
			isSave = false;
		}
		return isSave;
	}

}
