package com.jesus.entity;

import java.math.BigDecimal;

/**
* @author Chen Guanxin
* @date 2017年9月21日 下午4:32:14
* 
*/
public class OrderSon {
	private String osid, quantity;
	private BigDecimal price;
	private Food food;
	private Orders orders;
	public String getOsid() {
		return osid;
	}
	public void setOsid(String osid) {
		this.osid = osid;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public Food getFood() {
		return food;
	}
	public void setFood(Food food) {
		this.food = food;
	}
	public Orders getOrders() {
		return orders;
	}
	public void setOrders(Orders orders) {
		this.orders = orders;
	}
	

}