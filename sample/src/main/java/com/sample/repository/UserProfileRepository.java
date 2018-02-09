package com.sample.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.sample.entity.UserProfile;

public interface UserProfileRepository extends JpaRepository<UserProfile, Long>{

}
