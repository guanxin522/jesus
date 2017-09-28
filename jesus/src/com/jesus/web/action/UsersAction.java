package com.jesus.web.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;


import com.jesus.entity.Users;
import com.jesus.exception.UsersExistException;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import com.jesus.service.IUserService;
import com.jesus.service.impl.UserServiceImpl;
import com.jesus.util.WebUtils;

/**
 * 
 * @ClassName:  UsersAction   
 * @Description:TODO(这里用一句话描述这个类的作用)   
 * @author: 作者 E-mail: 
 * @date:   2017年9月26日 下午11:49:51
 */

public class UsersAction  extends ActionSupport implements RequestAware,SessionAware,ModelDriven<Users>{
	private Users users;
	private String validateUname=null;
	private Map<String,Object> dataMap;  
	IUserService userService;
	public void setUserService(IUserService userService) {
		this.userService = userService;
	}
	public String loginUser() throws Exception {
		String uname = users.getUname();
		String upwd = users.getUpwd();
		Users user = userService.loginUser(uname, upwd);
		if(user!=null)
		{
			session.put("user", users);
			return "success";
		}
		else
		return "login";
	}
	
	//用户注销
	public String logOutUser() throws Exception {
		session.remove("user");
		return "success";
	}
	
	//用户注册
	public String registerAction() throws Exception {
		String uname = users.getUname();
		String upwd = users.getUpwd();
		String realname = users.getRealname();
		String email = users.getEmail();
		String address = users.getAddress();
		String tel = users.getTel();
		String uid = WebUtils.makeId("u");
		try {
				users.setAddress(address);
				users.setUid(uid);
				users.setUname(uname);
				users.setEmail(email);
				users.setUpwd(upwd);
				users.setTel(tel);
				users.setRealname(realname);
				userService.addUsers(users);
				userService.loginUser(uname, upwd);
				session.put("user", users);
				return "success";
		}catch (UsersExistException e) {
			//addFieldError( "uname", "用户名已存在" );
			return "login";
		} catch (Exception ex) {
			ex.printStackTrace();
			return "login";
		} 
	}
	//检查用户名
	public String checkUnameAction() throws Exception {
		dataMap = new HashMap<String, Object>();  
		String uname = users.getUname();
		Users user = userService.findUsers(uname);
		if(user != null && validateUname.equals("2")){
			
	        dataMap.put("valid", false);  
		}
		else if(user!=null && validateUname.equals("1")){
			dataMap.put("valid", true); 
		}
		else if(user == null && validateUname.equals("1")){
			dataMap.put("valid", false);
		}
		else if(user == null && validateUname.equals("2")){
			dataMap.put("valid", true);
		}
	        // 返回结果  
		return SUCCESS;
	
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

	public Map<String, Object> getDataMap() {
		return dataMap;
	}
	public void setDataMap(Map<String, Object> dataMap) {
		this.dataMap = dataMap;
	}
	
	public Users getUsers() {
		return users;
	}
	public void setUsers(Users users) {
		this.users = users;
	}
	@Override
	public Users getModel() {
		// TODO Auto-generated method stub
		return users;
	}
	public String getValidateUname() {
		return validateUname;
	}
	public void setValidateUname(String validateUname) {
		this.validateUname = validateUname;
	}
	
}
