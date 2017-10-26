<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<%@ include file="header.html"%>
<body>
<nav class="breadcrumb"> <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover table-sort table-responsive">
			<thead>
				<tr class="text-c">
					<th width="100">订单ID</th>
					<th width="80">用户</th>
					<th>食品清单</th>
					<th width="40">总价格</th>	
					<th width="80">手机</th>					
					<th width="220">送货地址</th>
					<th width="120">付款时间</th>
					<th width="50">状态</th>
					<th width="80">操作</th>
				</tr>
			</thead>
			<tbody>
			<s:iterator var="ordersItem" value="#request.ordersList">
				<s:if test="%{#ordersItem.ostatus>2}">
				<tr class="text-c">			
					<td>${ordersItem.oid }</td>
					<td><u style="cursor:pointer" class="text-primary" onclick="member_show('会员','findUsersAction?uName=${ordersItem.uname }','10001','360','400')">${ordersItem.uname }</u></td>
					<td><s:iterator var="orderSonItem" value="#request.OrderSonList">
					<s:if test="%{#ordersItem.oid==#orderSonItem.oid}">
					${orderSonItem.fname }×${orderSonItem.quantity }&nbsp;&nbsp;
					</s:if>
					</s:iterator></td>
					<td>￥${ordersItem.oprice }</td>
					<td>${ordersItem.tel }</td>
					<td>${ordersItem.address}</td>
					<td><fmt:formatDate type="time" value="${ordersItem.otime }" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
					<td class="td-status"><span class="label label-success radius">
					<s:if test="%{#ordersItem.ostatus==3}">交易完成</s:if>
					<s:elseif test="%{#ordersItem.ostatus==2}">送货中</s:elseif>
					</span></td>
					<td></td>
				</tr>
				</s:if>
				</s:iterator>
			</tbody>
		</table>
	</div>
</div>
<%@ include file="_footer.html"%>
<script type="text/javascript">
$('.table-sort').dataTable({
	"aaSorting": [[ 1, "desc" ]],//默认第几个排序
	"bStateSave": true,//状态保存
	"pading":false,
	"aoColumnDefs": [
	  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
	  {"orderable":false,"aTargets":[8]}// 不参与排序的列
	]
});

/*资讯-添加*/
function article_add(title,url,w,h){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*资讯-编辑*/
function article_edit(title,url,id,w,h){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*资讯-删除*/
function article_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type: 'POST',
			url: '',
			dataType: 'json',
			success: function(data){
				$(obj).parents("tr").remove();
				layer.msg('已删除!',{icon:1,time:1000});
			},
			error:function(data) {
				console.log(data.msg);
			},
		});		
	});
}

/*资讯-审核*/
function article_shenhe(obj,id){
	layer.confirm('审核文章？', {
		btn: ['通过','不通过','取消'], 
		shade: false,
		closeBtn: 0
	},
	function(){
		$(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="article_start(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
		$(obj).remove();
		layer.msg('已发布', {icon:6,time:1000});
	},
	function(){
		$(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="article_shenqing(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-danger radius">未通过</span>');
		$(obj).remove();
    	layer.msg('未通过', {icon:5,time:1000});
	});	
}
/*资讯-下架*/
function article_stop(obj,id){
	layer.confirm('确认要下架吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="article_start(this,id)" href="javascript:;" title="发布"><i class="Hui-iconfont">&#xe603;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已下架</span>');
		$(obj).remove();
		layer.msg('已下架!',{icon: 5,time:1000});
	});
}

/*改变订单状态*/
function changeStatus(obj,id,content,status){
	layer.confirm(content,function(index){
		$.ajax({
			type: 'POST',
			url: 'changeOrderStatusAction',
			dataType: 'json',
			data:{
				oidAjax:id,
				ostatusAjax:2,
			},
			success: function(data){
				if(data.resultTemp == 'ok'){
				$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="article_stop(this,id)" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a>');
				$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
				$(obj).remove();
				layer.msg('已发货!',{icon: 6,time:1000});
				}
				else{
					layer.msg('发货失败',{icon: 7,time:1000});
				}
			},
			error:function(data) {
				console.log(data.msg);
			},
		});
	});
}
/*资讯-申请上线*/
function article_shenqing(obj,id){
	$(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">待审核</span>');
	$(obj).parents("tr").find(".td-manage").html("");
	layer.msg('已提交申请，耐心等待审核!', {icon: 1,time:2000});
}

/*用户-查看*/
function member_show(title,url,id,w,h){
	layer_show(title,url,w,h);
}
</script> 
</body>
</html>