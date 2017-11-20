package com.pan.web.dao;

import java.util.List;

import com.pan.web.bean.User;



public interface UserDao {
	public boolean saveUser(User user);

	public boolean delUser(int id);

	public boolean updateUser(User user);

	public User queryUser(User user);
	
	public List<User> queryAllUser();
}
