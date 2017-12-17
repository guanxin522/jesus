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

                    <form id="feedbackForm" method="post" class="form-horizontal" action="">
                        <div class="form-group">
                            <label class="col-lg-3 control-label">标题：</label>
                            <div class="col-lg-5">
                                <input type="text" class="form-control" placeholder="请输入您要反馈内容的标题" name="title" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">反馈内容：</label>
                            <div class="col-lg-5">
                                <textarea class="form-control" rows="7" placeholder="请输入您宝贵的反馈内容，最少15个字" name="content"></textarea>
                            </div>
                        </div>
                                  <div class="form-group">
                            <div class="col-lg-9 col-lg-offset-3">
                                <button type="submit" class="btn btn-primary" name="signup" value="Sign up">提交</button>
     
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
<script type="text/javascript" src="resources/admin/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript">
$(function(){
    //让当前表单调用validate方法，实现表单验证功能
    $("#feedbackForm").validate({
        rules:{     //配置验证规则，key就是被验证的dom对象，value就是调用验证的方法(也是json格式)
        	title:{
        		required:true,
        		rangelength:[2,15],
        	},
        	content:{
        		required:true,
        		rangelength:[15,100],
        	},
        },
    
    messages:{
    	title:{
    		required:"请输入标题",
            rangelength:$.validator.format("标题长度在必须为：{0}-{1}之间")
        },
        content:{
            required:"请输入反馈内容",
            rangelength:$.validator.format("反馈内容长度必须为：{0}-{1}之间")
        },
    },
		submitHandler:function(form){
			$(form).ajaxSubmit();
			layer.msg('提交成功!',{icon:6,time:1000});
	        var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
	        setTimeout(function () {
	        	window.parent.location.reload();
	            parent.layer.close(index);  // 关闭layer
	        },1500);
		}
    });
});
</script>
</html>