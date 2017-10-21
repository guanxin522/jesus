package com.jesus.web.action;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.jesus.entity.Cart;
import com.jesus.entity.Food;
import com.jesus.entity.Users;
import com.jesus.service.ICartService;
import com.jesus.util.WebUtils;
import com.opensymphony.xwork2.ActionSupport;



public class CartAction extends ActionSupport implements RequestAware,SessionAware{

	private static final long serialVersionUID = 1L;
	private Cart cart;
	private Users user;
	private Food food;
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

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}

	Map<String, Object> session;
	Map<String, Object> request;
	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		this.session=arg0;
	}

	@Override
	public void setRequest(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		this.request=arg0;
		
	}
	ICartService cartService;
	public ICartService getCartService() {
		return cartService;
	}

	public void setCartService(ICartService cartService) {
		this.cartService = cartService;
	}

	//展示购物车
	public String cartShowAction() throws Exception{
	
		String cartPrice;                     //购物车的总价格
		double temp=0.00;
		int cartNum=0;                             //购物车的食物种类
		
		//获取当前用户
		user=(Users)session.get("user");
		
		//获取当前用户的购物车食物
		List<Cart> cartList=cartService.findAll(user);
		List foodList=cartService.findAllFood(user);
		
		cartPrice=cartService.sumOfAllFood(foodList);
		cartNum=cartService.getCartNum();
		
		//将 == 购物车 == 和购物车对应的 == 食物 == 放入session
		session.put("cartList", cartList);	
		session.put("foodList", foodList);
		session.put("cartPrice", cartPrice);
		session.put("cartNum", cartNum);
		return "success";
	}
	
	//添加食品到购物车
	public String addCartAction() throws Exception{
		
		user=(Users)session.get("user");
		
		//获取由前台传来的用户购买食品的数量
		int n=Integer.parseInt(cart.getQuantity());
		//获取用户购买的食品ID
		String fid=(String)request.get("cart.fId");
		//根据食品的ID和用户的ID去查找原来的购物车是否有该类型的食品
		//有======添加数量，无=======添加新的食品类新到购物车
		Cart t=cartService.findCart(user.getuId(), fid);
		if(t!=null){
			t.setQuantity(String.valueOf(Integer.parseInt(t.getQuantity())+n));
			cartService.saveCart(t);
		}else{	
			cart.setQuantity(String.valueOf(n));
			cart.setuId(user.getuId());
			cart.setcId(WebUtils.makeId("c"));
			cartService.addCart(cart);
		}
		return "success";
	}
	public String delCartAction() throws Exception{
		//从session中获取购物车列表
		List<Cart> cartList=(List<Cart>)session.get("cartList");
		//在购物车列表中找出用户删除对应的食物id
		cartService.delCart(cart, cartList);
		return "success";
	}

}
