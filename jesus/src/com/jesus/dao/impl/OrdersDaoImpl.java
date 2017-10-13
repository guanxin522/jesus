package com.jesus.dao.impl;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.jesus.dao.IOrdersDao;
import com.jesus.entity.OrderSon;
import com.jesus.entity.Orders;
import com.jesus.entity.Users;

public class OrdersDaoImpl implements IOrdersDao{

	SessionFactory sessionFactory;	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Override
	public void addOrders(Orders order) {
		// TODO Auto-generated method stub
		
		Session session=sessionFactory.getCurrentSession();
		session.save(order);
	}

	@Override
	public void delOrders(Orders order) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		session.delete(order);
	}

	@Override
	public List findAllOrders() {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();

		return null;
	}
	
	public List<Orders> findOrdersByUser(String uId){
		Session session=sessionFactory.getCurrentSession();
		String hql = "from Orders where uId=:uid";
		Query<Orders> query = session.createQuery(hql,Orders.class);
		query.setParameter("uid", uId);
		List<Orders> list = query.getResultList();
		return list;
	}
	@Override
	public void saveOrders(Orders order) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		session.update(order);
	}
	public Orders findOrderByOid(String oId){
		Orders order=null;
		Session session=sessionFactory.getCurrentSession();
		String hql = "from Orders where oId=:oId";
		Query<Orders> query = session.createQuery(hql, Orders.class);
		query.setParameter("oId", oId);
		List<Orders> list = query.getResultList();
		if(list != null && list.size() > 0){
			order = list.get(0);
		}
		return order;
	}

}
