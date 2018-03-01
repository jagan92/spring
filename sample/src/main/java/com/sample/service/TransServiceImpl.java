package com.sample.service;

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
	
	
	
	public void saveTrans(HrPayVO hrPayVO) {
		try {
			Trans trans = new Trans();
			BeanUtils.copyProperties(trans, hrPayVO);
			transRepository.save(trans);
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
