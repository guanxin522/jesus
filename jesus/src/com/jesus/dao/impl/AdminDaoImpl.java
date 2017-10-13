package com.jesus.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.jesus.dao.IAdminDao;
import com.jesus.entity.Admin;

/** 
* @author 作者 E-mail: 
* @version 创建时间：2017年10月6日 下午7:56:23 
* 类说明 ：
*/
public class AdminDaoImpl implements IAdminDao {
	
	SessionFactory sessionFactory;	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public Admin loginAdmin(String aName, String aPwd) {
		Admin admin = null;
		//通过sessionFactory获得Session
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Admin where aName=:aName and aPwd=:aPwd";
		Query<Admin> query = (Query) session.createQuery(hql,Admin.class);
		query.setParameter("aName", aName);
		query.setParameter("aPwd", aPwd);
		List<Admin> list = query.getResultList();
		if(list != null && list.size() > 0){
			admin =  list.get(0);
		}
		return admin;
	}

}
 