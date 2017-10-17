package com.jesus.service;

import java.util.List;

import com.jesus.entity.Cart;
import com.jesus.entity.Food;
import com.jesus.entity.Users;

public interface ICartService {
	
	//添加食品
	public void addCart(Cart cart);
	
	//删除食品
	public void delCart(Cart cart);
	public void delCart(Cart cart,List<Cart> cartList);
	
	//修改食品
	public void saveCart(Cart cart);
	
	//查找食品
	public List findAllFood(Users user);
	public List<Cart> findAll(Users user);
	public Cart findCart(String uId,String fId);
	
	//将食物的价格相加事务
	public double sumOfAllFood(List list);
	
	//获取购物车食物种类
	public int getCartNum();
	//获取购物车价格
	public double getCartPrice();
	
}
