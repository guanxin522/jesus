package com.jesus.dao;

import java.util.List;

import com.jesus.entity.Orders;
import com.jesus.entity.Users;

public interface IOrdersDao {

	//添加订单
	public void addOrders(Orders order);
	
	//删除订单
	public void delOrders(Orders order);
	
	//修改支付状态
	public void saveOrders(Orders order);
	
	//查询订单
	public List findUnpaidtFood(String uId);
	public List findPaidFood(String uId);
	public Orders findOrderByOid(String oId);
	public List findOrdersByUser(String uId);
	public List findAllOrders();
	
}
