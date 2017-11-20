package com.pan.web.bean;

import javax.validation.constraints.Pattern;

public class User {
	private int id;
	@Pattern(regexp="(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{4,8})",message="�û�������Ϊ6-16��ĸ��4-8λ����")
	private String uname;
	@Pattern(regexp="(^[a-zA-Z0-9_-]{6,16}$)",message="�������Ϊ6-16��ĸ������")
	private String upass;
	private int type;

	public User() {
		super();
	}

	public User(int id, String uname, String upass, int type) {
		super();
		this.id = id;
		this.uname = uname;
		this.upass = upass;
		this.type = type;
	}

	public User(String uname, String upass, int type) {
		super();
		this.uname = uname;
		this.upass = upass;
		this.type = type;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUpass() {
		return upass;
	}

	public void setUpass(String upass) {
		this.upass = upass;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}
}
