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
	public void saveFood(Food food);

	//查找食品信息
	public Food findFood(String fId);
	
	//查找食品信息
	public Food findFoodById(Food food);
	
	//查找所有食品
	public List<Food> findAllFood();
	
	//查找食品销量
	public List findFoodVolume(String oid);
	
	//查找上架中的食品
	public List findFoodByStatus(int status);
}
