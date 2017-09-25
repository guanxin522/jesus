<%@ taglib uri='/struts-tags' prefix='s' %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<head>
	<title>首页</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- 引入 Bootstrap -->
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/carousel.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/global.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/dialog.css" rel="stylesheet">

</head>
	<div class="modal" id="login-modal">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
					<h4 class="modal-title">登录</h4>
				</div>
				
				<s:form class="form-horizontal"  action="/loginUser" method="post">
					<div class="modal-body">
						<div class="form-group">
						<s:fielderror />
							 <label for="inputUserName" class="col-sm-2 control-label">用户名</label>
							<div class="col-sm-10">
								<input  type="text" class="form-control" id="inputUserName" name="users.uname"  placeholder="请输入您的用户名"  minlength="3" required />
							</div>
						</div>
						<div class="form-group">
							 <label for="inputUserPwd" class="col-sm-2 control-label">密码</label>
							<div class="col-sm-10">															<!-- pattern="^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,15}$" -->
								<input type="password" class="form-control" id="inputUserPwd" name="users.upwd" placeholder="请输入您的密码" required minlength="6" />
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="submit" class="btn btn-primary">登录</button>
					</div>
				</s:form>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->	
 <div class="navbar navbar-fixed-top navbar-inverse " role="navigation">

      <div class="container">
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="${pageContext.request.contextPath}/index.jsp">主页</a></li>
            <li><a href="page/about.html" target="blank">实体店</a></li>
			 <li><a href="AnnouncementAction!init">购物车</a></li>
          </ul>
		   <ul class="nav navbar-nav navbar-right">
          
		<li>

			 <s:if test="(#session.admin==null) && (#session.user==null)">	
			<a href="javascript:void(0);" id="show-login-modal">登陆</a>
			<li><a href="register.jsp">注册</a></li>
			</li>
			</s:if>
			<s:else>
  				<a data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">欢迎您：<span style="color:red"><s:property value="#session.user.uname"/></span><span class="caret"></span></a>
               <ul class="dropdown-menu">
                <li><a href="ClientAction!myData?id=<%=session.getAttribute("loginid")%>">个人中心</a></li>
              <li class="divider"></li>
                 <li><a href="OrdersAction!myOrders?id=<%=session.getAttribute("loginid")%>">我的订单</a></li>
                <li class="divider"></li>
                 <li><a href="#">意见反馈</a></li>
                 <li class="divider"></li>
                <li><a href="${pageContext.request.contextPath}/logOutUser">退出</a></li>
                
              </ul> 
              </s:else>

          </ul>
        </div><!-- /.nav-collapse -->
      </div><!-- /.container -->
    </div><!-- /.navbar -->
    
    