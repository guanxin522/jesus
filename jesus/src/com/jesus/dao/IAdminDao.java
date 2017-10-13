package com.jesus.dao;

import com.jesus.entity.Admin;

/** 
* @author 作者 E-mail: Chen Guanxin 490861319@qq.com
* @version 创建时间：2017年10月6日 下午7:52:26 
* 类说明 ：管理员接口类
*/
public interface IAdminDao {
	//管理员登陆
	public Admin loginAdmin(String aName, String aPwd);
	
}
 