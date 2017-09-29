package com.jesus.service;

import java.util.List;

import com.jesus.entity.Cart;
import com.jesus.entity.Users;

public interface ICartService {
	
	//添加食品
	public void addCart(Cart cart);
	
	//删除食品
	public void delCart(Cart cart);
	
	//查找食品
	public List<Cart> findAll(Users user);
	
}
