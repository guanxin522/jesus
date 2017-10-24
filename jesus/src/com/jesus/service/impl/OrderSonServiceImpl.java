package com.jesus.service.impl;

import java.util.List;

import com.jesus.dao.IFoodDao;
import com.jesus.dao.IOrderSonDao;
import com.jesus.service.IOrderSonService;

/** 
* @author 作者 E-mail: 
* @version 创建时间：2017年10月23日 下午10:11:14 
* 类说明 ：
*/
public class OrderSonServiceImpl implements IOrderSonService {
	IOrderSonDao orderSonDao;
	@Override
	public List findAllOrderSon() {
		// TODO Auto-generated method stub
		return orderSonDao.findAllOrderSon();
	}
	public void setOrderSonDao(IOrderSonDao orderSonDao) {
		this.orderSonDao = orderSonDao;
	}

}
 