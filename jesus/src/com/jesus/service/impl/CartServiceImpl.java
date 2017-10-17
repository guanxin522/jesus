package com.jesus.service.impl;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import com.jesus.dao.ICartDao;
import com.jesus.entity.Cart;
import com.jesus.entity.Food;
import com.jesus.entity.Users;
import com.jesus.service.ICartService;

public class CartServiceImpl implements ICartService{

	ICartDao cartDao;
	
	private double cartPrice=0.00;                     //购物车的总价格
	private double temp=0.00;    
	private int cartNum=0;                             //购物车的食物种类
	
	public ICartDao getCartDao() {
		return cartDao;
	}

	public void setCartDao(ICartDao cartDao) {
		this.cartDao = cartDao;
	}

	@Override
	public void addCart(Cart cart) {
		// TODO Auto-generated method stub
		cartDao.addCart(cart);
	}

	@Override
	public void delCart(Cart cart) {
		// TODO Auto-generated method stub
		cartDao.delCart(cart);	
	}
	public void delCart(Cart cart,List<Cart> cartList){
		
		for(Cart attribute : cartList) {
			if(attribute.getfId().equals(cart.getfId())){
				cart.setcId(attribute.getcId());
				break;
			}
		}
		cartDao.delCart(cart);
		
	}

	
	
	public void saveCart(Cart cart){
		cartDao.saveCart(cart);
	}
	@Override
	public List<Cart> findAll(Users user) {
		// TODO Auto-generated method stub
		return cartDao.findAll(user);
	}

	public List findAllFood(Users user){
		return cartDao.findAllFood(user);
	}
	
	public Cart findCart(String uId,String fId){
		return cartDao.findCart(uId, fId);
	}
	
	public double sumOfAllFood(List foodList){
//		将食物列表的价格进行相加
		cartNum=0;
		cartPrice=0.00;
		for(int i=0;i<foodList.size();i++){
			Map map = (Map)foodList.get(i);
			System.out.println(map);
			BigDecimal tmp=new BigDecimal(map.get("fPrice").toString());
			cartPrice += Double.parseDouble(map.get("fPrice").toString())*Double.parseDouble(map.get("quantity").toString());
			cartNum++;
		}
		return cartPrice;
	}

	public double getCartPrice() {
		return cartPrice;
	}

	public void setCartPrice(double cartPrice) {
		this.cartPrice = cartPrice;
	}

	public int getCartNum() {
		return cartNum;
	}

	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}
}
