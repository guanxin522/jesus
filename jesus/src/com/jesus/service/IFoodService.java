package com.jesus.service;

import java.util.List;

import com.jesus.entity.Food;
/**
 * 
 * @author dons
 *
 */
public interface IFoodService {
	
	//添加食品
	public void addFood(Food food);
	
	//删除食品
	public void delFood(Food food);
	
	//修改食品
	public void modifyFood(Food food);
	
	//查找食品
	public Food findFood(String foodMessage);
	
	//查找食品
	public Food findFoodById(Food food);
	
	//查找所有食品
	public List<Food> findAllFood();
}
