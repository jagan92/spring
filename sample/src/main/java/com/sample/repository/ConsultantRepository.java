package com.sample.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sample.entity.Consultant;

@Repository("consultantRepository")
public interface ConsultantRepository extends JpaRepository<Consultant, Long> {
	
}
