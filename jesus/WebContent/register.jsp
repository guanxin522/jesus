<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
	<!-- 引入头部 -->
	<jsp:include page="header.jsp"/>
	<!-- 页面主体内容 -->
	<div class="row clearfix" style="margin-top: 60px;">
		<div class="col-md-12 column">
			<div class="row clearfix">
				<div class="col-md-8 column">
					<form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/registerAction" method="post">
						<div class="form-group">
							 <label for="inputUserName" class="col-sm-2 control-label">用户名</label>
							<div class="col-sm-10">
								<s:textfield name="users.uname" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							 <label for="inputUserPwd1" class="col-sm-2 control-label">密码</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" id="inputUserPwd1" name="users.upwd"/>
							</div>
						</div>
						<div class="form-group">
							 <label for="inputUserPwd2" class="col-sm-2 control-label">确认密码</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" id="inputUserPwd2" name="cupwd"/>
							</div>
						</div>
						<div class="form-group">
							 <label for="inputClassName" class="col-sm-2 control-label">真实姓名</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="inputClassName" name="users.realname"/>
							</div>
						</div>
						<div class="form-group">
							 <label for="inputClassName" class="col-sm-2 control-label">手机号</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="inputClassName" name="users.tel"/>
							</div>
						</div>
						<div class="form-group">
							 <label for="inputClassName" class="col-sm-2 control-label">邮箱</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="inputClassName" name="users.email"/>
							</div>
						</div>						
						<div class="form-group">
							 <label for="inputClassName" class="col-sm-2 control-label">收货地址</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="inputClassName" name="users.address"/>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								 <button type="submit" class="btn btn-primary">注册</button>
							</div>
						</div>
					</form>

				</div>

			</div>
		</div>
	</div>
</html>
	<jsp:include page="footer.jsp"/>