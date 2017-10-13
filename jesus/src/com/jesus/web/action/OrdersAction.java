package com.jesus.web.action;

import java.math.BigDecimal;
import java.util.ArrayList;
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
import com.jesus.service.IOrdersService;
import com.jesus.service.IUserService;
import com.jesus.util.WebUtils;
import com.opensymphony.xwork2.ActionSupport;



public class OrdersAction extends ActionSupport implements RequestAware,SessionAware{

	
	private Orders order;
	private Users user;
	private Food food;
	private Cart cart;
	private IOrdersService ordersService;
	private ICartService cartService;
	private IUserService userService;
	
	public IUserService getUserService() {
		return userService;
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	public IOrdersService getOrdersService() {
		return ordersService;
	}

	public void setOrdersService(IOrdersService ordersService) {
		this.ordersService = ordersService;
	}

	public Orders getOrder() {
		return order;
	}

	public void setOrder(Orders order) {
		this.order = order;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public Food getFood() {
		return food;
	}

	public void setFood(Food food) {
		this.food = food;
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

	public String showOrdersAction() throws Exception{
		System.out.println("来到showOrdersAction");
		user=(Users)session.get("user");
		List<Orders> ordersList= ordersService.findOrdersByUser(user.getuId());
		session.put("ordersList", ordersList);
		System.out.println(ordersList);
		return "success";
	}
	public String payOrdersAction() throws Exception{
		//获取订单价格
//		BigDecimal price=new BigDecimal(session.get("price").toString());
		double price=Double.valueOf(session.get("cartPrice").toString());
		Users user=(Users)session.get("user");
		double balance=Double.valueOf(user.getBalance().toString());
		System.out.println("oid:"+order.getoId());
		Orders tmp=ordersService.findOrderByOid(order.getoId());
		if(balance>=price){
			user.setBalance(new BigDecimal(String.valueOf(balance-price)));
			tmp.setoStatus("1");
			ordersService.payOrders(tmp);
			userService.saveUsers(user);
			request.put("payMessage", "充值成功");
		}else{
			request.put("payMessage", "余额不足");
			return "failure";
		}
		
		return "success";
		
	}
	public String addOrdersAction() throws Exception{
//		// TODO Auto-generated method stub	
		System.out.println("来到addOrdersAction");
		user=(Users)session.get("user");
		List<Cart> cartList=(List<Cart>)session.get("cartList");
		double oprice =(double)session.get("cartPrice");
		List foodList=(List) session.get("foodList");
		List<OrderSon> list=new ArrayList<OrderSon>();
		
		System.out.println("list:"+foodList);
		System.out.println("oprice:"+oprice);
		System.out.println("user:"+user.getuId());
//		 Date date = new Date();
		Orders order =new Orders();
		OrderSon orderSon=new OrderSon();
		order.setoId(WebUtils.makeId("o"));
		order.setoTime(new java.sql.Timestamp(new java.util.Date().getTime()));
		order.setuId(user.getuId());
		order.setoPrice(new BigDecimal(String.valueOf(oprice)));
		order.setoStatus("0");
		//将购物车信息存入
		for(int i=0;i<foodList.size();i++){
			Map map = (Map)foodList.get(i);
			orderSon.setfId(map.get("fId").toString());
			orderSon.setoId(order.getoId());
			orderSon.setOsId(WebUtils.makeId("os"));
			orderSon.setfPrice(new BigDecimal(map.get("fPrice").toString()));
			orderSon.setQuantity(map.get("quantity").toString());
			list.add(orderSon);
		}
		//生成订单后，清空购物车
		for(int i=0;i<cartList.size();i++){
			cart=cartList.get(i);
			System.out.println("cart:"+cart);
			cartService.delCart(cart);
		}
		//存入
		ordersService.addOrders(order,list);
		//判断余额并返回提示信息
		double price=Double.valueOf(session.get("cartPrice").toString());
		Users user=(Users)session.get("user");
		double balance=Double.valueOf(user.getBalance().toString());
		if(balance>=price){
			request.put("payMessage", "支付成功");
		}else{
			request.put("payMessage", "余额不足");
		}
		
		request.put("oId", order.getoId());
		request.put("balance", user.getBalance().toString());
		return "success";
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}

	public ICartService getCartService() {
		return cartService;
	}

	public void setCartService(ICartService cartService) {
		this.cartService = cartService;
	}
}