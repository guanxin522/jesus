<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>Jesus用户登录</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<!-- CSS -->
<link rel="stylesheet" href="resources/css/supersized.css">
<link rel="stylesheet" href="resources/css/login.css">
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
	<script src="resources/js/html5.js"></script>
<![endif]-->
<script type="text/javascript" src="resources/js/ThreeCanvas.js"></script>
 <script type="text/javascript" src="resources/js/jquery.min.js"></script>
<script src="resources/js/Snow.js"></script>
<script type="text/javascript" src="resources/js/snowFall.js"></script>


<script type="text/javascript" src="resources/js/tooltips.js"></script>
<script type="text/javascript" src="resources/js/login.js"></script>
</head>
<body>
<!-- 引入头部 -->
<jsp:include page="header.jsp"/>
<div class="container">
	<div class="main_box">
		<div class="login_box">
			<div class="login_logo">
				<h2>Jesus美味餐厅</h2>
			</div>
		
			<div class="login_form">
				<form action="" id="login_form" method="post" class="form-horizontal" >
                      <div class="form-group">
                            <label class="col-lg-3 control-label">用户名</label>
                            <div class="col-lg-6">
                                <input type="text" class="form-control" name="uName" />
                            </div>
                        </div> 
                        <div class="form-group">
                            <label class="col-lg-3 control-label">密   码</label>
                            <div class="col-lg-6">
                                <input type="password" class="form-control" name="uPwd" />
                            </div>
                        </div>
					<div class="form-group">
						<label class="col-lg-3 control-label" id="captchaOperation"></label>
						<div class="col-lg-6">
						 <input  name="captcha" type="text" class="form-control x80 in">
						</div>
					</div>
					<div class="form-group 	">
						<label class="t"></label>　　　
						<button type="submit"  id="submit_btn"
						class="btn btn-primary btn-lg">&nbsp;登&nbsp;录&nbsp; </button>
						<input type="reset" value="&nbsp;重&nbsp;置&nbsp;" class="btn btn-default btn-lg">
					</div>			
				</form>
			</div>
		</div>
	</div>
</div>
<!-- Javascript -->
	<script type="text/javascript" src="resources/admin/lib/layer/2.4/layer.js"></script>
<script src="resources/js/supersized.3.2.7.min.js"></script>
<script src="resources/js/supersized-init.js"></script>
<script src="resources/js/scripts.js"></script>
<script src="resources/js/jquery.form.js"></script>
<script type="text/javascript" src="resources/dist/js/bootstrapValidator.js"></script>
<script>
checkUnameLogin();
</script>
<script>
$.snowFall({
	//创建粒子数量，密度
	particleNo: 500,
	//粒子下拉速度
	particleSpeed:30,
	//粒子在垂直（Y轴）方向运动范围
	particleY_Range:1300,
	//粒子在垂直（X轴）方向运动范围
	particleX_Range:1000,
	//是否绑定鼠标事件
    bindMouse: false,
    //相机离Z轴原点距离
    zIndex:600,
  //摄像机视野角度
    angle:55,
    wind_weight:0
	});
</script>
</body>
</html>