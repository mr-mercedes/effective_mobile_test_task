package com.effective_mobile.service;


import com.effective_mobile.domain.User;
import com.effective_mobile.dto.UserDto;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface UserService extends UserDetailsService { // security
	boolean save(UserDto userDTO);
	void save(User user);
	List<UserDto> getAll();

	User findByName(String name);
	void updateProfile(UserDto userDTO);
}
