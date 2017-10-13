package com.jesus.entity;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;

/**
* @author Chen Guanxin
* @date 2017年9月21日 下午4:28:32
* 
*/
public class Orders {
	private String oId;
	private String uId;
	private String oStatus;
	private Date oTime;
	private BigDecimal oPrice;

	public String getoId() {
		return oId;
	}

	public void setoId(String oId) {
		this.oId = oId;
	}

	public String getuId() {
		return uId;
	}

	public void setuId(String uId) {
		this.uId = uId;
	}

	public String getoStatus() {
		return oStatus;
	}

	public void setoStatus(String oStatus) {
		this.oStatus = oStatus;
	}

	public Date getoTime() {
		return oTime;
	}
	public void setoTime(Date oTime) {
		this.oTime = oTime;
	}
	public BigDecimal getoPrice() {
		return oPrice;
	}

	public void setoPrice(BigDecimal oPrice) {
		this.oPrice = oPrice;
	}
	
}
