package com.jesus.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.hibernate.transform.Transformers;

import com.jesus.dao.IOrdersDao;
import com.jesus.entity.Orders;

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
		String sql = "SELECT oid,any_value(ORDERS.`otime`) otime,any_value(ORDERS.`oprice`) oprice,any_value(ORDERS.`ostatus`) ostatus,any_value(uname) uname,any_value(address) address,any_value(tel) tel FROM USERS,ORDERS WHERE USERS.`uid`=ORDERS.`uid` GROUP BY oid ORDER BY otime AND ostatus ASC ";
		Query query = session.createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
		List list = query.getResultList();
		return list;
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
	public List findUnpaidtFood(String uId) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		String sql= "SELECT FOOD.fid,FOOD.fname,FOOD.fdescri,FOOD.fprice,FOOD.fimage,FOOD.time,FOOD.status,"
				+ "ORDERS.oid,ORDERS.otime,ORDERS.ostatus,"
				+ "ORDERSON.osid,ORDERSON.quantity FROM FOOD,ORDERS,ORDERSON"
				  + " WHERE FOOD.fid =ORDERSON.fid AND ORDERSON.oid=ORDERS.oid AND ORDERS.uid=? AND ORDERS.ostatus=0";
		Query query = session.createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
		query.setParameter(0,uId);
		List list = query.getResultList();
		return list;
	}
	@Override
	public List findPaidFood(String uId) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		String sql= "SELECT FOOD.fid,FOOD.fname,FOOD.fdescri,FOOD.fprice,FOOD.fimage,FOOD.time,FOOD.status,"
				+ " ORDERS.oid,ORDERS.otime,ORDERS.ostatus,"
				+ " ORDERSON.osid,ORDERSON.quantity FROM FOOD,ORDERS,ORDERSON"
				  + " WHERE FOOD.fid =ORDERSON.fid AND ORDERSON.oid=ORDERS.oid AND ORDERS.uid=? AND ORDERS.ostatus=1";
//				      + "SELECT orderson.fid FROM orderson"
//				      + "WHERE orderson.oid IN ("
//				          + "SELECT orders.oid FROM orders"
//				          + "WHERE orders.uid=:uId AND orders.ostatus=1))";
		Query query = session.createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
		query.setParameter(0,uId);
		List list = query.getResultList();
		return list;
	}

}
