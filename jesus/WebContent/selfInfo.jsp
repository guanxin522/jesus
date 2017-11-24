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
		  <link rel="stylesheet" type="text/css" href="./resources/css/style2.css" /> 
          <link rel="stylesheet" type="text/css" href="./resources/css/base.min.css" /> 
          <link rel="stylesheet" type="text/css" href="./resources/css/main.min.css" /> 
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
     <div class="ddzx">
      订单中心
     </div> 
     <div class="subddzx"> 
      <ul> 
       <li><a href="${pageContext.request.contextPath}/showUnpaidOrdersAction">待付款订单</a></li> 
       <li><a href="${pageContext.request.contextPath}/showPaidOrdersAction">已支付订单</a></li> 
       <li><a href="${pageContext.request.contextPath}/showNotSignOrdersAction">待确认订单</a></li> 
       <li><a href="${pageContext.request.contextPath}/showSignOrdersAction">历史订单</a></li> 
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
		<div class="rtcont fr">
			<div class="ddzxbt">交易订单</div>
			<div class="subgrzl ml40"><span>用户名</span><span><s:property  value="#session.user.uName"/></span></div>
			<div class="subgrzl ml40"><span>姓名</span><span><s:property  value="#session.user.realName"/></span><span><a onClick="modify(this,'姓名','2')"/>编辑</a></span></div>
			<div class="subgrzl ml40"><span>手机号</span><span><s:property  value="#session.user.Tel"/></span><span><a onClick="modify(this,'手机号','3')"/>编辑</a></span></div>
			<div class="subgrzl ml40"><span>密码</span><span>************</span><span><a onClick="modify(this,'密码','4')"/>编辑</a></span></div>
			<div class="subgrzl ml40"><span>邮箱</span><span><s:property  value="#session.user.email"/></span><span><a onClick="modify(this,'邮箱','5')"/>编辑</a></span></div>
			<div class="subgrzl ml40"><span>余额</span><span>￥<s:property  value="#request.userBalance"/></span><span><a onClick="recharge(this,'1')"/>充值</a></span></div>
			<div class="subgrzl ml40"><span>地址</span><span><s:property  value="#session.user.address"/></span><span><a onClick="modify(this,'地址','6')"/>编辑</a></span></div>
			
		</div>
		<div class="clear"></div>
		</div>
	</div>
<!-- self_info -->
				<jsp:include page="footer.jsp"/>
	</body>
	<script>
function recharge(obj,id){	
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
function modify(obj,title,id){	
	var reg;
	var msg;
	if(id=="4"){
		n="1";
		reg = /^.{4,15}$/;
		msg = "密码需要4到15个字符";
	}else if(id=="6"){
		n="2";
		reg = /^.{6,60}$/;
		msg = "地址太长或太短我都怕找不到你(请输入6-60个字符)";
	}else if(id=='5'){
		n="3";
		reg = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
		msg = "邮箱格式格式不对";
	}
	else if(id=='3'){
		n="3";
		reg = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
		msg = "手机号码格式不对";
	}
	else if(id=='2'){
		n="3";
		reg = /^([\u4e00-\u9fa5]{2,4})$/;
		msg = "请输入正确的真实姓名";
	}
	 layer.prompt({
		 title: '请输入修改'+title,
		 formType: n,
		 yes: function(index, layero){
		 var t = layero.find(".layui-layer-input").val();
			 if (!reg.test(t)) {  
				 layer.msg(msg,{icon:5,time:1500});
				 //layer.close(index);
			    }
			 else{
				  $.ajax({
						type: 'POST',
						url: 'saveUserInfoAction',
						data:{
							value:t,
							other:id,
						},
						dataType: 'json',
						success: function(data){
							layer.msg('修改成功',{icon:6,time:1500});
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
</script>
</html>