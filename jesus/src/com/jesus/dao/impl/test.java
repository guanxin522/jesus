package com.jesus.dao.impl;

import com.jesus.entity.Food;

public class test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Food food=new Food();
		food.setFid("111");
		FoodDaoImpl f=new FoodDaoImpl();
		f.delFood(food);
				
	}

}
