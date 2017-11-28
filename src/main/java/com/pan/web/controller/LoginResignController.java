package com.pan.web.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;



import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pan.web.bean.Msg;
import com.pan.web.bean.User;
import com.pan.web.bizimpl.UserBizImpl;

@Controller
public class LoginResignController {
	@Autowired
	private UserBizImpl uImpl;
	
	
	@RequestMapping("/login")
	@ResponseBody
	public Msg login(User user) {
		String uname=user.getUname();
		String upass=user.getUpass();
		int type=user.getType();
		User loginuser=new User(uname, upass, type);
		if(uImpl.loginUser(loginuser)!=null){
			int uid = uImpl.loginUser(loginuser).getId();
			return Msg.sucess().add("uname", uname).add("uid", uid).add("type", type);			
		}else {
			return Msg.fail();
		}	
	}
	@RequestMapping("/resgin")
	@ResponseBody
	public Msg resgin(@Validated User user,BindingResult result) {
		Map<String, Object> map=new HashMap<>();
		System.out.println(result.hasErrors());
		if (result.hasErrors()) {
			//校验失败
			List<FieldError> fieldErrors = result.getFieldErrors();
			for (FieldError fieldError : fieldErrors) {
				System.out.println("错误的字段名"+fieldError.getField());
				System.out.println("错误的字段信息"+fieldError.getDefaultMessage());
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.fail().add("errorFileds", map);
		}else {
			int i = uImpl.registerUser(user);
			System.out.println(i);
			if(i==2){
				return Msg.sucess();
			}else {
				return Msg.fail();
			}	
		}
		
	}
	@RequestMapping("/checkuser")
	@ResponseBody
	public Msg checkuser(@RequestParam(value="uname")String uname) {
		boolean flag = uImpl.checkUser(uname);
		if (flag) {
			return Msg.sucess();
		}else {
			return Msg.fail();
		}
	}
}
