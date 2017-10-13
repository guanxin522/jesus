<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags" 
%> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>我的购物车</title>
		<link rel="stylesheet" type="text/css" href="./resources/css/style2.css">
	</head>
	<body>
	<!-- start header -->
	<!--end header -->

<!-- start banner_x -->

		<div class="xiantiao"></div>
		<div class="gwcxqbj">
			<div class="gwcxd center">
				<div class="top2 center">
					<div class="sub_top fl"></div>
					<div class="sub_top fl">商品名称</div>
					<div class="sub_top fl" style="margin-left:270px">单价</div>
					<div class="sub_top fl">数量</div>
					<div class="sub_top fl">详情页</div>
					<div class="sub_top fr">操作</div>
					<div class="clear"></div>
				</div>
			<s:iterator var="mealItem" value="#session.foodList" >
				<div class="content2 center">
					<div class="sub_content fl "></div>
					<div class="sub_content fl"><img src="${pageContext.request.contextPath}/${mealItem.fImage}" width=80 height=90></div>
					<div class="sub_content fl ">${mealItem.fName}</div>
					<div class="sub_content fl">${mealItem.fPrice}</div>
                    <div class="sub_content fl">${mealItem.quantity}</div>
					<div class="sub_content fl"><a href="${pageContext.request.contextPath}/foodDetailAction?food.fId=${mealItem.fId}">详</a></div>
					<div class="sub_content fl"><a href="${pageContext.request.contextPath}/delCartAction?cart.fId=${mealItem.fId}">×</a></div>
					<div class="clear"></div>
				</div>
			</s:iterator>
				
	
			</div>
			<div class="jiesuandan mt20 center">
				<div class="tishi fl ml20">
					<ul>
						<li><a href="${pageContext.request.contextPath}/foodShowAction">继续购物</a></li>
						<li>|</li>
						<li>共<span><s:property  value="#session.cartNum"/></span>件商品</li>
						<div class="clear"></div>
					</ul>
				</div>
				<div class="jiesuan fr">
					<div class="jiesuanjiage fl">合计（不含运费）：<span><s:property  value="#session.cartPrice"/>元</span></div>
					<div class="jsanniu fr"><a href="${pageContext.request.contextPath}/addOrdersAction"><input class="jsan" type="submit" name="jiesuan"  value="去结算"/></a></div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
			
		</div>

  

	
	<!-- footer -->
	<footer class="center">
			
			<div class="mt20">小米商城|MIUI|米聊|多看书城|小米路由器|视频电话|小米天猫店|小米淘宝直营店|小米网盟|小米移动|隐私政策|Select Region</div>
			<div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号</div> 
			<div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>
		</footer>

	</body>
</html>