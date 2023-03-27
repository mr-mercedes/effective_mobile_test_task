package com.effective_mobile.dao;


import com.effective_mobile.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
	User findFirstByName(String name);
}
