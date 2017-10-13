<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+ "/admin/" ;
%>
<!DOCTYPE html>
<html>
<%@ include file="header.html"%>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 产品管理 <span class="c-gray en">&gt;</span> 品牌管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"> <a class="btn btn-primary radius" onclick="picture_add('添加食品','picture-add.jsp')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加食品</a></span> <span class="r">共有数据：<strong>${fn:length(foodList)}</strong> 条</span> </div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-sort">
			<thead>
				<tr class="text-c">
					<th width="100">食品名称</th>
					<th width="200">图片</th>
					<th width="40">价格</th>
					<th width="40">销量</th>
					<th>具体描述</th>
					<th width="140">最近修改时间</th>
					<th width="50">状态</th>
					<th width="80">操作</th>
				</tr>
			</thead>
			<tbody>
			<s:iterator var="foodItem" value="#request.foodList">
				<tr class="text-c">
					<td>${foodItem.fName }</td>
					<td><img src="../${foodItem.fImage}" width="300" height="150"></td>
					<td>${foodItem.fPrice}</td>
					<td>${foodItem.fVolume} </td>
					<td>${foodItem.fDescri }</td>					
					<td><fmt:formatDate type="time" value="${foodItem.time }" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
					<s:if test="%{#foodItem.status==1}">
					<td style="color:#0dd40d;font-weight:600;">发布中</td>
					</s:if>
					<s:elseif test="%{#foodItem.status>1}">
					<td style="color:#ff7b07;font-weight:600;">轮播中</td>
					</s:elseif>
					<s:else>
					<td style="color:#e92314;font-weight:600;">已下架</td>
					</s:else>				
								
					<s:if test="%{#foodItem.status==1}">
					<td class="td-manage">
					<a style="text-decoration:none" onClick="picture_stop(this,'${foodItem.fId }')" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a> 
					<a style="text-decoration:none" onClick="banner_start(this,'${foodItem.fId }')" href="javascript:;" title="上架轮播"><i class="Hui-iconfont">&#xe603;</i></a> 
					<a style="text-decoration:none" class="ml-5" onClick="picture_edit('修改食品','foodDetailAction?fId=${foodItem.fId }&&manageFood=1	')" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a> 
					<a style="text-decoration:none" class="ml-5" onClick="picture_del(this,'${foodItem.fId }')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>
					</td>
					</s:if>
					<s:elseif test="%{#foodItem.status>1}">
					<td class="td-manage">
					<a style="text-decoration:none" onClick="picture_stop(this,'${foodItem.fId }')" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a> 
					<a style="text-decoration:none" onClick="banner_stop(this,'${foodItem.fId }')" href="javascript:;" title="下架轮播"><i class="Hui-iconfont">&#xe631;</i></a> 
					<a style="text-decoration:none" class="ml-5"   onClick="picture_edit('修改食品','foodDetailAction?fId=${foodItem.fId }&&manageFood=1')"  href="javascript:;"  title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a> 
					<a style="text-decoration:none" class="ml-5" onClick="picture_del(this,'${foodItem.fId }')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>
					</td>
					</s:elseif>
					<s:else>
					<td class="td-manage">
					<a style="text-decoration:none" onClick="picture_start(this,'${foodItem.fId }')" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6dc;</i></a> 
					<a style="text-decoration:none" onClick="banner_start(this,'${foodItem.fId }')" href="javascript:;" title="上架轮播"><i class="Hui-iconfont">&#xe603;</i></a> 
					<a style="text-decoration:none" class="ml-5"  onClick="picture_edit('修改食品','foodDetailAction?fId=${foodItem.fId }&&manageFood=1')" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a> 
					<a style="text-decoration:none" class="ml-5" onClick="picture_del(this,'${foodItem.fId }')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>
					</td>
					</s:else>								
				</tr>
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
	"aoColumnDefs": [
	  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
	  {"orderable":false,"aTargets":[1,6,7]}// 制定列不参与排序
	]
});
/*图片-编辑*/
function picture_edit(title,url,id){
	layer_show(title,url,'','510');
}

/*图片-删除*/
function picture_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type: 'POST',
			url: 'delFoodAction',
            data : {//设置数据源
                fId : id,
            },
			dataType: 'json',
			success: function(data){
				$(obj).parents("tr").remove();
				layer.msg('已删除!',{icon:1,time:1000});
		        setTimeout(function () {
					location.reload();// 关闭layer
		        },800);
			},
			error:function(data) {
				console.log(data.msg);
			},
		});		
	});
}
/*图片-添加*/
function picture_add(title,url){
	layer_show(title,url,'','510');
}

/*图片-下架*/
function picture_stop(obj,id){
	layer.confirm('确认要下架吗？',function(index){
		$.ajax({
			type: 'POST',
			url: 'changeStatusAction',
            data : {//设置数据源
            	fId : id,
            	status : 0,
            },
			dataType: 'json',
			success: function(data){
				$(obj).parents("tr").remove();
				layer.msg('已下架!',{icon:1,time:1000});
		        setTimeout(function () {
					location.reload();// 关闭layer
		        },500);
			},
			error:function(data) {
				console.log(data.msg);
			},
		});	
		$(obj).remove();
	});
}

/*图片-发布*/
function picture_start(obj,id){
	layer.confirm('确认要发布吗？',function(index){
		$.ajax({
			type: 'POST',
			url: 'changeStatusAction',
            data : {//设置数据源
            	fId : id,
            	status : 1,
            },
			dataType: 'json',
			success: function(data){
				$(obj).parents("tr").remove();
				layer.msg('已发布!',{icon:6,time:1000});
		        setTimeout(function () {
					location.reload();// 关闭layer
		        },800);
			},
			error:function(data) {
				console.log(data.msg);
			},
		});	
		$(obj).remove();
	});
}

/*轮播-下架*/
function banner_stop(obj,id){
	layer.confirm('确认要下架吗？',function(index){
		$.ajax({
			type: 'POST',
			url: 'changeStatusAction',
            data : {//设置数据源
            	fId : id,
            	status : 1,
            },
			dataType: 'json',
			success: function(data){
				$(obj).parents("tr").remove();
				layer.msg('已下架!',{icon:1,time:1000});
		        setTimeout(function () {
					location.reload();// 关闭layer
		        },800);
			},
			error:function(data) {
				console.log(data.msg);
			},
		});	
		$(obj).remove();
	});
}

/*轮播-上架*/
function banner_start(obj,id){
	layer.confirm('确认要上架轮播吗？',function(index){
		$.ajax({
			type: 'POST',
			url: 'changeStatusAction',
            data : {//设置数据源
            	fId : id,
            	status : 2,
            },
			dataType: 'json',
			success: function(data){
				$(obj).parents("tr").remove();
				layer.msg('已上架到轮播!',{icon:6,time:1000});
		        setTimeout(function () {
					location.reload();// 关闭layer
		        },800);
			},
			error:function(data) {
				console.log(data.msg);
			},
		});	
		$(obj).remove();
	});
}
</script>
</body>
</html>