package com.sample.auditor;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.sample.repository.UserRepository;

/**
 * A custom {@link UserDetailsService} where user information is retrieved from
 * a JPA repository
 */

@Component
@Transactional(readOnly = true)
public class AuditorUserDetailsService implements UserDetailsService {

	@Autowired
	private UserRepository userRepository;
	

	@Autowired
	HttpSession httpSession;

	/**
	 * Returns a populated {@link UserDetails} object. The username is first
	 * retrieved from the database and then mapped to a {@link UserDetails}
	 * object.
	 */
	@Override
	public UserDetails loadUserByUsername(String loginId) {
		com.sample.entity.User user = userRepository.findByLoginId(loginId);
		if (user == null) {
			throw new UsernameNotFoundException("UserName " + loginId + " not found");
		}
		httpSession.setAttribute("loginUser", user);
		return new SecurityUser(user);
	}
}