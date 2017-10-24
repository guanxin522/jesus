package com.jesus.dao;

import java.util.List;

import com.jesus.entity.OrderSon;

public interface IOrderSonDao {

	//添加子订单
	public void addOrderSon(OrderSon orderSon);
	
	//删除子订单
	public void delOrderSon(OrderSon orderSon);
	
	//修改子订单
	public void saveOrderSon(OrderSon orderSon);
	
	//查询子订单
	public void findOrderSon();
	
	//查询所有子订单
	public List findAllOrderSon();
	
}
