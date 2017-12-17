package com.jesus.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.hibernate.transform.Transformers;

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

	@Override
	public List findFoodVolume(String oid) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		String sql = "SELECT ORDERSON.`fid`,ORDERSON.`quantity`,FOOD.`fvolume` FROM ORDERS,ORDERSON,FOOD "
				+ "WHERE ORDERS.`oid`=ORDERSON.`oid` AND ORDERSON.`fid`=FOOD.`fid` AND ORDERS.`oid` =?";
		Query query = session.createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
 		query.setParameter(0,oid);
		List list = query.getResultList();
		return list;
	}

	@Override
	public List findFoodByStatus(int status) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		String hql="from Food  where status>=:status";
		Query<Food> query = (Query) session.createQuery(hql,Food.class);
		query.setParameter("status", status);
		
		List<Food> list = query.getResultList();
		return list;
	}

	@Override
	public List searchFood(String fname) {
		// TODO Auto-generated method stub
		Food food = null;
		fname = "'%"+fname+"%'";
		Session session=sessionFactory.getCurrentSession();
		String hql="from Food where fname like "+fname;
		Query<Food> query = (Query) session.createQuery(hql,Food.class);	 
		List<Food> list = query.getResultList();
		return list;
	}
}
