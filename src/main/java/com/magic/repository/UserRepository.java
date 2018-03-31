package com.magic.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.*;

import com.magic.domain.User;

@Repository("userRepository")
public interface UserRepository extends CrudRepository<User, Integer>{
	
	public User getByUsernameAndPassword(String username,String password);

}
