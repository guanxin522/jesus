package com.jesus.web.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.jesus.entity.Food;
import com.jesus.service.IFoodService;
import com.opensymphony.xwork2.ActionSupport;

public class FoodAction extends ActionSupport implements RequestAware,SessionAware{

	
	private Food food;
	public Food getFood() {
		return food;
	}

	public void setFood(Food food) {
		this.food = food;
	}
	Map<String, Object> session;
	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		
	}
	Map<String, Object> request;
	@Override
	public void setRequest(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		this.request=arg0;
	}
	
	IFoodService foodService;
	public IFoodService getFoodService() {
		return foodService;
	}

	public void setFoodService(IFoodService foodService) {
		this.foodService = foodService;
	}
	
	public String foodShowAction() throws Exception {
		int curPage =1;
		System.out.println("来到Action");
		List<Food> foodList=foodService.findAllFood();
//		System.out.println(foodList);
		request.put("foodList", foodList);
		return "success";
	}
	
	public String foodDetailAction() throws Exception{
		System.out.println("查看食品详情页");
//		food.setFid(request.get(arg0));
		Food detail=foodService.findFoodById(food);
		System.out.println(detail.getFid());
		request.put("detail", detail);
		return "success";
	}

}
