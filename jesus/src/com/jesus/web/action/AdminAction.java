package com.jesus.web.action;

import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.jesus.entity.Admin;
import com.jesus.entity.Users;
import com.jesus.service.IAdminService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/** 
* @author 作者 E-mail: Chen Guanxin 490861319@qq.com
* @version 创建时间：2017年10月6日 下午8:07:50 
* 类说明 ：管理员控制类
*/
public class AdminAction extends ActionSupport implements RequestAware,SessionAware,ModelDriven<Admin>{

	private static final long serialVersionUID = 1L;
	private Admin admin;
	private IAdminService adminService;
	
	public String loginAdmin() throws Exception {
		 admin = adminService.loginUser(admin.getaName(), admin.getaPwd());
		if(admin!=null)
		{
			session.put("admin", admin);
			return "success";
		}
		else{
		return "input";
		}
	}
	
	//用户注销
	public String logOutAdmin() throws Exception {
		session.remove("admin");
		return "success";
	}
	
	
	
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	public void setAdminService(IAdminService adminService) {
		this.adminService = adminService;
	}
	@Override
	public Admin getModel() {
		// TODO Auto-generated method stub
		return admin;
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
 