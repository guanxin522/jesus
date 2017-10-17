package com.jesus.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.hibernate.transform.Transformers;

import com.jesus.dao.ICartDao;
import com.jesus.entity.Cart;
import com.jesus.entity.Food;
import com.jesus.entity.Users;

public class CartDaoImpl implements ICartDao{

	SessionFactory sessionFactory;	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public void addCart(Cart cart) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		session.save(cart);
	}

	@Override
	public void delCart(Cart cart) {
		// TODO Auto-generated method stub
		System.out.println("来到delCartDao");
		Session session=sessionFactory.getCurrentSession();
		session.delete(cart);
	}

	public void saveCart(Cart cart){
		Session session=sessionFactory.getCurrentSession();
		session.update(cart);
	}
	@Override
	public List<Cart> findAll(Users user) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		String hql="from Cart where uId=:Message";
		Query<Cart> query = (Query) session.createQuery(hql,Cart.class);
		query.setParameter("Message", user.getuId());

		List<Cart> list = query.getResultList();
		return list;
	}
	public List findAllFood(Users user) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
//		String hql="from Cart where uid=:Message";
//		String sql = "SELECT * FROM food WHERE food.fid IN ( SELECT cart.fid FROM cart WHERE cart.uid=?)";
		String sql = "SELECT food.fId,fName,fDescri,fPrice,fImage,fVolume,food.time,food.status,quantity FROM food,cart WHERE food.fId=cart.fId AND cart.uId=?";
//		Query<Food> query = (Query) session.createQuery(sql,Food.class);
		Query query = session.createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
		query.setParameter(0, user.getuId());
		List list = query.getResultList();
		return list;
	}
	public Cart findCart(String uId,String fId){
		Cart cart=null;
		Session session=sessionFactory.getCurrentSession();
		String hql = "from Cart where uId=:uId and fId=:fId";
		Query<Cart> query = (Query) session.createQuery(hql,Cart.class);
		query.setParameter("uId", uId);
		query.setParameter("fId", fId);
		List<Cart> list = query.getResultList();
		if(list != null && list.size() > 0){
			 cart =  list.get(0);
		}
		return cart;
	}

}
