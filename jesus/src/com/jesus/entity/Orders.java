package com.jesus.entity;

import java.math.BigDecimal;
import java.util.Set;

/**
* @author Chen Guanxin
* @date 2017年9月21日 下午4:28:32
* 
*/
public class Orders {
	private String oid, uid, otime, ostatus;
	private Set <OrderSon > orderson;
	private BigDecimal oprice;
	
	public Orders() {
	}
	public Orders(String oid, String uid, String otime, String ostatus, Set<OrderSon> orderson, BigDecimal oprice) {
		super();
		this.oid = oid;
		this.uid = uid;
		this.otime = otime;
		this.ostatus = ostatus;
		this.orderson = orderson;
		this.oprice = oprice;
	}
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getOtime() {
		return otime;
	}
	public void setOtime(String otime) {
		this.otime = otime;
	}
	public String getOstatus() {
		return ostatus;
	}
	public void setOstatus(String ostatus) {
		this.ostatus = ostatus;
	}
	public BigDecimal getOprice() {
		return oprice;
	}
	public void setOprice(BigDecimal oprice) {
		this.oprice = oprice;
	}
	public Set getOrderson() {
		return orderson;
	}
	public void setOrderson(Set orderson) {
		this.orderson = orderson;
	}
}
