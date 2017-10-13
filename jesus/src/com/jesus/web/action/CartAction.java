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



public class CartAction implements RequestAware,SessionAware{

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
		user=(Users)session.get("user");
		System.out.println("来到cartShowAction");
		List<Cart> cartList=cartService.findAll(user);
		List foodList=cartService.findAllFood(user);
		System.out.println(foodList);
//		System.out.println("获取到列表："+cartList);
		session.put("cartList", cartList);
		
		session.put("foodList", foodList);
//		BigDecimal price1=new BigDecimal("0.0");
//		double price2=price1.doubleValue();
//		Object price = foodList.get(0);
//		double price2=foodList.get(0).getFprice();
//		System.out.println("BigDecimal:"+price);
		double cartPrice=0.00;
		double temp=0.00;
		int cartNum=0;
//		BigDecimal price2=null;
		for(int i=0;i<foodList.size();i++){
			Map map = (Map)foodList.get(i);
			System.out.println(map);
			BigDecimal tmp=new BigDecimal(map.get("fPrice").toString());
			cartPrice += Double.parseDouble(map.get("fPrice").toString())*Double.parseDouble(map.get("quantity").toString());
			
			cartNum++;
			System.out.println(map.get("fPrice"));
		}
//		System.out.println(price);
//			price.add(food.getFprice());

		session.put("cartPrice", cartPrice);
		session.put("cartNum", cartNum);
		return "success";
	}
	
	//添加食品到购物车
	public String addCartAction() throws Exception{
		user=(Users)session.get("user");
		int n=Integer.parseInt(cart.getQuantity());
		
		String fid=(String)request.get("cart.fId");
//		Cart cart=null;
		System.out.println("来到addAction");
		System.out.println("q:"+cart.getQuantity());
//		cart.setUid(user.getUid());
		System.out.println("cartfid1:"+fid);
		System.out.println("cartfid1:"+cart.getfId());
		System.out.println("userid"+user.getuId());
		
		Cart t=cartService.findCart(user.getuId(), fid);
		if(t!=null){
			t.setQuantity(String.valueOf(Integer.parseInt(t.getQuantity())+n));
			cartService.saveCart(t);
		}else{
//			Cart t=new Cart();
			System.out.println("cart:"+cart);
			
			cart.setQuantity(String.valueOf(n));
//			cart.setCtime(time);

			cart.setuId(user.getuId());
			cart.setcId(WebUtils.makeId("c"));
			cartService.addCart(cart);
		}
		
		return "success";
	}
	public String delCartAction() throws Exception{
		System.out.println("来到delCartAction,cart:"+cart.getfId()+cart.getuId());
		List<Cart> cartList=(List<Cart>)session.get("cartList");
		for(Cart attribute : cartList) {
			if(attribute.getfId().equals(cart.getfId())){
				cart.setcId(attribute.getcId());
				break;
			}
		}
		System.out.println("cartid："+cart.getcId());
		cartService.delCart(cart);
		return "success";
	}

}
