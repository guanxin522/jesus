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
	
	//修改食品
	public void saveCart(Cart cart);
	
	//获取购物车数量
	public List graspCartNum(String uId);
	
	//查找食品
	public List<Food> findAllFood(Users user);
	public List<Cart> findAll(Users user);
	public Cart findCart(String uId,String fId);
}
