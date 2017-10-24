<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags" 
%> 
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
       <li><a href="${pageContext.request.contextPath}/showUnpaidtOrdersAction">待付款订单</a></li> 
       <li><a href="${pageContext.request.contextPath}/showPaidtOrdersAction">历史订单</a></li> 
      </ul> 
     </div> 
     <div class="ddzx">
      个人中心
     </div> 
     <div class="subddzx"> 
      <ul> 
       <li><a href="${pageContext.request.contextPath}/selfInfo.jsp">我的个人中心</a></li> 
       <li><a href="">收货地址</a></li> 
      </ul> 
     </div> 
    </div> 
    <div class="span16"> 
     <div class="uc-box uc-main-box"> 
      <div class="uc-content-box order-list-box"> 
       <div class="box-hd"> 
        <h1 class="title">我的订单<small>请谨防钓鱼链接或诈骗电话，<a href="//www.mi.com/service/buy/antifraud/" target="_blank" data-stat-id="78d07fef654ba47a" onclick="_msq.push(['trackEvent', '5cc76a9bce8347f4-78d07fef654ba47a', '//www.mi.com/service/buy/antifraud/', 'pcpid', '']);">了解更多&gt;</a></small></h1> 
        <div class="more clearfix"> 
         <ul class="filter-list J_orderType"> 
          <li class="first active"><a href="//static.mi.com/order/#type=0" data-type="0" data-stat-id="89d882413195fd4c" onclick="_msq.push(['trackEvent', '5cc76a9bce8347f4-89d882413195fd4c', '//static.mi.com/order/#type=0', 'pcpid', '']);">全部有效订单</a></li> 
          <li><a id="J_unpaidTab" href="//static.mi.com/order/#type=7" data-type="7" data-stat-id="8edf501aa1eca097" onclick="_msq.push(['trackEvent', '5cc76a9bce8347f4-8edf501aa1eca097', '//static.mi.com/order/#type=7', 'pcpid', '']);">待支付（1）</a></li> 
          <li><a id="J_sendTab" href="//static.mi.com/order/#type=8" data-type="8" data-stat-id="8308bdcf62c72b1b" onclick="_msq.push(['trackEvent', '5cc76a9bce8347f4-8308bdcf62c72b1b', '//static.mi.com/order/#type=8', 'pcpid', '']);">待收货</a></li> 
          <li><a href="//static.mi.com/order/#type=5" data-type="5" data-stat-id="d99182d42018ae52" onclick="_msq.push(['trackEvent', '5cc76a9bce8347f4-d99182d42018ae52', '//static.mi.com/order/#type=5', 'pcpid', '']);">已关闭</a></li> 
         </ul> 
         <form id="J_orderSearchForm" class="search-form clearfix" action="#" method="get"> 
          <label for="search" class="hide">站内搜索</label> 
          <input class="search-text" type="search" id="J_orderSearchKeywords" name="keywords" autocomplete="off" placeholder="输入商品名称、商品编号、订单号" /> 
          <input type="submit" class="search-btn iconfont" value="" /> 
         </form> 
        </div> 
       </div> 
       <div class="box-bd"> 
        <div id="J_orderList">
         <ul class="order-list">
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
               <th class="col-main"> <p class="caption-info">2017年10月21日 12:40<span class="sep">|</span>赖胜娇<span class="sep">|</span>订单号： <a href="//order.mi.com/user/orderView/1171021946411519">1171021946411519</a><span class="sep">|</span>在线支付</p> </th> 
               <th class="col-sub"> <p class="caption-price">订单金额：<span class="num">8198.00</span>元</p> </th> 
              </tr> 
             </thead> 
             <tbody> 
              <tr> 
               <td class="order-items"> 
                <ul class="goods-list"> 
                 <li> 
                  <div class="figure figure-thumb"> 
                   <a href="//item.mi.com/1173800030.html" target="_blank"> <img src="//i1.mifile.cn/a1/pms_1505903266.08411470!80x80.jpg" width="80" height="80" alt="小米Note 3 全网通版 6GB内存 亮蓝色 64GB" /> </a> 
                  </div> <p class="name"> <a target="_blank" href="//item.mi.com/1173800030.html">小米Note 3 全网通版 6GB内存 亮蓝色 64GB</a> </p> <p class="price">2599元 &times; 1</p> </li> 
                 <li> 
                  <div class="figure figure-thumb"> 
                   <a href="//item.mi.com/1161200011.html" target="_blank"> <img src="//i1.mifile.cn/a1/pms_1467184989.74561304!80x80.jpg" width="80" height="80" alt="小米圈铁耳机 银色" /> </a> 
                  </div> <p class="name"> <a target="_blank" href="//item.mi.com/1161200011.html">小米圈铁耳机 银色</a> </p> <p class="price">0元 &times; 1</p> </li> 
                 <li> 
                  <div class="figure figure-thumb"> 
                   <a href="//item.mi.com/1172700042.html" target="_blank"> <img src="//i1.mifile.cn/a1/pms_1505961151.72192129!80x80.jpg" width="80" height="80" alt="小米Note 3 标准高透保护膜 高透" /> </a> 
                  </div> <p class="name"> <a target="_blank" href="//item.mi.com/1172700042.html">小米Note 3 标准高透保护膜 高透</a> </p> <p class="price">0元 &times; 1</p> </li> 
                 <li> 
                  <div class="figure figure-thumb"> 
                   <a href="//item.mi.com/1172900006.html" target="_blank"> <img src="//i1.mifile.cn/a1/pms_1505875677.86046003!80x80.jpg" width="80" height="80" alt="小米Note 3  硅胶保护套 黑色" /> </a> 
                  </div> <p class="name"> <a target="_blank" href="//item.mi.com/1172900006.html">小米Note 3 硅胶保护套 黑色</a> </p> <p class="price">0元 &times; 1</p> </li> 
                 <li> 
                  <div class="figure figure-thumb"> 
                   <a href="//item.mi.com/1173000036.html" target="_blank"> <img src="//i1.mifile.cn/a1/pms_1501236937.96732594!80x80.jpg" width="80" height="80" alt="米粉卡日租卡" /> </a> 
                  </div> <p class="name"> <a target="_blank" href="//item.mi.com/1173000036.html">米粉卡日租卡</a> </p> <p class="price">0元 &times; 1</p> </li> 
                 <li> 
                  <div class="figure figure-thumb"> 
                   <a href="//item.mi.com/1173600024.html" target="_blank"> <img src="//i1.mifile.cn/a1/pms_1505897592.73836006!80x80.jpg" width="80" height="80" alt="小米笔记本电脑Pro 15 i5 8G 灰色" /> </a> 
                  </div> <p class="name"> <a target="_blank" href="//item.mi.com/1173600024.html">小米笔记本电脑Pro 15 i5 8G 灰色</a> </p> <p class="price">5599元 &times; 1</p> </li> 
                </ul> </td> 
               <td class="order-actions"> <a class="btn btn-small btn-primary" href="//order.mi.com/buy/confirm.php?id=1171021946411519" target="_blank">立即支付</a> <a class="btn btn-small btn-line-gray" href="//order.mi.com/user/orderView/1171021946411519">订单详情</a> </td> 
              </tr> 
             </tbody> 
            </table> 
           </div></li>
          <li class="uc-order-item uc-order-item-finish"> 
           <div class="order-detail"> 
            <div class="order-summary"> 
             <div class="order-status">
              已收货
             </div> 
            </div> 
            <table class="order-detail-table"> 
             <thead> 
              <tr> 
               <th class="col-main"> <p class="caption-info">2016年08月15日 10:05<span class="sep">|</span>赖胜娇<span class="sep">|</span>订单号：<a href="//order.mi.com/user/orderView/5160815342300234">5160815342300234</a><span class="sep">|</span>在线支付</p> </th> 
               <th class="col-sub"> <p class="caption-price">订单金额：<span class="num">699.00</span>元</p> </th> 
              </tr> 
             </thead> 
             <tbody> 
              <tr> 
               <td class="order-items"> 
                <ul class="goods-list"> 
                 <li> 
                  <div class="figure figure-thumb"> 
                   <a href="//item.mi.com/1162300013.html" target="_blank"> <img src="//i1.mifile.cn/a1/pms_1465371544.17485773!80x80.jpg" width="80" height="80" alt="红米手机3S 16GB 经典金色 16GB" /> </a> 
                  </div> <p class="name"> <a href="//item.mi.com/1162300013.html" target="_blank">红米手机3S 16GB 经典金色 16GB</a> </p> <p class="price">699元 &times; 1</p> </li> 
                </ul> </td> 
               <td class="order-actions"> <a class="btn btn-small btn-line-gray" href="//order.mi.com/user/orderView/5160815342300234">订单详情</a> <a class="btn btn-small btn-line-gray" href="//service.order.mi.com/apply/order/id/5160815342300234" target="_blank">申请售后</a> </td> 
              </tr> 
             </tbody> 
            </table> 
           </div> </li>
         </ul>
        </div> 
        <div id="J_orderListPages">
         <div class="xm-pagenavi"> 
          <span class="numbers first"><span class="iconfont"></span></span> 
          <span class="numbers current">1</span> 
          <span class="numbers last"><span class="iconfont"></span></span> 
         </div>
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
			url: 'addOrdersAction',
			dataType: 'json',
			success: function(data){
				if(data.resultTemp == 'yes'){
					layer.msg('支付成功',{icon:6,time:1500});
					 setTimeout(function () {
							location.href="#";
				        },1500);
				}
				else{
					layer.msg('余额不足', {
						  time: 0 //不自动关闭
						  ,icon: 5
						  ,btn: ['充值', '不要了']
						  ,yes: function(index){
						    layer.close(index);
						 layer.prompt({title: '输入充值金额', formType: 1}, function(text, index){
						  //充值逻辑
						  layer.close(index);
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