package com.effective_mobile.service;

import com.effective_mobile.dto.UserDTO;
import org.springframework.security.core.userdetails.UserDetailsService;

public interface UserService extends UserDetailsService { //security
    boolean save(UserDTO userDTO);
}
