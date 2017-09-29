package com.jesus.dao;

import java.util.List;

import com.jesus.entity.Cart;
import com.jesus.entity.Food;
import com.jesus.entity.Users;
/**
 * 
 * @ClassName:  ICarDao   
 * @Description:TODO 购物车接口类  
* @author 作者 E-mail: 陈东旭
* @date:   2017年9月27日 下午10:23:01
 */
public interface ICartDao {

	//添加食品
	public void addCart(Cart cart);
	
	//删除食品
	public void delCart(Cart cart);
	
	//查找食品
	public List<Cart> findAll(Users user);
}
