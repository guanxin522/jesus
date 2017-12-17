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
	public void saveFood(Food food);
	
	//查找食品
	public Food findFood(String fid);
	
	//查找食品
	public Food findFoodById(Food food);
	
	//查找所有食品
	public List<Food> findAllFood();
	
	//查询食品销量
	public List findFoodVolume(String oid);
	
	//查找上架中的食品
	public List findFoodByStatus(int status);
	
	//根据食品名字模糊搜索食品
	public List searchFood(String fname);
}
