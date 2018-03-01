package com.sample.service;

import java.util.List;

import com.sample.dto.ConsultantVO;
import com.sample.dto.HrPayVO;
import com.sample.entity.Consultant;

public interface ConsultantService {
	public void saveConsultant(ConsultantVO consultantVO);
	public Consultant getConsultant(Long consultant);
	public ConsultantVO getConsultantVO(Long consultant);
	public List<ConsultantVO> getAllConsultant();
	void deleteConsultant(Long consultantId);
	void mailConsultant(Long consultantId);
}


