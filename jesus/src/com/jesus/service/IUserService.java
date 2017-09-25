package com.jesus.service;

import java.util.List;

import com.jesus.entity.Admin;
import com.jesus.entity.Users;

import exception.UsersExistException;

/**
* @author Chen Guanxin
* @date 2017年9月21日 下午9:03:46
* 
*/
public interface IUserService {
	//用户登录验证
	public Users loginUser(String uname, String upwd);
	
	//添加用户
	public void addUsers(Users users) throws UsersExistException;
	
	//修改个人信息
	public void modifyUsers(Users users);
	
	//查找单个用户
	public Users findUsers(String uname);
}
