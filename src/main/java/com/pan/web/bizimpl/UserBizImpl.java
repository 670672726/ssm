package com.pan.web.bizimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pan.web.bean.User;
import com.pan.web.biz.UserBiz;
import com.pan.web.dao.UserDao;


@Service
public class UserBizImpl implements UserBiz {
	
	@Autowired
	private UserDao userDao ;
	

	public User loginUser(User user) {
		// TODO Auto-generated method stub
		return userDao.queryUser(user);
	}

	public int registerUser(User user) {
		// TODO Auto-generated method stub
		if (userDao.queryUser(user) != null) {
			return 1;// 说明已经存在
		} else {
			boolean res = userDao.saveUser(user);
			System.out.println(res);
			if (res) {
				return 2;// 注册成功
			} else {
				return 3;// 注册失败
			}
		}

	}
	public boolean checkUser(String uname){
		List<User> queryAllUser = userDao.queryAllUser();
		for (User user : queryAllUser) {
			if (user.getUname().equals(uname)) {
				return false;
			}
		}
		return true;
		
	}

}
