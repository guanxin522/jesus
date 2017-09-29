package com.jesus.dao;

import java.util.List;

import com.jesus.entity.Food;
/**
 * 
 * @ClassName:  IFoodDao   
 * @Description:TODO食品接口类   
* @author 作者 E-mail: chen dongxu
* @date:   2017年9月27日 下午10:15:24
 */
public interface IFoodDao {

	//添加食品
	public void addFood(Food food);
	
	//删除食品
	public void delFood(Food food);
	
	//修改食品信息
	public void modifyFood(Food food);

	//查找食品信息
	public Food findFood(String foodMessage);
	
	//查找食品信息
	public Food findFoodById(Food food);
	
	//查找所有食品
	public List<Food> findAllFood();
	
}
