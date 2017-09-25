package com.jesus.entity;

import java.math.BigDecimal;
import java.util.Set;

/**
* @author Chen Guanxin
* @date 2017年9月21日 下午4:15:05
* 
*/
public class Food {
	private String fid, fname, fdescri, fimage, fvolume, comments;
	private Set <OrderSon > orderson;
	private BigDecimal fprice;
	
	public Food() {
	}

	public Food(String fid, String fname, String fdescri, String fimage, String fvolume, String comments,
			Set<OrderSon> orderson, BigDecimal fprice) {
		super();
		this.fid = fid;
		this.fname = fname;
		this.fdescri = fdescri;
		this.fimage = fimage;
		this.fvolume = fvolume;
		this.comments = comments;
		this.orderson = orderson;
		this.fprice = fprice;
	}

	public Set getOrderson() {
		return orderson;
	}

	public void setOrderson(Set orderson) {
		this.orderson = orderson;
	}

	public String getFid() {
		return fid;
	}

	public void setFid(String fid) {
		this.fid = fid;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getFdescri() {
		return fdescri;
	}

	public void setFdescri(String fdescri) {
		this.fdescri = fdescri;
	}
	public BigDecimal getFprice() {
		return fprice;
	}

	public void setFprice(BigDecimal fprice) {
		this.fprice = fprice;
	}

	public String getFimage() {
		return fimage;
	}

	public void setFimage(String fimage) {
		this.fimage = fimage;
	}

	public String getFvolume() {
		return fvolume;
	}

	public void setFvolume(String fvolume) {
		this.fvolume = fvolume;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}
	
}
