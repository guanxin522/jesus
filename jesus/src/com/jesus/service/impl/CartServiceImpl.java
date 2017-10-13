package com.jesus.service.impl;

import java.util.List;

import com.jesus.dao.ICartDao;
import com.jesus.entity.Cart;
import com.jesus.entity.Food;
import com.jesus.entity.Users;
import com.jesus.service.ICartService;

public class CartServiceImpl implements ICartService{

	ICartDao cartDao;
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
}
