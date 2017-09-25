package com.jesus.dao;

import java.util.List;

import com.jesus.entity.Users;

/**
* @author Chen Guanxin
* @date 2017年9月21日 下午8:35:42
* 
*/
public interface IUserDao {
	//用户登录验证
	public Users loginUser(String uname, String upwd);
	
	//添加用户
	public void addUsers(Users users);
	
	//修改个人信息
	public void modifyUsers(Users users);
	
	//查找单个用户
	public Users findUsers(String uname);
}
