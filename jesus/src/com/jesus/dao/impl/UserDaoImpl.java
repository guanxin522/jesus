package com.jesus.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.transaction.annotation.Transactional;

import com.jesus.dao.IUserDao;
import com.jesus.entity.Users;


/**
* @author Chen Guanxin
* @date 2017年9月21日 下午8:37:51
* 
*/
@Transactional
public class UserDaoImpl implements IUserDao {

	SessionFactory sessionFactory;	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public Users loginUser(String uName, String uPwd) {
		// TODO Auto-generated method stub
		Users users = null;
		//通过sessionFactory获得Session
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Users where uName=:uName and uPwd=:uPwd";
		Query<Users> query = (Query) session.createQuery(hql,Users.class);
		query.setParameter("uName", uName);
		query.setParameter("uPwd", uPwd);
		List<Users> list = query.getResultList();
		if(list != null && list.size() > 0){
		 users =  list.get(0);
		}
		return users;
	}

	@Override
	public void addUsers(Users users) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(users);
	}

	@Override
	public Users findUsers(String uName) {
	// TODO Auto-generated method stub
		Users users = null;
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Users where uName=:uName";
		Query<Users> query = session.createQuery(hql, Users.class);
		query.setParameter("uName", uName);
		List<Users> list = query.getResultList();
		if(list != null && list.size() > 0){
			users = list.get(0);
		}
		return users;
	}
	
	@Override
	public List findAllUsers() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Users";
		Query query = session.createQuery(hql);
		List list = query.getResultList();
		return list;
	}

	@Override
	public void saveUsers(Users users) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(users);
	}

}
