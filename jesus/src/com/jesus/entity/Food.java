package com.jesus.entity;

import java.math.BigDecimal;
import java.util.Date;
import java.util.Set;

import org.hibernate.annotations.DynamicUpdate;

/**
* @author Chen Guanxin
* @date 2017年9月21日 下午4:15:05
* 
*/
@DynamicUpdate(true)
public class Food {
	private String fId;
	private String fName;
	private String fDescri;
	private String fImage;
	private int fVolume;
	private int status;
	private Set <OrderSon > orderSon;
	private BigDecimal fPrice;
	private Date time;
	public String getfId() {
		return fId;
	}
	public void setfId(String fId) {
		this.fId = fId;
	}
	public String getfName() {
		return fName;
	}
	public void setfName(String fName) {
		this.fName = fName;
	}
	public String getfDescri() {
		return fDescri;
	}
	public void setfDescri(String fDescri) {
		this.fDescri = fDescri;
	}
	public String getfImage() {
		return fImage;
	}
	public void setfImage(String fImage) {
		this.fImage = fImage;
	}
	public int getfVolume() {
		return fVolume;
	}
	public void setfVolume(int fVolume) {
		this.fVolume = fVolume;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public BigDecimal getfPrice() {
		return fPrice;
	}
	public void setfPrice(BigDecimal fPrice) {
		this.fPrice = fPrice;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	



	
}
