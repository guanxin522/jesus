package com.jesus.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.jesus.dao.IFoodDao;
import com.jesus.entity.Food;
/**
 * 
 * @author dons
 *
 */
public class FoodDaoImpl implements IFoodDao{
	
	
	SessionFactory sessionFactory;	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	//添加食品
	public void addFood(Food food){
		Session session=sessionFactory.getCurrentSession();
		session.save(food);
	}
	
	//删除食品
	public void delFood(Food food){
		Session session=sessionFactory.getCurrentSession();
		session.delete(food);
	}
	
	//修改食品信息
	public void saveFood(Food food){
		Session session=sessionFactory.getCurrentSession();
		session.saveOrUpdate(food);	
	}
	
	//查找食品信息
	public Food findFood(String fId){
		Food food = null;
		Session session=sessionFactory.getCurrentSession();
		String hql="from Food where fId=:fId";
		Query<Food> query = (Query) session.createQuery(hql,Food.class);
		query.setParameter("fId", fId);

		List<Food> list = query.getResultList();
		if(list != null && list.size() > 0){
			 food =  list.get(0);
		}
			
			return food;
		}
	
	
	//查找食品信息
	public Food findFoodById(Food food){
			
		Session session=sessionFactory.getCurrentSession();
		String hql="from Food where fId=:foodMessage";
		Query<Food> query = (Query) session.createQuery(hql,Food.class);
		query.setParameter("foodMessage", food.getfId());

		List<Food> list = query.getResultList();
		if(list != null && list.size() > 0){
			 food =  list.get(0);
		}
			
			return food;
		}
	
	//查找所有食品信息
	public List<Food> findAllFood(){
		Session session=sessionFactory.getCurrentSession();
		String hql = "from Food";
		Query<Food> query = (Query) session.createQuery(hql,Food.class);
		List<Food> list = query.getResultList();
		
		return list;
	}
}
