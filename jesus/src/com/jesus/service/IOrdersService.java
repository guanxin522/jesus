package com.jesus.service;

import java.util.List;

import com.jesus.entity.OrderSon;
import com.jesus.entity.Orders;
import com.jesus.entity.Users;

public interface IOrdersService {
	//添加订单
	public void addOrders(Orders order);
	public void addOrders(Orders order,List<OrderSon> orderSon);
	
	//删除订单
	public void delOrders(Orders order);
	
	//支付订单
	public void payOrders(Orders order);
	
	//查询订单
	public List findUnpaidtFood(String uId);
	public List findPaidFood(String uId);
	public Orders findOrderByOid(String oId);
	public List<Orders> findAllOrders();
	public List<Orders> findOrdersByUser(String uId);
}
