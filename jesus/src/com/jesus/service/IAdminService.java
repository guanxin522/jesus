package com.jesus.service;

import com.jesus.entity.Admin;

/** 
* @author 作者 E-mail: Chen Guanxin 490861319@qq.com
* @version 创建时间：2017年10月6日 下午7:59:26 
* 类说明 ：
*/
public interface IAdminService {
	//用户登录
	public Admin loginUser(String aName, String aPwd);
	
}
 