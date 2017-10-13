package com.jesus.entity;

import java.util.Date;

/**
 * 
 * @author Guanxin Chen
 * @Date:2017年9月21日下午5:08:10
 */
public class Cart {
	private String cId;
	private String uId;
	private String fId;
	private String quantity;
	private Date cTime;
	
	public String getcId() {
		return cId;
	}
	public void setcId(String cId) {
		this.cId = cId;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getfId() {
		return fId;
	}
	public void setfId(String fId) {
		this.fId = fId;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public Date getcTime() {
		return cTime;
	}
	public void setcTime(Date cTime) {
		this.cTime = cTime;
	}

	
}
