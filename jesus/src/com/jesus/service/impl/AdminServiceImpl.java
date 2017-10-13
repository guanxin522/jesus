package com.jesus.service.impl;

import com.jesus.dao.IAdminDao;
import com.jesus.entity.Admin;
import com.jesus.service.IAdminService;

/** 
* @author 作者 E-mail: 
* @version 创建时间：2017年10月6日 下午8:01:15 
* 类说明 ：
*/
public class AdminServiceImpl implements IAdminService {

	IAdminDao adminDao;
	

	@Override
	public Admin loginUser(String aName, String aPwd) {
		// TODO Auto-generated method stub
		return adminDao.loginAdmin(aName, aPwd);
	}


	public void setAdminDao(IAdminDao adminDao) {
		this.adminDao = adminDao;
	}

}
 