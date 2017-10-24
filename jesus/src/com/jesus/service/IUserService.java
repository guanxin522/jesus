package com.jesus.service;

import java.util.List;

import com.jesus.entity.Admin;
import com.jesus.entity.Users;
import com.jesus.exception.UsersExistException;

/**
 * 
 * @ClassName:  IUserService   
 * @Description:TODO(这里用一句话描述这个类的作用)   
 * @author: 作者 E-mail: 陈观鑫 490861319@qq.com
 * @date:   2017年9月21日 上午12:07:32
 */
public interface IUserService {
	//用户登录
	public Users loginUser(String uName, String uPwd);
	
	//添加用户
	public void addUsers(Users users) throws UsersExistException;
	
	//修改个人信息
	public void saveUsers(Users users);
	
	//查找单个用户
	public Users findUsers(String uName);
	public Users findUsersById(String uId);
	
	//查找所有用户
	public List findAllUsers();
	
}
