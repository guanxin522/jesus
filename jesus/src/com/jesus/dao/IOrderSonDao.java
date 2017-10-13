package com.jesus.dao;

import com.jesus.entity.OrderSon;

public interface IOrderSonDao {

	//添加订单
	public void addOrderSon(OrderSon orderSon);
	
	//删除订单
	public void delOrderSon(OrderSon orderSon);
	
	//修改订单
	public void saveOrderSon(OrderSon orderSon);
	
	//查询订单
	public void findOrderSon();
	
}
