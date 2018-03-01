package com.sample.service;

import java.util.Arrays;
import java.util.HashSet;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.sample.dto.UserVO;
import com.sample.entity.User;
import com.sample.repository.UserRepository;

@Service("userService")
public class UserServiceImpl implements UserService{

	@Autowired
	private UserRepository userRepository;
	
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Override
	public User findUserByEmail(String email) {
		return userRepository.findByLoginId(email);
	}

	@Override
	public void saveUser(UserVO userVO) {
		try {
			User user = new User();
			BeanUtils.copyProperties(user, userVO);
			user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
	        user.setActive(1);
	        user.setRole("Admin");
			userRepository.save(user);	
		}catch(Exception e) {
			System.out.println(e);
		}
		
	}

}
