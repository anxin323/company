package com.alex.console.dao;

import java.util.List;

import com.alex.console.model.User;

public interface IUserDao {
	public User getUser(String id);  

	public List<User> getAllUser();  

	public int addUser(User user);  

	public boolean delUser(String id);  

	public boolean updateUser(User user);  
	
	public User getUserByName(String userName);
}
