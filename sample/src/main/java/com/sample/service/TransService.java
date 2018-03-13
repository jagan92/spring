package com.sample.service;

import com.sample.dto.HrPayVO;
import com.sample.entity.Trans;

public interface TransService {
	public void saveTrans(HrPayVO hrPayVO);
	public Trans getTrans(Long consultantId, String strDate);
	public Trans getTrans1(Long consultantId, String strDate);
	public boolean updateTrans(Long consultantId, String strDate);
}
