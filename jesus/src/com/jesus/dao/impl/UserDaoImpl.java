package com.jesus.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.transaction.annotation.Transactional;

import com.jesus.dao.IUserDao;
import com.jesus.entity.Users;

/*github_test*/
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
	public Users loginUser(String uname, String upwd) {
		// TODO Auto-generated method stub
		Users users = null;
		//通过sessionFactory获得Session
		Session session=sessionFactory.getCurrentSession();
		String hql = "from Users where uname=:uname and upwd=:upwd";
		Query<Users> query = (Query) session.createQuery(hql,Users.class);
		query.setParameter("uname", uname);
		query.setParameter("upwd", upwd);
		List<Users> list = query.getResultList();
		if(list != null && list.size() > 0){
		 users =  list.get(0);
		}
		return users;
	}

	@Override
	public void addUsers(Users users) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		session.save(users);
	}

	@Override
	public void modifyUsers(Users users) {
		// TODO Auto-generated method stub

	}
	@Override
	public Users findUsers(String uname) {
	// TODO Auto-generated method stub
		Users users = null;
		Session session=sessionFactory.getCurrentSession();
		String hql = "from Users where uname=:uname";
		Query<Users> query = session.createQuery(hql, Users.class);
		query.setParameter("uname", uname);
		List<Users> list = query.getResultList();
		if(list != null && list.size() > 0){
			users = list.get(0);
		}
		return users;
		
	}

}
