package com.jesus.service.impl;

import java.util.Iterator;
import java.util.List;

import com.jesus.dao.IOrderSonDao;
import com.jesus.dao.IOrdersDao;
import com.jesus.entity.OrderSon;
import com.jesus.entity.Orders;
import com.jesus.entity.Users;
import com.jesus.service.IOrdersService;

public class OrdersServiceImpl implements IOrdersService{

	IOrdersDao ordersDao;
	IOrderSonDao orderSonDao;
	OrderSon orderSon;

	public IOrderSonDao getOrderSonDao() {
		return orderSonDao;
	}

	public void setOrderSonDao(IOrderSonDao orderSonDao) {
		this.orderSonDao = orderSonDao;
	}

	public IOrdersDao getOrdersDao() {
		return ordersDao;
	}

	public void setOrdersDao(IOrdersDao ordersDao) {
		this.ordersDao = ordersDao;
	}

	@Override
	public void addOrders(Orders order) {
		// TODO Auto-generated method stub
		ordersDao.addOrders(order);
	}

	@Override
	public void delOrders(Orders order) {
		// TODO Auto-generated method stub
		ordersDao.delOrders(order);
	}

	@Override
	public List<Orders> findAllOrders() {
		// TODO Auto-generated method stub
		return ordersDao.findAllOrders();
	}

	@Override
	public List<Orders> findOrdersByUser(String uId) {
		// TODO Auto-generated method stub
		return ordersDao.findOrdersByUser(uId);
	}

	@Override
	public void addOrders(Orders order, List<OrderSon> orderSonList) {
		// TODO Auto-generated method stub
		ordersDao.addOrders(order);
		for(int i=0;i<orderSonList.size();i++){
			OrderSon orderSon = orderSonList.get(i);
			orderSonDao.addOrderSon(orderSon);
//			System.out.println(orderSon);
		}
	}

	@Override
	public void payOrders(Orders order) {
		// TODO Auto-generated method stub
		ordersDao.saveOrders(order);
	}
	public Orders findOrderByOid(String oId){
		return ordersDao.findOrderByOid(oId);
	}
	
	
}