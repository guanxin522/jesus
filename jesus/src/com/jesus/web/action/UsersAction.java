package com.jesus.web.action;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.jesus.entity.Users;
import com.jesus.service.ICartService;
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
	ICartService cartService;
	IUserService userService;
	private String other;
	private String value;
	
	public void setUserService(IUserService userService) {
		this.userService = userService;
	}
	public String loginUserAction() throws Exception {
		String uName = users.getuName();
		String uPwd = users.getuPwd();
		Users user = userService.loginUser(uName, uPwd);
		if(user != null)
		{
			List list = cartService.graspCartNum(user.getuId());
			Map map = (Map) list.get(0);
			session.put("cartNum", map.get("num"));
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
		session.remove("cartNum");
		session.remove("user");
		return "success";
	}
	
	//用户注册
	public String registerAction() throws Exception {
		users.setuId(WebUtils.makeId("u"));
		Date date = new Date();
		users.setTime(date);
		users.setBalance(new BigDecimal(0.0));
		userService.addUsers(users);
		users = userService.loginUser(users.getuName(), users.getuPwd());
		session.put("user", users);
		this.resultTemp = "registerSuccess";
		return SUCCESS;
		
	}
	private Date Date() {
		// TODO Auto-generated method stub
		return null;
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
		System.out.println(userList);
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
	
	public String getOther() {
		return other;
	}
	public void setOther(String other) {
		this.other = other;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	//用户修改个人信息
	public String saveUserInfoAction() throws Exception{
		System.out.println(users.getuName()==null);
		System.out.println(users.getuName());
		Users user_session =(Users)session.get("user");
		if(other.equals("1")){
			user_session.setuName(value);
		}else if(other.equals("2")){
			user_session.setRealname(value);
		}else if(other.equals("3")){
			user_session.setTel(value);
		}else if(other.equals("4")){
			user_session.setuPwd(value);
		}else if(other.equals("5")){
			user_session.setEmail(value);
		}else if(other.equals("6")){
			user_session.setAddress(value);
		}
		userService.saveUsers(user_session);
		session.put("user", user_session);
		this.setResultTemp("yes");
		return SUCCESS;
	}
	//用户充值
	public String rechargeAction() throws Exception{
		double out=0.00;
		double in=0.00;
		Users user_session =(Users)session.get("user");
//		Users user_db = userService.findUsers(user_session.getuName());
		
		
		in= Double.parseDouble(user_session.getBalance().toString());
		out = Double.parseDouble(users.getBalance().toString());
		in=in+out;
		BigDecimal db_balance=new BigDecimal(in);
		user_session.setBalance(db_balance);
		userService.saveUsers(user_session);
		this.setResultTemp("yes");
		return SUCCESS;
	}
	public void setCartService(ICartService cartService) {
		this.cartService = cartService;
	}
	
}
