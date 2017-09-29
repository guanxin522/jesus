package com.jesus.service.impl;

import java.util.List;

import com.jesus.dao.IFoodDao;
import com.jesus.entity.Food;
import com.jesus.service.IFoodService;
/**
 * 
 * @author dons
 *
 */
public class FoodServiceImpl implements IFoodService{
	
	//
	IFoodDao foodDao;
	public void setFoodDao(IFoodDao foodDao){
		this.foodDao=foodDao;
	}
	public IFoodDao getFoodDao(){
		return foodDao;
	}
	
	public void addFood(Food food){
		foodDao.addFood(food);
	}
	public void delFood(Food food){
		foodDao.delFood(food);
	}
	public void modifyFood(Food food){
		foodDao.modifyFood(food);
	}
	public Food findFood(String foodMessage){
		return foodDao.findFood(foodMessage);
	}
	public Food findFoodById(Food food){
		return foodDao.findFoodById(food);
	}
	public List<Food> findAllFood(){
		System.out.println("来到service");
		return foodDao.findAllFood();
	}
}
