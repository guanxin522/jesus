package com.jesus.web.action;

import java.util.Map;


import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.jesus.entity.Users;
import com.opensymphony.xwork2.ActionSupport;

import exception.UsersExistException;
import util.WebUtils;

import com.jesus.service.IUserService;
import com.jesus.service.impl.UserServiceImpl;

/**
* @author Chen Guanxin
* @date 2017年9月21日 下午8:26:48
* 
*/
public class UsersAction  extends ActionSupport implements RequestAware,SessionAware{
	private Users users;
	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}
	
	IUserService userService;
	public void setUserService(IUserService userService) {
		this.userService = userService;
	}
	public String loginUser() throws Exception {
		String uname = users.getUname();
		String upwd = users.getUpwd();
		Users users = userService.loginUser(uname, upwd);
		if(users!=null)
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
				return "success";
		}catch (UsersExistException e) {
			addFieldError( "users.uname", "用户名已存在" );
			return "login";
		} catch (Exception ex) {
			ex.printStackTrace();
			return "login";
		} 
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
}
