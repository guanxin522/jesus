<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags" 
%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
 <head> 
  <meta charset="UTF-8" /> 
  <title>订单中心</title> 
  <link rel="stylesheet" type="text/css" href="./resources/css/style2.css" /> 
  <link rel="stylesheet" type="text/css" href="./resources/css/base.min.css" /> 
  <link rel="stylesheet" type="text/css" href="./resources/css/main.min.css" /> 
 </head> 
 <body> 
  <!-- start header --> 
  <jsp:include page="header.jsp" /> 
  <!--end header --> 
  <!-- start banner_x --> 
  <!-- end banner_x --> 
  <!-- self_info --> 
  <div class="grzxbj" style="padding-top: 60px;"> 
   <div class="selfinfo center"> 
    <div class="lfnav fl"> 
     <div class="ddzx">
      订单中心
     </div> 
     <div class="subddzx"> 
      <ul> 
       <li><a href="${pageContext.request.contextPath}/showOrdersAction?oTemp=0">待付款订单</a></li> 
       <li><a href="${pageContext.request.contextPath}/showOrdersAction?oTemp=1">已支付订单</a></li> 
       <li><a href="${pageContext.request.contextPath}/showOrdersAction?oTemp=2">待确认订单</a></li> 
       <li><a href="${pageContext.request.contextPath}/showOrdersAction?oTemp=3">历史订单</a></li> 
      </ul> 
     </div> 
     <div class="ddzx">
      个人中心
     </div> 
     <div class="subddzx"> 
      <ul> 
       <li><a href="${pageContext.request.contextPath}/findUsersToUserAction">我的个人中心</a></li> 
      </ul> 
     </div> 
    </div> 
    <div class="span16"> 
     <div class="uc-box uc-main-box"> 
      <div class="uc-content-box order-list-box"> 
       <div class="box-hd"> 
        <h1 class="title">未支付订单</h1> 
        <div class="more clearfix"> 
         <form id="J_orderSearchForm" class="search-form clearfix" action="searchOrdersAction?oTemp=0" method="get" enctype="multipart/form-data"> 
          <label for="search" class="hide">站内搜索</label> 
          <input type="hidden" value="0" name="oTemp" id="oTemp" />
          <input class="search-text" type="search" id="J_orderSearchKeywords" name="keywords" autocomplete="off" placeholder="输入食品名称" /> 
          <input type="submit" class="search-btn iconfont" value="" /> 
         </form> 
        </div> 
       </div> 
       <div class="box-bd"> 
        <div id="J_orderList">
        
         <ul class="order-list">
         
         <s:iterator var="mealItem" value="#request.showOrderList" >
         
          <li class="uc-order-item uc-order-item-pay"> 
           <div class="order-detail"> 
            <div class="order-summary"> 
             <div class="order-status">
              等待付款
             </div> 
            </div> 
            <table class="order-detail-table"> 
             <thead> 
              <tr> 
               <th class="col-main"> <p class="caption-info"><fmt:formatDate type="time" value="${mealItem.oTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate><span class="sep">|</span><s:property  value="#session.user.uName"/><span class="sep">|</span>订单号： ${mealItem.oId}<span class="sep">|</span>在线支付</p> </th> 
               <th class="col-sub"> <p class="caption-price">订单金额：<span class="num">${mealItem.oPrice}</span>元</p> </th> 
              </tr> 
             </thead> 
             <tbody> 
              <tr> 
               <td class="order-items"> 
                <ul class="goods-list"> 
                
                <s:iterator var="mealItem2" value="ordersonList" >
                 <li> 
                  <div class="figure figure-thumb"> 
                   <a href="${pageContext.request.contextPath}/foodDetailAction?fId=${mealItem2.fid}"> <img src="${pageContext.request.contextPath}/${mealItem2.fimage}" width="80" height="80" alt="${mealItem2.fname}" /> </a> 
                  </div> <p class="name"> ${mealItem2.fname}</p> <p class="price">${mealItem2.fprice}元 &times; ${mealItem2.quantity}</p> </li> 
                </s:iterator>
                
                </ul> </td> 
              <td class="order-actions"> <a class="btn btn-small btn-primary" href="javascript:pay(this,'<s:property  value="#mealItem.oId"/>');" target="_blank">立即支付</a> </td>  
              <!-- <a class="btn btn-small btn-line-gray" href="//order.mi.com/user/orderView/1171021946411519">订单详情</a> -->
              </tr> 
             </tbody> 
            </table> 
           </div></li>
           
           
           </s:iterator>
      
         </ul>
        </div> 
       </div> 
      </div> 
     </div> 
    </div> 
    <div class="clear"></div> 
   </div> 
  </div>

<!-- self_info -->
		    <jsp:include page="footer.jsp"/>

	<script>
	function pay(obj,id){
	layer.confirm('确认要支付吗？',{title:'支付',time:0},
			function(index){	
		$.ajax({
			type: 'POST',
			url: 'payOrdersAction',
			data:{
		        payTarget:id
			},
			dataType: 'json',
			success: function(data){
				if(data.resultTemp == 'yes'){
					layer.msg('支付成功',{icon:6,time:1500});
					 setTimeout(function () {
							location.href="showOrdersAction";
				        },1500);
					 $(obj).remove();
				}
				else{
					layer.msg('余额不足', {
						  time: 0 //不自动关闭
						  ,icon: 5
						  ,btn: ['充值', '不要了']
						  ,yes: function(index){
						    layer.close(index);
							var reg;
							var msg = "输入金额只能在1-100之间的整数"
							reg = /^([1-9]\d{0,1}|100)$/;
							 layer.prompt({
								 title: '请输入充值的金额',
								 formType: 3,
								 yes: function(index, layero){
								 var t = layero.find(".layui-layer-input").val();
									 if (!reg.test(t)) {  
										 layer.msg(msg,{icon:5,time:1500});
										 //layer.close(index);
									    }
									 else{
										  $.ajax({
												type: 'POST',
												url: 'rechargeAction',
												data:{
													balance:t,
												},
												dataType: 'json',
												success: function(data){
													layer.msg('充值成功',{icon:6,time:1500});
													setTimeout(function () {
														location.reload();
											        },1500);
												},
												error:function(data) {
													console.log(data.msg);
												},
											});	 
									 }
								 },
									});
						  }
						});
				}
			},
			error:function(data) {
				console.log(data.msg);
			},
		});		
	});
}
</script>
 </body>
</html> 