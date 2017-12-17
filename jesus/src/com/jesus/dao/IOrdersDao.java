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
    public List findOstatusFood(String uId,String oStatus);
    //通过订单号查订单
	public Orders findOrderByOid(String oId);
	//通过用户查订单
	public List findOrdersByUser(String uId);
	//查找指定状态订单
	public List findAllOrders(String oStatus);

	//查找两个状态的订单
	public List findOrdersByDoubleStatus(String oStatus1,String oStatus2);
	//通过关键字查找订单
	public List findOrderByKeyword(String uId,String oStatus,String keyword);
	//通过订单状态查找订单
	public List findOrdersByStatus(String uId,String oStatus1,String oStatus2);
	public List findOrdersByStatus(String uId,String oStatus1,String oStatus2,String oStatus3);
	
}
