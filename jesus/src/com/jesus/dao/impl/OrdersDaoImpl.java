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
	public List findAllOrders(String oStatus) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		String sql = "SELECT oid, (ORDERS.`otime`) otime, (ORDERS.`oprice`) oprice, (ORDERS.`ostatus`) ostatus, (uname) uname, (address) address, (tel) tel FROM USERS,ORDERS WHERE USERS.`uid`=ORDERS.`uid` AND ostatus=? GROUP BY oid ORDER BY otime AND ostatus ASC ";
		Query query = session.createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
 		query.setParameter(0,oStatus);
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
 	public List findOstatusFood(String uId,String oStatus) {
 		// TODO Auto-generated method stub
 		Session session=sessionFactory.getCurrentSession();
 		String sql= "SELECT FOOD.fid,ORDERSON.fname,ORDERSON.fdescri,ORDERSON.fprice,ORDERSON.fimage,FOOD.status,"
 				+ "ORDERS.oid,ORDERS.otime,ORDERS.ostatus,"
 				+ "ORDERSON.osid,ORDERSON.quantity FROM FOOD,ORDERS,ORDERSON"
 				  + " WHERE FOOD.fid =ORDERSON.fid AND ORDERSON.oid=ORDERS.oid AND ORDERS.uid=? AND ORDERS.ostatus=?";
 		Query query = session.createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
 		query.setParameter(0,uId);
 		query.setParameter(1,oStatus);
 		List list = query.getResultList();
 		return list;
 	}
	@Override
	public List findOrdersByDoubleStatus(String oStatus1, String oStatus2) {
		Session session=sessionFactory.getCurrentSession();
		String sql = "SELECT oid, (ORDERS.`otime`) otime, (ORDERS.`oprice`) oprice, (ORDERS.`ostatus`) ostatus, (uname) uname, (address) address, (tel) tel FROM USERS,ORDERS WHERE USERS.`uid`=ORDERS.`uid` AND ostatus=? OR ostatus=? GROUP BY oid ORDER BY otime AND ostatus ASC ";
		Query query = session.createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
 		query.setParameter(0,oStatus1);
 		query.setParameter(1,oStatus2);
		List list = query.getResultList();
		return list;
	}

 	public List findOrderByKeyword(String uId ,String oStatus,String keyword) {
 		Session session=sessionFactory.getCurrentSession();
 		keyword = "%"+keyword+"%";
 		System.out.println(keyword);
 		String sql= "SELECT FOOD.fid,ORDERSON.fname,ORDERSON.fdescri,ORDERSON.fprice,ORDERSON.fimage,FOOD.status,"
 				+ "ORDERS.oid,ORDERS.otime,ORDERS.ostatus,"
 				+ "ORDERSON.osid,ORDERSON.quantity FROM FOOD,ORDERS,ORDERSON"
 			    + " WHERE FOOD.fid =ORDERSON.fid AND ORDERSON.oid=ORDERS.oid AND ORDERS.uid=? AND ORDERS.ostatus=? AND ORDERSON.fname LIKE ?";
 		Query query = session.createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
 		query.setParameter(0,uId);
 		query.setParameter(1,oStatus);
 		query.setParameter(2,keyword);
 		List list = query.getResultList();
 		return list;
 	}
	@Override
	public List findOrdersByStatus(String uId, String oStatus1, String oStatus2) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
 		String sql= "SELECT FOOD.fid,ORDERSON.fname,ORDERSON.fdescri,ORDERSON.fprice,ORDERSON.fimage,FOOD.status,"
 				+ "ORDERS.oid,ORDERS.otime,ORDERS.ostatus,"
 				+ "ORDERSON.osid,ORDERSON.quantity FROM FOOD,ORDERS,ORDERSON"
 				  + " WHERE FOOD.fid =ORDERSON.fid AND ORDERSON.oid=ORDERS.oid AND ORDERS.uid=? AND ( ORDERS.ostatus=? OR ORDERS.ostatus=? )";
 		Query query = session.createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
 		query.setParameter(0,uId);
 		query.setParameter(1,oStatus1);
 		query.setParameter(2,oStatus2);
 		List list = query.getResultList();
 		return list;
	}
	@Override
	public List findOrdersByStatus(String uId, String oStatus1, String oStatus2, String oStatus3) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
 		String sql= "SELECT FOOD.fid,ORDERSON.fname,ORDERSON.fdescri,ORDERSON.fprice,ORDERSON.fimage,FOOD.status,"
 				+ "ORDERS.oid,ORDERS.otime,ORDERS.ostatus,"
 				+ "ORDERSON.osid,ORDERSON.quantity FROM FOOD,ORDERS,ORDERSON"
 				  + " WHERE FOOD.fid =ORDERSON.fid AND ORDERSON.oid=ORDERS.oid AND ORDERS.uid=? AND ( ORDERS.ostatus=? OR ORDERS.ostatus=? OR ORDERS.ostatus=? )";
 		Query query = session.createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
 		query.setParameter(0,uId);
 		query.setParameter(1,oStatus1);
 		query.setParameter(2,oStatus2);
 		query.setParameter(3,oStatus3);
 		List list = query.getResultList();
 		return list;
	}
	

}
