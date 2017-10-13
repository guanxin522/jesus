package com.jesus.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.jesus.dao.IOrderSonDao;
import com.jesus.entity.OrderSon;

public class OrderSonDaoImpl implements IOrderSonDao{

	SessionFactory sessionFactory;	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public void addOrderSon(OrderSon orderSon) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		session.save(orderSon);
	}

	@Override
	public void delOrderSon(OrderSon orderSon) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void saveOrderSon(OrderSon orderSon) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void findOrderSon() {
		// TODO Auto-generated method stub
		
	}
	

}
