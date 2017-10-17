package com.jesus.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.hibernate.transform.Transformers;

import com.jesus.dao.IFeedbackDao;
import com.jesus.entity.Feedback;



/** 
* @author 作者 E-mail: Chen Guanxin 490861319@qq.com
* @version 创建时间：2017年10月7日 下午5:14:37 
* 类说明 ：
*/
public class FeedbackDaoImpl implements IFeedbackDao {

	SessionFactory sessionFactory;	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Override
	public void addFeedback(Feedback feedback) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(feedback);
	}

	@Override
	public void delFeedback(Feedback feedback) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.delete(feedback);
	}
	@Override
	public List findAllFeedback() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String sql = "SELECT uName,title,content,status,FEEDBACK.`id`,FEEDBACK.`time` FROM USERS,FEEDBACK WHERE USERS.`uId`=FEEDBACK.`uId`";
		Query query = session.createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
		List list = query.list();
		return list;
	}

}
 