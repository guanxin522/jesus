package com.jesus.web.action;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.jesus.entity.Feedback;
import com.jesus.entity.Users;
import com.jesus.service.IFeedbackService;
import com.jesus.util.WebUtils;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/** 
* @author 作者 E-mail: Chen Guanxin 490861319@qq.com
* @version 创建时间：2017年10月7日 下午8:20:11 
* 类说明 ：意见反馈控制类
*/
public class FeedbackAction extends ActionSupport implements RequestAware,SessionAware,ModelDriven< Feedback>{

	private static final long serialVersionUID = 1L;
	IFeedbackService feedbackService;
	Feedback feedback;
	private String resultTemp;
	
	public String addFeedbackAction() throws Exception {
		Users user = (Users) session.get("user");
		feedback.setuId(user.getuId());
		Date time = new Date();
		feedback.setTime(time);
		feedback.setId(WebUtils.makeId("fb"));
		feedbackService.addFeedback(feedback);
		return SUCCESS;
	}
	
	public String delFeedbackAction() throws Exception {
		feedbackService.delFeedback(feedback);
		this.setResultTemp("删除成功");
		return SUCCESS;
	}
	
	public String findAllFeedbackAction() throws Exception {
		List feedbackList = feedbackService.findAllFeedback();
		request.put("feedbackList", feedbackList);
		return SUCCESS;
	}
	
	public void setFeedbackService(IFeedbackService feedbackService) {
		this.feedbackService = feedbackService;
	}

	public void setFeedback(Feedback feedback) {
		this.feedback = feedback;
	}

	@Override
	public Feedback getModel() {
		// TODO Auto-generated method stub
		return feedback;
	}

	Map<String, Object> session;
	
	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}
	
	Map<String, Object> request;
	@Override
	public void setRequest(Map<String, Object> request) {
		this.request=request;
	}

	public void setResultTemp(String resultTemp) {
		this.resultTemp = resultTemp;
	}
	

}
 