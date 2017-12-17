package com.jesus.web.action;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.jesus.entity.Cart;
import com.jesus.entity.Food;
import com.jesus.entity.OrderSon;
import com.jesus.entity.Orders;
import com.jesus.entity.Users;
import com.jesus.service.ICartService;
import com.jesus.service.IFoodService;
import com.jesus.service.IOrdersService;
import com.jesus.service.IUserService;
import com.jesus.util.WebUtils;
import com.opensymphony.xwork2.ActionSupport;



public class OrdersAction extends ActionSupport implements RequestAware,SessionAware{

	
	private Orders orders;
	private Users user;
	private Food food;
	private Cart cart;
	private IOrdersService ordersService;
	private ICartService cartService;
	private String resultTemp;
	private IUserService userService;
	private IFoodService foodService;
	private String payTarget;
	private String oidAjax;
	private String ostatusAjax;
	private String oTemp;
	private String keywords;
	public void setUserService(IUserService userService) {
		this.userService = userService;
	}


	
	public String getoTemp() {
		return oTemp;
	}



	public void setoTemp(String oTemp) {
		this.oTemp = oTemp;
	}



	public void setOrdersService(IOrdersService ordersService) {
		this.ordersService = ordersService;
	}


	public void setOrders(Orders orders) {
		this.orders = orders;
	}

	public void setUser(Users user) {
		this.user = user;
	}
	public void setFood(Food food) {
		this.food = food;
	}
	

