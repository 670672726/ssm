package com.pan.web.test;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;




import com.pan.web.bean.DVD;
import com.pan.web.bean.User;
import com.pan.web.biz.DVDBiz;
import com.pan.web.biz.UserBiz;


public class MainDVDbiz {

	private static UserBiz userBiz;

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ApplicationContext applicationContext=new ClassPathXmlApplicationContext("applicationContext.xml");
		userBiz = (UserBiz) applicationContext.getBean("userBizImpl");
		User user=new User("p1aqqsqaaaaaaaaaafadsa2","123456",0);
		int b=userBiz.registerUser(user);
		System.out.println(b);
	}

}
