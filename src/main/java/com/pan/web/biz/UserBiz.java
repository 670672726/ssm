package com.pan.web.biz;

import com.pan.web.bean.User;



public interface UserBiz {
	public User loginUser(User user);// ��½

	public int registerUser(User user);// ע��
	
	public boolean checkUser(String uname);//�����û���
}
