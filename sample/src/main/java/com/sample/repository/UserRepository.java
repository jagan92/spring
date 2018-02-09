package com.sample.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.sample.entity.User;

public interface UserRepository extends JpaRepository<User, Long>{
	
	public User findByLoginId(String loginId);

}
