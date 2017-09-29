package com.jesus.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

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
		session.close();
	}

	@Override
	public void delCart(Cart cart) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		session.delete(cart);
		session.close();
	}

	@Override
	public List<Cart> findAll(Users user) {
		// TODO Auto-generated method stub
		Food food=null;
		Session session=sessionFactory.getCurrentSession();
		String hql="from Cart where uid=:foodMessage";
		Query<Food> query = (Query) session.createQuery(hql,Food.class);
		query.setParameter("foodMessage", user.getUid());

		List<Food> list = query.getResultList();
		return null;
	}
	
	

}
