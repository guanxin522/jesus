package com.jesus.service.impl;

import java.util.List;

import com.jesus.dao.IFeedbackDao;
import com.jesus.entity.Feedback;
import com.jesus.service.IFeedbackService;

/** 
* @author 作者 E-mail: 
* @version 创建时间：2017年10月7日 下午5:21:07 
* 类说明 ：
*/
public class FeedbackServiceImpl implements IFeedbackService {

	private IFeedbackDao feedbackDao;
	
	@Override
	public void addFeedback(Feedback feedback) {
		// TODO Auto-generated method stub
		feedbackDao.addFeedback(feedback);
	}

	@Override
	public void delFeedback(Feedback feedback) {
		// TODO Auto-generated method stub
		feedbackDao.delFeedback(feedback);
	}

	public void setFeedbackDao(IFeedbackDao feedbackDao) {
		this.feedbackDao = feedbackDao;
	}

	@Override
	public List findAllFeedback() {
		// TODO Auto-generated method stub
		return feedbackDao.findAllFeedback();
	}
	
	
}
 