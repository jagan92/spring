package com.sample.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.sample.entity.Trans;

public interface TransRepository extends JpaRepository<Trans, Long> {

	@Query("select t from Trans t where t.consultantId=?1 and t.trans_date=?2")
	public List<Trans> getDataByDate(String consultantId, String strDate);
	
}
