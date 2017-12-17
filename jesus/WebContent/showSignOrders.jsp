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
        <h1 class="title">历史订单</h1> 
        <div class="more clearfix"> 
         <form id="J_orderSearchForm" class="search-form clearfix" action="searchOrdersAction" method="get"> 
          <label for="search" class="hide">站内搜索</label> 
          <input class="search-text" type="search" id="J_orderSearchKeywords" name="keywords" autocomplete="off" placeholder="输入商品名称、商品编号、订单号" /> 
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
             已签收
             </div> 
            </div> 
            <table class="order-detail-table"> 
             <thead> 
              <tr> 
               <th class="col-main"> <p class="caption-info"><fmt:formatDate type="time" value="${mealItem.oTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate><span class="sep">|</span><s:property  value="#session.user.uName"/><span class="sep">|</span>订单号：${mealItem.oId}<span class="sep">|</span>在线支付</p> </th> 
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
                  <img src="${pageContext.request.contextPath}/${mealItem2.fimage}" width="80" height="80" alt="${mealItem2.fname}" /> 
                  </div> <p class="name"> ${mealItem2.fname} </p> <p class="price">${mealItem2.fprice}元 &times; ${mealItem2.quantity}</p> </li> 
                </s:iterator>
                
                </ul> </td> 
            <!--    <td class="order-actions">   <a class="btn btn-small btn-line-gray" href="//order.mi.com/user/orderView/1171021946411519">订单详情</a></td>  -->
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

</script>
 </body>
</html> 