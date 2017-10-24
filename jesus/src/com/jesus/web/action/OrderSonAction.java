package com.jesus.web.action; 
/** 
* @author 作者 E-mail: 陈观鑫  490861319@qq.com
* @version 创建时间：2017年10月23日 下午10:12:52 
* 类说明 ：订单子类Action
*/

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.jesus.entity.OrderSon;
import com.jesus.service.IOrderSonService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class OrderSonAction extends ActionSupport implements RequestAware,SessionAware,ModelDriven<OrderSon>{
	private OrderSon orderSon;
	private IOrderSonService orderSonService;
	
	public String findAllOrderSon() throws Exception{
		List OrderSonList = orderSonService.findAllOrderSon();
		request.put("OrderSonList", OrderSonList);
		return SUCCESS;
	}
	
	public void setOrderSon(OrderSon orderSon) {
		this.orderSon = orderSon;
	}
	public void setOrderSonService(IOrderSonService orderSonService) {
		this.orderSonService = orderSonService;
	}
	Map<String, Object> session;
	@Override
	public void setSession(Map<String, Object> session) {
		// TODO Auto-generated method stub
		this.session=session;
	}
	Map<String, Object> request;
	@Override
	public void setRequest(Map<String, Object> request) {
		// TODO Auto-generated method stub
		this.request=request;
	}
	@Override
	public OrderSon getModel() {
		// TODO Auto-generated method stub
		return orderSon;
	}
}
 