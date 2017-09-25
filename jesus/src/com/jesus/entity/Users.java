package com.jesus.entity;

import java.util.Set;
/**
 * 
 * @author Chen Guanxin
 * @Date:2017年9月21日下午6:10:29
 */
public class Users {
	private String uid, uname, upwd, realname ,email, tel, address;
	
	public Users() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Users(String uid, String uname, String upwd, String realname, String email, String tel, String address,
			Set<OrderSon> orderson) {
		super();
		this.uid = uid;
		this.uname = uname;
		this.upwd = upwd;
		this.realname = realname;
		this.email = email;
		this.tel = tel;
		this.address = address;
		this.orderson = orderson;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	private Set <OrderSon >orderson;
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUpwd() {
		return upwd;
	}
	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Set getOrderson() {
		return orderson;
	}
	public void setOrderson(Set orderson) {
		this.orderson = orderson;
	}
}
