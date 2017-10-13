package com.jesus.entity;

import java.math.BigDecimal;

/**
* @author Chen Guanxin
* @date 2017年9月21日 下午4:32:14
* 
*/
public class OrderSon {
	private String osId;
	private String quantity;
	private String fId;
	private String oId;
	private BigDecimal fPrice;
	
	public String getOsId() {
		return osId;
	}
	public void setOsId(String osId) {
		this.osId = osId;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public String getfId() {
		return fId;
	}
	public void setfId(String fId) {
		this.fId = fId;
	}
	public String getoId() {
		return oId;
	}
	public void setoId(String oId) {
		this.oId = oId;
	}
	public BigDecimal getfPrice() {
		return fPrice;
	}
	public void setfPrice(BigDecimal fPrice) {
		this.fPrice = fPrice;
	}
}