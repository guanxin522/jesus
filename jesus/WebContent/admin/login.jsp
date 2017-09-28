<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    
<head>
        <title>Jesus网上订餐系统管理后台</title><meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
		<link rel="stylesheet" href="../resources/css/bootstrap-responsive.min.css" />
        <link rel="stylesheet" href="../resources/css/matrix-login.css" />
        <link href="../resources/css/font-awesome.css" rel="stylesheet" />
		<link href='http://fonts.useso.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>

    </head>
    <body>
        <div id="loginbox">            
            <form id="loginform" class="form-vertical" action="http://themedesigner.in/demo/matrix-admin/index.html">
				 <div class="control-group normal_text"> <h3>Jesus网上订餐系统管理后台</h3></div>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_lg"><i class="glyphicon glyphicon-user"></i></span><input type="text" placeholder="用户名" name="aname"/>
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_ly"><i class="glyphicon glyphicon-lock"></i></span><input type="password" placeholder="密码" name="apwd"/>
                        </div>
                    </div>
                </div>
               <div class="control-group">
                            <div class="col-lg-9 col-lg-offset-5">
   								
                                <button type="submit" class="btn btn-success"  name="signup" value="Sign up">登陆</button>
                            </div>
                        </div>
            </form>
    </body>

</html>