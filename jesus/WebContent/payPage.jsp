<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags" 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>
余额：<s:property  value="#request.balance"/>
需支付：<s:property  value="#session.cartPrice"/>
<s:property  value="#request.oId"/>
<s:property  value="#request.payMessage"/>
<a href="${pageContext.request.contextPath}/payOrdersAction?order.oId=${oId}">支付</a>
</body>
</html>