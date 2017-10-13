package com.jesus.service.impl;

import java.util.List;

import com.jesus.dao.IUserDao;
import com.jesus.entity.Users;
import com.jesus.exception.UsersExistException;
import com.jesus.service.IUserService;

/**
 * 
 * @ClassName:  UserServiceImpl   
 * @Description:TODO：用户业务实现类   
 * @author: 作者 E-mail: 陈观鑫 490861319@qq.com
 * @date:   2017年9月21日 上午12:09:04
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
	public Users loginUser(String uName, String uPwd) {
		// TODO Auto-generated method stub
		return userDao.loginUser(uName, uPwd);
	}
	

	@Override
	public void addUsers(Users users) throws UsersExistException{
		// TODO Auto-generated method stub
		if(userDao.findUsers(users.getuName()) != null){
			throw new UsersExistException("用户名已存在");
		}
		userDao.addUsers(users);
	}

	@Override
	public void saveUsers(Users users) {
		// TODO Auto-generated method stub
		userDao.saveUsers(users);
	}

	@Override
	public Users findUsers(String uName) {
		// TODO Auto-generated method stub
		return userDao.findUsers(uName);
	}

	@Override
	public List findAllUsers() {
		// TODO Auto-generated method stub
		return userDao.findAllUsers();
	}






}
