package com.jesus.service.impl;

import java.io.File;
import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.jesus.dao.IFoodDao;
import com.jesus.entity.Food;
import com.jesus.service.IFoodService;
import com.jesus.util.WebUtils;
/**
 * 
 * @author dons
 *
 */
public class FoodServiceImpl implements IFoodService{
	IFoodDao foodDao;
	public void setFoodDao(IFoodDao foodDao){
		this.foodDao=foodDao;
	}
	public IFoodDao getFoodDao(){
		return foodDao;
	}
	/**
	 * 
	 */
	public void addFood(Food food){
		Date date = new Date();
		food.setfId(WebUtils.makeId("f"));
		food.setTime(date);
		foodDao.addFood(food);
	}
	public void delFood(Food food){
		foodDao.delFood(food);
	}
	public void saveFood(Food food){
		foodDao.saveFood(food);
	}
	public Food findFood(String fId){
		return foodDao.findFood(fId);
	}
	public Food findFoodById(Food food){
		return foodDao.findFoodById(food);
	}
	public List<Food> findAllFood(){
		return foodDao.findAllFood();
	}
	
}
