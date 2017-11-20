package com.pan.web.bean;

import java.util.HashMap;
import java.util.Map;

public class Msg {
	//100-SECESS,200-FALSE
	private int code;
	private String message;
	
	private Map<String, Object> extend=new HashMap<String, Object>();
	
	
    public static Msg sucess(){
    	Msg result=new Msg();
    	result.setCode(100);
    	result.setMessage("处理成功！");
    	return result;
    	
    }
    public static Msg fail(){
    	Msg result =new Msg();
    	result.setCode(400);
    	result.setMessage("处理失败");
    	return result;
    }
    public Msg add(String key, Object value){
    	this.getExtend().put(key, value);
    	return this;
    	
    }
	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Map<String, Object> getExtend() {
		return extend;
	}

	public void setExtend(Map<String, Object> extend) {
		this.extend = extend;
	}
	
}
