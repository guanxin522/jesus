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
		<jsp:include page="header.jsp"/>
	<!--end header -->

<!-- start banner_x -->

		<div class="xiantiao"></div>
		<div class="gwcxqbj" style="padding-top: 60px;">
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
					<div class="jiesuanjiage fl">合计：<span><s:property  value="#session.cartPrice"/>元</span></div>
					<div class="jsanniu fr"><a href="#"><input class="jsan" type="button" name="jiesuan" onClick="buy(this,'<s:property  value="#session.foodList"/>')" value="去结算"/></a></div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
			
		</div>

  

	
	<!-- footer -->
		<jsp:include page="footer.jsp"/>

	</body>
<script>
function buy(obj,id){
	
	if(id!="[]"){ // "",null,undefined
		location.href="addOrdersAction";
    }else{
    	layer.alert("购物车什么都没有！！！");
    	
    }
	
}
</script>
</html>