package com.ruanko.hwm.service;

import java.util.List;

import com.ruanko.hwm.bean.User;

public interface IUserService {
	public List<User> findAllUser();

	public void  deleteUserById(int userId);

	public void updateUser(int userId);

	public User findUser(int userId);
	
	public void addUser(User user);
	
	public User getUserByName(String username);
	
	public User getUserById(Integer id);
	
	public void updateUser(User user);

	public void updateCurrentUser(User newUser);
}
