<%@ taglib uri='/struts-tags' prefix='s' %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<head>
	<title>首页</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- 引入 Bootstrap -->
    <link href="/jesus/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="/jesus/resources/css/carousel.css" rel="stylesheet">
    <link href="/jesus/resources/css/site.min.css" rel="stylesheet">
</head>
   <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="${pageContext.request.contextPath}">Jesus网上订餐</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li><a href="${pageContext.request.contextPath}">主页</a></li>
            <li><a href="${pageContext.request.contextPath}/cartShowAction">
            	购物车<s:if test="%{#session.user!=null}"><span class="badge"><s:property value="#session.cartNum"/></span></s:if></a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
          <s:if test="#session.user==null">	
            <li><a href="${pageContext.request.contextPath}/login.jsp">登录</a></li>
            <li><a href="${pageContext.request.contextPath}/register.jsp">注册</a></li>
            </s:if>
            <s:else>
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">欢迎您：<span style="color:#FF5722"><s:property value="#session.user.uName"/></span><span class="caret"></span></a>
               		<ul class="dropdown-menu">
                 		<li><a href="#">个人中心</a></li>           
              			 <li class="divider"></li>
               			   <li><a href="#">我的订单</a></li>
               				  <li class="divider"></li>
                				  <li><a href="${pageContext.request.contextPath}/feedback.jsp">意见反馈</a></li>
                 					 <li class="divider"></li>
                						 <li><a href="${pageContext.request.contextPath}/logOutUser">退出</a></li>
				</ul>
                </li>  
           </s:else>          
          </ul>
                    
        </div>
      </div>
    </nav>
    
    