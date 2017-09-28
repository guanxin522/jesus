<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
	<!-- 引入头部 -->
	<jsp:include page="header.jsp"/>
	<!-- 页面主体内容 -->
<jsp:include page="footer.jsp"/>
<body>
    <div class="container">
        <div class="row">
            <!-- form: -->
            <section>
                <div class="col-lg-8 col-lg-offset-2">
                    <div class="page-header">
                        <h2 style="padding-top: 45px;">注册</h2>
                    </div>

                    <form id="defaultForm" method="post" class="form-horizontal" action="${pageContext.request.contextPath}/checkUnameAction">
                        <div class="form-group">
                            <label class="col-lg-3 control-label">用户名</label>
                            <div class="col-lg-5">
                                <input type="text" class="form-control" name="uname" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">密码</label>
                            <div class="col-lg-5">
                                <input type="password" class="form-control" name="upwd" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">确认密码</label>
                            <div class="col-lg-5">
                                <input type="password" class="form-control" name="cupwd" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">真实姓名</label>
                            <div class="col-lg-5">
                                <input type="text" class="form-control" name="realname" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">邮箱</label>
                            <div class="col-lg-5">
                                <input type="text" class="form-control" name="email" />
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label class="col-lg-3 control-label">手机号码</label>
                            <div class="col-lg-5">
                                <input type="text" class="form-control" name="tel" />
                            </div>
                        </div>   
                              
                        <div class="form-group">
                            <label class="col-lg-3 control-label">收货地址</label>
                            <div class="col-lg-5">
                                <input type="text" class="form-control" name="address" />
                            </div>
                        </div>                                                         
                        <div class="form-group">
                            <label class="col-lg-3 control-label" id="captchaOperation"></label>
                            <div class="col-lg-2">
                                <input type="text" class="form-control" name="captcha" />
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-lg-9 col-lg-offset-3">
   								<button type="button" class="btn btn-info" id="validateBtn">核 验</button>
                                <button type="submit" class="btn btn-primary" name="signup" value="Sign up">注 册</button>
                                <button type="button" class="btn btn-info" id="resetBtn">重 置</button>
                            </div>
                        </div>
                    </form>
                </div>
            </section>
            <!-- :form -->
        </div>
    </div>
</body>
</html>