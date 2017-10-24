<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags" 
%> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>个人中心</title>
		<link rel="stylesheet" type="text/css" href="./resources/css/style2.css">
	</head>
	<body>
	<!-- start header -->
	<jsp:include page="header.jsp"/>
	<!--end header -->
	<!-- start banner_x -->
	<!-- end banner_x -->
    <!-- self_info -->
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
			<div class="subgrzl ml40"><span>昵称</span><span><s:property  value="#session.user.uName"/></span><span><a onClick="modify(this,'昵称','1')"/>编辑</a></span></div>
			<div class="subgrzl ml40"><span>姓名</span><span><s:property  value="#session.user.realName"/></span><span><a onClick="modify(this,'姓名','2')"/>编辑</a></span></div>
			<div class="subgrzl ml40"><span>手机号</span><span><s:property  value="#session.user.Tel"/></span><span><a onClick="modify(this,'手机号','3')"/>编辑</a></span></div>
			<div class="subgrzl ml40"><span>密码</span><span>************</span><span><a onClick="modify(this,'密码','4')"/>编辑</a></span></div>
			<div class="subgrzl ml40"><span>邮箱</span><span><s:property  value="#session.user.email"/></span><span><a onClick="modify(this,'邮箱','5')"/>编辑</a></span></div>
			<div class="subgrzl ml40"><span>余额</span><span>￥<s:property  value="#session.user.Balance"/></span><span><a onClick="recharge(this,'1')"/>充值</a></span></div>
			<div class="subgrzl ml40"><span>地址</span><span><s:property  value="#session.user.address"/></span><span><a onClick="modify(this,'地址','6')"/>编辑</a></span></div>
			
		</div>
		<div class="clear"></div>
		</div>
	</div>
<!-- self_info -->
				<jsp:include page="footer.jsp"/>
		<footer class="mt20 center">			
			<div class="mt20">小米商城|MIUI|米聊|多看书城|小米路由器|视频电话|小米天猫店|小米淘宝直营店|小米网盟|小米移动|隐私政策|Select Region</div>
			<div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号</div> 
			<div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>
		</footer>
	</body>
	<script>
function recharge(obj,id){	
	layer.prompt({title: '输入充值金额', formType: 3}, function(text, index){
		  //充值逻辑
		  $.ajax({
			type: 'POST',
			url: 'rechargeAction',
			data:{
				balance:text,
			},
			dataType: 'json',
			success: function(data){
				layer.msg('充值成功',{icon:6,time:1500});
			},
			error:function(data) {
				console.log(data.msg);
			},
		});	
		  
		  //ajax结束
		  layer.close(index);
		});
}
function modify(obj,title,id){	
	if(id=="4"){
		n="1";
	}else if(id=="6"){
		n="2";
	}else{
		n="3";
	}
	 layer.prompt({title: '请输入修改'+title, formType: n}, function(text, index){
		  //充值逻辑
		  $.ajax({
			type: 'POST',
			url: 'saveUserInfoAction',
			data:{
				value:text,
				other:id,
			},
			dataType: 'json',
			success: function(data){
				layer.msg('修改成功',{icon:6,time:1500});
			},
			error:function(data) {
				console.log(data.msg);
			},
		});	
		  
		  //ajax结束
		  layer.close(index);
		}); 
}
</script>
</html>