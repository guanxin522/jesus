<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<!-- 引入头部 -->
	<jsp:include page="header.jsp"/>
	<!-- 页面主体内容 -->
<body>
    <div class="container">
        <div class="row">
            <!-- form: -->
            <section>
                <div class="col-lg-8 col-lg-offset-2">
                    <div class="page-header">
                        <h2 style="padding-top: 45px;">意见反馈</h2>
                    </div>

                    <form id="defaultForm" method="post" class="form-horizontal" action="${pageContext.request.contextPath}/addFeedbackAction">
                        <div class="form-group">
                            <label class="col-lg-3 control-label">标题：</label>
                            <div class="col-lg-5">
                                <input type="text" class="form-control" placeholder="请输入您要反馈内容的标题" name="title" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">标题：</label>
                            <div class="col-lg-5">
                                <textarea class="form-control" rows="7" placeholder="请输入您的留言，最少15个字" name="content"></textarea>
                            </div>
                        </div>
                                  <div class="form-group">
                            <div class="col-lg-9 col-lg-offset-3">
                                <button type="submit" class="btn btn-primary" name="signup" value="Sign up">注 册</button>
     
                            </div>
                        </div>
                    </form>
                </div>
            </section>
            <!-- :form -->
        </div>
    </div>
        <jsp:include page="footer.jsp"/>
</body>
</html>