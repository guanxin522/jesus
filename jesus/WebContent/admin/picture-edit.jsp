<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+ "/admin/" ;
%>
<!DOCTYPE html>
<html>
<%@ include file="header.html"%>
<body>
<div class="page-container">
	<form class="form form-horizontal" id="form-article-edit" action="${pageContext.request.contextPath}/saveFoodAction" method="post" enctype="multipart/form-data">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>食品名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${request.detail.fName}" placeholder="" id="" name="fName">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>食品描述：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${request.detail.fDescri}" placeholder="" id="" name="fDescri">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>食品价格：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${request.detail.fPrice}" placeholder="" id="" name="fPrice">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">当前图片：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<img src="../${request.detail.fImage }" width="300" height="150">
			</div>
		</div>		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">上传图片</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="file" class="" value="" placeholder="留空即不更换图片" id="upload" name="upload">
			</div>
		</div>	
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button class="btn btn-primary radius" type="submit"><i class="Hui-iconfont">&#xe632;</i>修改</button>
			</div>
		</div>					
	</form>
</div>

<%@ include file="_footer.html"%>
<script type="text/javascript">
$(function(){
    //让当前表单调用validate方法，实现表单验证功能
    $("#form-article-edit").validate({
        rules:{     //配置验证规则，key就是被验证的dom对象，value就是调用验证的方法(也是json格式)
        	fName:{
        		required:true,
        		rangelength:[2,10],
        	},
        	fDescri:{
        		required:true,
        		rangelength:[6,25],
        	},
        	fPrice:{
        		required:true,
        		number:true,
        	},
            upload:{
                extension:'|jpe?g|png',
            },
        },
    
    messages:{
    	fName:{
    		required:"请输入食品名称",
            rangelength:$.validator.format("食品名称长度在必须为：{0}-{1}之间")
        },
        fDescri:{
            required:"请输入食品描述",
            rangelength:$.validator.format("食品描述字段长度必须为：{0}-{1}之间")
        },
        fPrice:{
            required:"请输入价格",
            number:"只可以输入数字",
        },
        upload:{
            required:"请上传图片",
            extension:"只支持jpg,jpeg,和png格式图片"
        },
    },
		submitHandler:function(form){
			$(form).ajaxSubmit();
			layer.msg('修改成功!',{icon:6,time:1000});
	        var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
	        setTimeout(function () {
	        	window.parent.location.reload();
	            parent.layer.close(index);  // 关闭layer
	        },1500);
		}
    });
});
</script>
</body>
</html>