	public String getKeywords() {
		return keywords;
	}



	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}


	Map<String, Object> session;
	Map<String, Object> request;
	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		session=arg0;
	}

	@Override
	public void setRequest(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		request=arg0;
	}

	public String findAllOrders() throws Exception{		
		List ordersList = ordersService.findAllOrders(orders.getoStatus());
		request.put("ordersList", ordersList);
		request.put("resultTemp", orders.getoStatus());
		return SUCCESS;
	}
	public String showPaidOrdersAction() throws Exception{
		user=(Users)session.get("user");
		List paidOrdersonList= ordersService.findOstatusFood(user.getuId(),"1");
		List paidOrderList = ordersService.findOrdersByUser(user.getuId());
		List paidShowOrderList = new ArrayList();
		
		for(int i=0;i<paidOrderList.size();i++) {
			Orders orderMapTemp = (Orders) paidOrderList.get(i);
			if(!orderMapTemp.getoStatus().equals("1")) continue;	
			Map<String, Object> orderMap = new HashMap<String, Object>();
			orderMap.put("oId", orderMapTemp.getoId());
			orderMap.put("oPrice", orderMapTemp.getoPrice());
			orderMap.put("oTime", orderMapTemp.getoTime());
			orderMap.put("oStatus", orderMapTemp.getoStatus());
			orderMap.put("uId", orderMapTemp.getuId());
			List ordersonList = new ArrayList();
			for(int j=0;j<paidOrdersonList.size();j++) {
				Map ordersonMap = (Map) paidOrdersonList.get(j);
				if(orderMap.get("oId").equals(ordersonMap.get("oid"))){
					ordersonList.add(ordersonMap);
				}
			}
			orderMap.put("ordersonList", ordersonList);
			paidShowOrderList.add(orderMap);
		}
		
		request.put("paidShowOrderList", paidShowOrderList);
		return "success";
	}
	public String showNotSignOrdersAction() throws Exception{
		
		user=(Users)session.get("user");
		List paidOrdersonList= ordersService.findOstatusFood(user.getuId(),"2");
		List paidOrderList = ordersService.findOrdersByUser(user.getuId());
		List notSignShowOrderList = new ArrayList();
		
		for(int i=0;i<paidOrderList.size();i++) {
			Orders orderMapTemp = (Orders) paidOrderList.get(i);
			if(!orderMapTemp.getoStatus().equals("2")) continue;	
			Map<String, Object> orderMap = new HashMap<String, Object>();
			orderMap.put("oId", orderMapTemp.getoId());
			orderMap.put("oPrice", orderMapTemp.getoPrice());
			orderMap.put("oTime", orderMapTemp.getoTime());
			orderMap.put("oStatus", orderMapTemp.getoStatus());
			orderMap.put("uId", orderMapTemp.getuId());
			List ordersonList = new ArrayList();
			for(int j=0;j<paidOrdersonList.size();j++) {
				Map ordersonMap = (Map) paidOrdersonList.get(j);
				if(orderMap.get("oId").equals(ordersonMap.get("oid"))){
					ordersonList.add(ordersonMap);
				}
			}
			orderMap.put("ordersonList", ordersonList);
			notSignShowOrderList.add(orderMap);
		}
		
		request.put("notSignShowOrderList", notSignShowOrderList);
		return "success";
	}
	public String showSignOrdersAction() throws Exception{

		user=(Users)session.get("user");
		List paidOrdersonList= ordersService.findOstatusFood(user.getuId(),"3");
		List paidOrderList = ordersService.findOrdersByUser(user.getuId());
		List signShowOrderList = new ArrayList();
		
		for(int i=0;i<paidOrderList.size();i++) {
			Orders orderMapTemp = (Orders) paidOrderList.get(i);
			if(!orderMapTemp.getoStatus().equals("3")) continue;	
			Map<String, Object> orderMap = new HashMap<String, Object>();
			orderMap.put("oId", orderMapTemp.getoId());
			orderMap.put("oPrice", orderMapTemp.getoPrice());
			orderMap.put("oTime", orderMapTemp.getoTime());
			orderMap.put("oStatus", orderMapTemp.getoStatus());
			orderMap.put("uId", orderMapTemp.getuId());
			List ordersonList = new ArrayList();
			for(int j=0;j<paidOrdersonList.size();j++) {
				Map ordersonMap = (Map) paidOrdersonList.get(j);
				if(orderMap.get("oId").equals(ordersonMap.get("oid"))){
					ordersonList.add(ordersonMap);
				}
			}
			orderMap.put("ordersonList", ordersonList);
			signShowOrderList.add(orderMap);
		}
		
		request.put("signShowOrderList", signShowOrderList);
		return "success";
	}
	public String showUnpaidOrdersAction() throws Exception{
		System.out.println(oTemp);
		user=(Users)session.get("user");
		List unpaidOrdersonList= ordersService.findOstatusFood(user.getuId(),"0");
		List unpaidOrderList = ordersService.findOrdersByUser(user.getuId());
		List unpaidShowOrderList = new ArrayList();
		
		for(int i=0;i<unpaidOrderList.size();i++) {
			Orders orderMapTemp = (Orders) unpaidOrderList.get(i);
			if(!orderMapTemp.getoStatus().equals("0"))continue;
			Map orderMap = new HashMap();
			orderMap.put("oId", orderMapTemp.getoId());
			orderMap.put("oPrice", orderMapTemp.getoPrice());
			orderMap.put("oTime", orderMapTemp.getoTime());
			orderMap.put("oStatus", orderMapTemp.getoStatus());
			orderMap.put("uId", orderMapTemp.getuId());
			List ordersonList = new ArrayList();
			for(int j=0;j<unpaidOrdersonList.size();j++) {
				Map ordersonMap = (Map) unpaidOrdersonList.get(j);
				if(orderMap.get("oId").equals(ordersonMap.get("oid"))){
					ordersonList.add(ordersonMap);
				}
			}
			orderMap.put("ordersonList", ordersonList);
			unpaidShowOrderList.add(orderMap);
		}
		
		request.put("unpaidShowOrderList", unpaidShowOrderList);
		return "success";
	}
	public String showOrdersAction()throws Exception{
		
		if(oTemp==null)oTemp = "0";
		System.out.println("otemp"+oTemp);
		user=(Users)session.get("user");
		List OrdersonList= ordersService.findOstatusFood(user.getuId(),oTemp);
		List OrderList = ordersService.findOrdersByUser(user.getuId());
		List ShowOrderList = new ArrayList();
		
		for(int i=0;i<OrderList.size();i++) {
			Orders orderMapTemp = (Orders) OrderList.get(i);
			if(!orderMapTemp.getoStatus().equals(oTemp))continue;
			Map orderMap = new HashMap();
			orderMap.put("oId", orderMapTemp.getoId());
			orderMap.put("oPrice", orderMapTemp.getoPrice());
			orderMap.put("oTime", orderMapTemp.getoTime());
			orderMap.put("oStatus", orderMapTemp.getoStatus());
			orderMap.put("uId", orderMapTemp.getuId());
			List ordersonList = new ArrayList();
			for(int j=0;j<OrdersonList.size();j++) {
				Map ordersonMap = (Map) OrdersonList.get(j);
				if(orderMap.get("oId").equals(ordersonMap.get("oid"))){
					ordersonList.add(ordersonMap);
				}
			}
			orderMap.put("ordersonList", ordersonList);
			ShowOrderList.add(orderMap);
		}
		
		request.put("showOrderList", ShowOrderList);
		if(oTemp.equals("1")){
			System.out.println(oTemp);
			return "showPaidOrders";
		}else if(oTemp.equals("2")){
			System.out.println(oTemp);
			return "showNotSignOrders";
		}else if(oTemp.equals("3")){
			System.out.println(oTemp);
			return "showSignOrders";
		}else{
			System.out.println(oTemp);
			return "showUnpaidOrders";
		}
	}
	//搜索
	public String searchOrdersAction() throws Exception{
		System.out.println(keywords);
		if(oTemp==null)oTemp = "0";
		System.out.println("otemp"+oTemp);
		user=(Users)session.get("user");
		List OrdersonList= ordersService.findOrdersByKeyword(user.getuId(), oTemp, keywords);
		List OrderList = ordersService.findOrdersByUser(user.getuId());
		List ShowOrderList = new ArrayList();
		
		for(int i=0;i<OrderList.size();i++) {
			Orders orderMapTemp = (Orders) OrderList.get(i);
			if(!orderMapTemp.getoStatus().equals(oTemp))continue;
			Map orderMap = new HashMap();
			orderMap.put("oId", orderMapTemp.getoId());
			orderMap.put("oPrice", orderMapTemp.getoPrice());
			orderMap.put("oTime", orderMapTemp.getoTime());
			orderMap.put("oStatus", orderMapTemp.getoStatus());
			orderMap.put("uId", orderMapTemp.getuId());
			List ordersonList = new ArrayList();
			for(int j=0;j<OrdersonList.size();j++) {
				Map ordersonMap = (Map) OrdersonList.get(j);
				if(orderMap.get("oId").equals(ordersonMap.get("oid"))){
					ordersonList.add(ordersonMap);
				}
			}
			orderMap.put("ordersonList", ordersonList);
			ShowOrderList.add(orderMap);
		}
		
		request.put("showOrderList", ShowOrderList);
		if(oTemp.equals("1")){
			System.out.println(oTemp);
			return "showPaidOrders";
		}else if(oTemp.equals("2")){
			System.out.println(oTemp);
			return "showNotSignOrders";
		}else if(oTemp.equals("3")){
			System.out.println(oTemp);
			return "showSignOrders";
		}else{
			System.out.println(oTemp);
			return "showUnpaidOrders";
		}
	}
	public String payOrdersAction() throws Exception{
		//获取订单价格
		double price=Double.valueOf(ordersService.findOrderByOid(payTarget).getoPrice().toString());
		//获取用户所点的物品对应oid
		Users userSession=(Users)session.get("user");
		
		Users user= userService.findUsersById(userSession.getuId());
		double balance = Double.valueOf(user.getBalance().toString());
		Orders tmp = ordersService.findOrderByOid(payTarget);
		System.out.println("payTarget:"+payTarget);
		if(balance>=price){
			user.setBalance(new BigDecimal(String.valueOf(balance-price)));
			tmp.setoStatus("1");
			tmp.setoTime(new Date());
			ordersService.payOrders(tmp);
			userService.saveUsers(user);
			
			this.resultTemp = "yes";
		}else{
			this.resultTemp = "no";
		}
		
		return SUCCESS;
		
	}
	public String addOrdersAction() throws Exception{
//		// TODO Auto-generated method stub	
		user=(Users)session.get("user");
		List<Cart> cartList=(List<Cart>)session.get("cartList");
		
		Double oprice =Double.valueOf((String) session.get("cartPrice"));
		List foodList=(List) session.get("foodList");
		List<OrderSon> list=new ArrayList<OrderSon>();
		
		System.out.println("list:"+foodList);
		System.out.println("oprice:"+oprice);
		System.out.println("user:"+user.getuId());
//		 Date date = new Date();
		Orders order =new Orders();
//		OrderSon orderSon=new OrderSon();
		order.setoId(WebUtils.makeId("o"));
		order.setoTime(new java.sql.Timestamp(new Date().getTime()));
		order.setuId(user.getuId());
		order.setoPrice(new BigDecimal(String.valueOf(oprice)));
		order.setoStatus("0");
		//将购物车信息存入
		for(int i=0;i<foodList.size();i++){
			OrderSon orderSon=new OrderSon();
			Map map = (Map)foodList.get(i);
			orderSon.setfId(map.get("fId").toString());
			orderSon.setoId(order.getoId());
			orderSon.setOsId(WebUtils.makeId("os")+String.valueOf(i));
			System.out.print("osID:"+orderSon.getOsId());
			orderSon.setfPrice(new BigDecimal(map.get("fPrice").toString()));
			orderSon.setQuantity(map.get("quantity").toString());
			orderSon.setfName(map.get("fName").toString());
			orderSon.setfImage(map.get("fImage").toString());
			orderSon.setfDescri(map.get("fDescri").toString());
			list.add(orderSon);
		}
		//生成订单后，清空购物车
		for(int i=0;i<cartList.size();i++){
			cart=cartList.get(i);
			System.out.println("cart:"+cart);
			cartService.delCart(cart);
		}
		System.out.println("test1");
		session.put("cartNum",0);
		//存入
		List cartNumList = cartService.graspCartNum(user.getuId());
		Map map = (Map) cartNumList.get(0);
		session.put("cartNum", map.get("num"));
		ordersService.addOrders(order,list);
		
		//判断余额并返回提示信息
//	double price=Double.valueOf(session.get("cartPrice").toString());
//	Users user=(Users)session.get("user");
//		double balance=Double.valueOf(user.getBalance().toString());
//	if(balance>=price){
//			this.resultTemp = "yes";
//			request.put("payMessage", "支付成功");
//		}else{
//			this.resultTemp = "no";
//			request.put("payMessage", "余额不足");
//	}
//		
//		request.put("oId", order.getoId());
//		request.put("balance", user.getBalance().toString());
		return "success";
	}

	public String changeOrderStatusAction() throws Exception{
		Orders od = ordersService.findOrderByOid(oidAjax);
		od.setoStatus(ostatusAjax);
		if(ostatusAjax.equals("3")){
			List volumeList = foodService.findFoodVolume(oidAjax);
			for(int i=0;i<volumeList.size();i++){
				Map volumeMap = (Map) volumeList.get(i);
				Food f = foodService.findFood((String)(volumeMap.get("fid")));
				int volume = Integer.parseInt((String)volumeMap.get("quantity"));
				f.setfVolume(f.getfVolume()+volume);
				foodService.saveFood(f);
			}
		}
		ordersService.saveOrders(od);
		this.setResultTemp("ok");
		return SUCCESS;
		
	}
	public void setCart(Cart cart) {
		this.cart = cart;
	}

	public void setCartService(ICartService cartService) {
		this.cartService = cartService;
	}


	public String getResultTemp() {
		return resultTemp;
	}


	public void setResultTemp(String resultTemp) {
		this.resultTemp = resultTemp;
	}


	public void setOidAjax(String oidAjax) {
		this.oidAjax = oidAjax;
	}


	public void setOstatusAjax(String ostatusAjax) {
		this.ostatusAjax = ostatusAjax;
	}


	public String getPayTarget() {
		return payTarget;
	}


	public void setPayTarget(String payTarget) {
		this.payTarget = payTarget;
	}


	public void setFoodService(IFoodService foodService) {
		this.foodService = foodService;
	}
	
}
