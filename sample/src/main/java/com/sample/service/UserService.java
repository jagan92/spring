package com.sample.service;

import com.sample.dto.UserVO;
import com.sample.entity.User;

public interface UserService {
	public User findUserByEmail(String email);
	public void saveUser(UserVO userVO);
}
