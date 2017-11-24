package com.jesus.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.hibernate.transform.Transformers;

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

	@Override
	public List findAllOrderSon() {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		String sql = "  SELECT  ORDERS.`oid`,ORDERSON.`fid`,fname,quantity"
				+ " FROM ORDERS,ORDERSON WHERE ORDERS.`oid`=ORDERSON.`oid` ";
		Query query = session.createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
		List list = query.getResultList();
		return list;
	}
	

}
