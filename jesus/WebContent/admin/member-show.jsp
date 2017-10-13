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
<div class="cl pd-20" style=" background-color:#5bacb6">
	<img class="avatar size-XL l" src="../resources/admin/static/h-ui/images/ucnter/avatar-default.jpg">
	<dl style="margin-left:80px; color:#fff">
		<dt>
			<span class="f-18">${request.user.uname }</span>
		</dt>
		<!-- <dd class="pt-10 f-12" style="margin-left:0">这家伙很懒，什么也没有留下</dd> -->
	</dl>
</div>
<div class="pd-20">
	<table class="table">
		<tbody>
			<tr>
				<th class="text-r">真实姓名</th>
				<td>${request.user.realname }</td>
			</tr>		
			<tr>
				<th class="text-r">手机：</th>
				<td>${request.user.tel }</td>
			</tr>
			<tr>
				<th class="text-r">邮箱：</th>
				<td>${request.user.email }</td>
			</tr>
			<tr>
				<th class="text-r">地址：</th>
				<td>${request.user.address }</td>
			</tr>
			<tr>
				<th class="text-r">注册时间：</th>
				<td><fmt:formatDate type="time" value="${request.user.time }" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
			</tr>
		</tbody>
	</table>
</div>
<%@ include file="_footer.html"%>
</body>
</html>