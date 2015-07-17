package com.alex.console.service;

import java.util.List;

import com.alex.console.model.User;

public interface IUserService {
	public User getUser(String id);  

	public List<User> getAllUser();  

	public int addUser(User user);  

	public boolean delUser(String id);  

	public boolean updateUser(User user);
	
	public User getUserByName(String userName);
}
