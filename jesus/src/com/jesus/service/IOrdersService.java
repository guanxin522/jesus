package com.jesus.service;

import java.util.List;

import com.jesus.entity.OrderSon;
import com.jesus.entity.Orders;
import com.jesus.entity.Users;

public interface IOrdersService {
	//添加订单
	public void addOrders(Orders order);
	public void addOrders(Orders order,List<OrderSon> orderSon);
	
	//修改订单
	public void saveOrders(Orders order);
	
	//删除订单
	public void delOrders(Orders order);
	
	//支付订单
	public void payOrders(Orders order);
	
	//查询订单
	public List findOstatusFood(String uId,String oStatus);
	public Orders findOrderByOid(String oId);
	public List<Orders> findAllOrders(String oStatus);
	public List<Orders> findOrdersByUser(String uId);
	public List findOrdersByKeyword(String uId,String oStatus,String keyword);
	public List findOrdersByStatus(String uId,String oStatus1,String oStatus2);
	public List findOrdersByStatus(String uId,String oStatus1,String oStatus2,String oStatus3);
}
