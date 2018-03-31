package com.magic.services;

import com.magic.domain.User;

public interface UserService {
	public User getUser(String username,String password);
	public boolean modifyPassword(Integer userId,String password); 
}
