package com.pan.web.biz;

import com.pan.web.bean.User;



public interface UserBiz {
	public User loginUser(User user);// 登陆

	public int registerUser(User user);// 注册
	
	public boolean checkUser(String uname);//检验用户名
}
