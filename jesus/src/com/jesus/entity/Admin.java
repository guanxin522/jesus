package com.jesus.entity;
/**
* @author Chen Guanxin
* @date 2017年9月21日 下午4:04:06
* 
*/
public class Admin {
	private String aid, aname, apwd;

	public Admin() {
	}

	public Admin(String aid, String aname, String apwd) {
		super();
		this.aid = aid;
		this.aname = aname;
		this.apwd = apwd;
	}

	public String getAid() {
		return aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
	}

	public String getAname() {
		return aname;
	}

	public void setAname(String aname) {
		this.aname = aname;
	}

	public String getApwd() {
		return apwd;
	}

	public void setApwd(String apwd) {
		this.apwd = apwd;
	}
	
}
