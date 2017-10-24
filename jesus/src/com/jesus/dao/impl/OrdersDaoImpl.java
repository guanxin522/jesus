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
		String sql = "SELECT orders.`oid`,orders.`otime`,orders.`oprice`,"
				+ "orders.`ostatus`,uname,address,tel FROM users,orders GROUP BY oid";
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
		String sql= "SELECT food.fid,food.fname,food.fdescri,food.fprice,food.fimage,food.time,food.status,"
				+ "orders.oid,orders.otime,orders.ostatus,"
				+ "orderson.osid,orderson.quantity FROM food,orders,orderson"
				  + " WHERE food.fid =orderson.fid AND orderson.oid=orders.oid AND orders.uid=? AND orders.ostatus=0";
		Query query = session.createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
		query.setParameter(0,uId);
		List list = query.getResultList();
		return list;
	}
	@Override
	public List findPaidFood(String uId) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		String sql= "SELECT food.fid,food.fname,food.fdescri,food.fprice,food.fimage,food.time,food.status,"
				+ " orders.oid,orders.otime,orders.ostatus,"
				+ " orderson.osid,orderson.quantity FROM food,orders,orderson"
				  + " WHERE food.fid =orderson.fid AND orderson.oid=orders.oid AND orders.uid=? AND orders.ostatus=1";
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
