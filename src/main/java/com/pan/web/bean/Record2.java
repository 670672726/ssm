package com.pan.web.bean;

public class Record2 {
	private int id;
	private int did;
	private String uname;
	private String dname;
	private String lendTime;
	private String returnTime;

	public Record2() {
		super();
	}

	public Record2(int id, int did, String uname, String dname,
			String lendTime, String returnTime) {
		super();
		this.id = id;
		this.did = did;
		this.uname = uname;
		this.dname = dname;
		this.lendTime = lendTime;
		this.returnTime = returnTime;
	}

	public Record2(int did, String uname, String dname, String lendTime,
			String returnTime) {
		super();
		this.did = did;
		this.uname = uname;
		this.dname = dname;
		this.lendTime = lendTime;
		this.returnTime = returnTime;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getDid() {
		return did;
	}

	public void setDid(int did) {
		this.did = did;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public String getLendTime() {
		return lendTime;
	}

	public void setLendTime(String lendTime) {
		this.lendTime = lendTime;
	}

	public String getReturnTime() {
		return returnTime;
	}

	public void setReturnTime(String returnTime) {
		this.returnTime = returnTime;
	}
}
