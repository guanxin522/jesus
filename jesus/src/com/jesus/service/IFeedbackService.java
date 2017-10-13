package com.jesus.service;

import java.util.List;

import com.jesus.entity.Feedback;

/** 
* @author 作者 E-mail: Chen Guanxin	490861319@qq.com
* @version 创建时间：2017年10月7日 下午5:18:33 
* 类说明 ：意见反馈接口
*/
public interface IFeedbackService {
	//增加意见反馈
	public void addFeedback(Feedback feedback);
	//删除意见反馈
	public void delFeedback(Feedback feedback);
	//显示所有意见反馈
	public List findAllFeedback();
}
 