package com.jesus.web.action;


import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.jesus.entity.Food;
import com.jesus.service.IFoodService;
import com.jesus.util.WebUtils;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class FoodAction extends ActionSupport implements RequestAware,SessionAware,ModelDriven<Food>{
	private static final long serialVersionUID = 1L;
	// 文件上传需要的参数
	private File upload; // 上传文件域对象
	private String uploadFileName; // 上传文件名
	private String uploadContentType; // 上传文件类型
	private String savePath; // 保存文件的目录路径(通过依赖注入)
	private Food food;
	private String manageFood=null;
	private String resultTemp;
	
	IFoodService foodService;
	public IFoodService getFoodService() {
		return foodService;
	}

	public void setFoodService(IFoodService foodService) {
		this.foodService = foodService;
	}
	
	public String foodShowAction() throws Exception {
		int curPage =1;
		List<Food> foodList=foodService.findAllFood();
//		System.out.println(foodList);
		request.put("foodList", foodList);
		if (manageFood == null || manageFood.equals("")){
			return SUCCESS;
		}
		else {
			manageFood = null;
			return "manage";
		}

	}
	
	public String foodDetailAction() throws Exception{
//		food.setFid(request.get(arg0));
		Food detail = foodService.findFood(food.getfId());
		System.out.println(detail);
		request.put("detail", detail);
		if (manageFood == null || manageFood.equals("")){
			return SUCCESS;
		}
		else{
			manageFood = null;
			return "internal";
		}
	}
	public String addFoodAction() throws Exception{
		String dstPath = ServletActionContext.getServletContext().getRealPath(
				this.getSavePath())+ "/" + this.getUploadFileName();
		File dstFile = new File(dstPath);
		WebUtils.copy(this.upload, dstFile);	
		String newFileName = WebUtils.makeId("i");
		this.setUploadFileName(newFileName);
		food.setfImage(this.getSavePath()+ "/" + newFileName);
		Food foodTemp = foodService.findFood(food.getfId());		
		foodService.addFood(food);
		return SUCCESS;
	}
	
	public String delFoodAction() throws Exception{
		foodService.delFood(food);
		this.setResultTemp("删除成功");
		return SUCCESS;	
	}
	
	public String changeStatusAction() throws Exception{
		int status = food.getStatus();
		Food newFood = foodService.findFood(food.getfId());
		newFood.setStatus(status);
		foodService.saveFood(newFood);
		this.setResultTemp("操作成功");
		return SUCCESS;
		
	}
	
	public String saveFoodAction() throws Exception{
		System.out.println(1322);
		Food foodTemp = foodService.findFood(food.getfId());
		String dstPath = ServletActionContext.getServletContext().getRealPath(
				this.getSavePath())+ "/" + this.getUploadFileName();
		if(this.getUploadFileName()!=null){
		File dstFile = new File(dstPath);
		WebUtils.copy(this.upload, dstFile);	
		food.setfImage(this.getSavePath()+ "/" + this.getUploadFileName());
		}
		else{
		food.setfImage(foodTemp.getfImage());
		}
		Date date = new Date();
		food.setTime(date);
		food.setStatus(foodTemp.getStatus());
		food.setfVolume(foodTemp.getfVolume());
		foodService.saveFood(food);
		return SUCCESS;
		
	}
	
	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getSavePath() {
		return savePath;
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	public String getManageFood() {
		return manageFood;
	}

	public void setManageFood(String manageFood) {
		this.manageFood = manageFood;
	}

	@Override
	public Food getModel() {
		// TODO Auto-generated method stub
		return food;
	}


	public void setResultTemp(String resultTemp) {
		this.resultTemp = resultTemp;
	}
	
	public Food getFood() {
		return food;
	}

	public void setFood(Food food) {
		this.food = food;
	}
	Map<String, Object> session;
	@Override
	public void setSession(Map<String, Object> session) {
		// TODO Auto-generated method stub
		this.session=session;
	}
	Map<String, Object> request;
	@Override
	public void setRequest(Map<String, Object> request) {
		// TODO Auto-generated method stub
		this.request=request;
	}
}
