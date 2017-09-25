package com.jesus.service.impl;

import java.util.List;

import com.jesus.dao.IUserDao;
import com.jesus.dao.impl.UserDaoImpl;
import com.jesus.entity.Users;
import com.jesus.service.IUserService;
import exception.UsersExistException;



/**
* @author Chen Guanxin
* @date 2017年9月21日 下午9:10:08
* 
*/
public class UserServiceImpl implements IUserService {
	
	IUserDao userDao;
	public IUserDao getUserDao() {
		return userDao;
	}
	
	public void setUserDao(IUserDao userDao) {
		this.userDao = userDao;
	}
	@Override
	public Users loginUser(String uname, String upwd) {
		// TODO Auto-generated method stub
		return userDao.loginUser(uname, upwd);
	}
	

	@Override
	public void addUsers(Users users) throws UsersExistException{
		// TODO Auto-generated method stub
		if(userDao.findUsers(users.getUname()) != null){
			throw new UsersExistException("用户名已存在");
		}
		userDao.addUsers(users);
	}

	@Override
	public void modifyUsers(Users users) {
		// TODO Auto-generated method stub

	}

	@Override
	public Users findUsers(String uname) {
		return userDao.findUsers(uname);
		// TODO Auto-generated method stub
		
	}






}
