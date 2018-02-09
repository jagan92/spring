package com.sample.repository;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sample.entity.AppAccessLog;

public interface AppAccessLogRepository extends JpaRepository<AppAccessLog, Long>, Serializable {

}
