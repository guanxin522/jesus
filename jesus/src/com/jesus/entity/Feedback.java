package com.jesus.entity;

import java.util.Date;

/** 
* @author 作者 E-mail: 陈观鑫 490861319@qq.com
* @version 创建时间：2017年10月7日 下午4:42:38 
* 类说明 ：意见反馈实体类
*/
public class Feedback {
	private String id;
	private String uId;
	private String title;
	private String content;
	private String Status;
	private Date time;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}

	
}
 