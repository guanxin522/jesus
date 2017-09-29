package com.jesus.entity;
/**
 * 
 * @author Guanxin Chen
 * @Date:2017年9月21日下午5:08:10
 */
public class Cart {
	private String cid, uid, fid, quantity,ctime;
	
	public String getCtime() {
		return ctime;
	}

	public void setCtime(String ctime) {
		this.ctime = ctime;
	}

	public Cart() {
	}

	public Cart(String cid, String uid, String fid, String quantity) {
		super();
		this.cid = cid;
		this.uid = uid;
		this.fid = fid;
		this.quantity = quantity;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getFid() {
		return fid;
	}

	public void setFid(String fid) {
		this.fid = fid;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	
}
