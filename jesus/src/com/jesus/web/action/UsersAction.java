package com.jesus.web.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.jesus.entity.Users;
import com.jesus.exception.UsersExistException;
import com.jesus.service.IUserService;
import com.jesus.util.WebUtils;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 
 * @ClassName:  UsersAction   
 * @Description:TODO 
 * @author: 作者 E-mail:陈观鑫 490861319@qq.com
 * @date:   2017年9月21日 下午13:14:51
 */

public class UsersAction  extends ActionSupport implements RequestAware,SessionAware,ModelDriven<Users>{
	private Users users;
	private String validateUname=null;
	private Map<String,Object> dataMap;  
	private String resultTemp;
	IUserService userService;
	
	public void setUserService(IUserService userService) {
		this.userService = userService;
	}
	public String loginUserAction() throws Exception {
		String uName = users.getuName();
		String uPwd = users.getuPwd();
		Users user = userService.loginUser(uName, uPwd);
		if(user != null)
		{
			session.put("user", user);
			this.resultTemp = "loginSuccess";
		}
		else{
			this.resultTemp = "loginFail";
		}
		return	SUCCESS;
	}
	
	//用户注销
	public String logOutUser() throws Exception {
		session.remove("user");
		return "success";
	}
	
	//用户注册
	public String registerAction() throws Exception {
		try {	
				users.setuId(WebUtils.makeId("u"));
				userService.addUsers(users);
				userService.loginUser(users.getuName(), users.getuPwd());
				return "success";
		}catch (UsersExistException e) {
			//addFieldError( "uname", "用户名已存在" );
			return "login";
		} catch (Exception ex) {
			ex.printStackTrace();
			return "login";
		} 
	}
	//检查用户名
	public String checkUnameAction() throws Exception {
		dataMap = new HashMap<String, Object>();  
		Users user = userService.findUsers(users.getuName());
		if(user != null && validateUname.equals("2")){
			
	        dataMap.put("valid", false);  
		}
		else if(user!=null && validateUname.equals("1")){
			dataMap.put("valid", true); 
		}
		else if(user == null && validateUname.equals("1")){
			dataMap.put("valid", false);
		}
		else if(user == null && validateUname.equals("2")){
			dataMap.put("valid", true);
		}
	        // 返回结果  
		return SUCCESS;
	
	}
	
	public String findAllUsersAction() throws Exception {
		List userList = userService.findAllUsers();
		request.put("userList", userList);
		return SUCCESS;
		
	}
	
	public String findUsersAction() throws Exception {
		Users user = userService.findUsers(users.getuName());
		request.put("user", user);
		return SUCCESS;
		
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

	public Map<String, Object> getDataMap() {
		return dataMap;
	}
	public void setDataMap(Map<String, Object> dataMap) {
		this.dataMap = dataMap;
	}
	
	public Users getUsers() {
		return users;
	}
	public void setUsers(Users users) {
		this.users = users;
	}
	@Override
	public Users getModel() {
		// TODO Auto-generated method stub
		return users;
	}
	public String getValidateUname() {
		return validateUname;
	}
	public void setValidateUname(String validateUname) {
		this.validateUname = validateUname;
	}
	public String getResultTemp() {
		return resultTemp;
	}
	public void setResultTemp(String resultTemp) {
		this.resultTemp = resultTemp;
	}
	
	//用户修改个人信息
	public String modUserInfo(){
		
		return SUCCESS;
	}
	
}
