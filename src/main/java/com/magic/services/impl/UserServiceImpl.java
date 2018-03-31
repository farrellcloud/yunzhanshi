package com.magic.services.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.magic.domain.User;
import com.magic.repository.UserRepository;
import com.magic.services.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepository;

	
	public User getUser(String username,String password){
		User user = userRepository.getByUsernameAndPassword(username, password);
		return user;
	}
	
	public boolean modifyPassword(Integer userId,String password){
		User user = userRepository.findOne(userId);
		if(user != null){
			user.setPassword(password);
			userRepository.save(user);
			return true;
		}
		return false;
	}
}
