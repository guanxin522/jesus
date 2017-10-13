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
	
	//修改食品
	public void saveCart(Cart cart);
	
	//查找食品
	public List findAllFood(Users user);
	public List<Cart> findAll(Users user);
	public Cart findCart(String uId,String fId);
	
}
