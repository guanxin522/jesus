<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags" 
%> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>小米商城-个人中心</title>
		<link rel="stylesheet" type="text/css" href="./resources/css/style2.css">
	</head>
	<body>
	<!-- start header -->
	<jsp:include page="header.jsp"/>
	<!--end header -->
	<!-- start banner_x -->

<!-- end banner_x -->
<!-- showOrders -->
	<div class="grzxbj" style="padding-top: 60px;">
		<div class="selfinfo center">
		<div class="lfnav fl">
			<div class="ddzx">订单中心</div>
			<div class="subddzx">
				<ul>
					<li><a href="${pageContext.request.contextPath}/showUnpaidtOrdersAction">待付款订单</a></li>


					<li><a href="${pageContext.request.contextPath}/showPaidtOrdersAction">历史订单</a></li>
				</ul>
			</div>
			<div class="ddzx">个人中心</div>
			<div class="subddzx">
				<ul>
					<li><a href="${pageContext.request.contextPath}/selfInfo.jsp">我的个人中心</a></li>

					<li><a href="">收货地址</a></li>
				</ul>
			</div>
		</div>
		<div class="rtcont fr">
			<div class="ddzxbt">交易订单</div>
			<s:iterator var="mealItem" value="#session.paidOrderList" >
			<div class="ddxq">
				<div class="ddspt fl"><img src="./resources/images/liebiao_hongmin4_dd.jpg" alt=""></div>
				<div class="ddbh fl">${mealItem.fname}</div>
				<div class="ztxx fr">
					<ul>
					<s:if test="#mealItem.ostatus==1">
						 <li>已付款</li>
					</s:if>
					<s:elseif test="#mealItem.ostatus==0"> 
						<li><a href="#" onClick="pay(this,'101')">待付款</a></li>
					</s:elseif> 

						<li>￥${mealItem.fprice}</li>
						<li>数量:${mealItem.quantity}</li>
						<li><a href="#" onClick="">×</a></li>
						<div class="clear"></div>
					</ul>
				</div>
				<div class="clear"></div>
			</div>
			</s:iterator>
		</div>
		<div class="clear"></div>
		</div>
	</div>
<!-- self_info -->
		    <jsp:include page="footer.jsp"/>

	</body>
</html>