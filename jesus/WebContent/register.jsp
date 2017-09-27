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

                    <form id="defaultForm" method="post" class="form-horizontal" action="${pageContext.request.contextPath}/registerAction">
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

<script type="text/javascript">
$(document).ready(function() {
    // Generate a simple captcha
    function randomNumber(min, max) {
        return Math.floor(Math.random() * (max - min + 1) + min);
    };
    $('#captchaOperation').html([randomNumber(1, 100), '+', randomNumber(1, 200), '='].join(' '));

    $('#defaultForm').bootstrapValidator({
//        live: 'disabled',
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            uname: {
                message: '用户名非法',
                validators: {
                    notEmpty: {
                        message: '用户名不能为空'
                    },
                    stringLength: {
                        min: 6,
                        max: 20,
                        message: '用户名必须大于6个字符小于20个字符'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_]+$/,
                        message: '用户名只能包含字母，数字和下划线'
                    },
                    threshold :  6 , //有6字符以上才发送ajax请求，（input中输入一个字符，插件会向服务器发送一次，设置限制，6字符以上才开始）
                    remote: {//ajax验证。server result:{"valid",true or false} 向服务发送当前input name值，获得一个json数据。例表示正确：{"valid",true}  
                        url: '${pageContext.request.contextPath}/findUnameAction',//验证地址
                        message: '用户已存在',//提示消息
                        delay :  750,//每输入一个字符，就发ajax请求，服务器压力还是太大，设置2秒发送一次ajax（默认输入一个字符，提交一次，服务器压力太大）
                        type: 'post'//请求方式
                    },
                    different: {
                        field: 'upwd',
                        message: '用户名和密码不能相同'
                    }
                }
            },
            upwd: {
                validators: {
                    notEmpty: {
                        message: '密码不能为空'
                    },
                    identical: {
                        field: 'cupwd',
                        message: '密码和确认密码不一致'
                    },
                    different: {
                        field: 'uname',
                        message: '密码不能和用户名相同'
                    }
                }
            },
            cupwd: {
                validators: {
                    notEmpty: {
                        message: '确认密码不能为空'
                    },
                    identical: {
                        field: 'upwd',
                        message: '密码和确认密码不一致'
                    },
                    different: {
                        field: 'uname',
                        message: '密码不能和用户名相同'
                    }
                }
            },
            email: {
                validators: {
                    notEmpty: {
                        message: '邮箱地址不能为空'
                    },
                    regexp: {
                    	regexp:/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/,
                        message: '请输入正确的邮件地址如：123@qq.com'
                    }
                }
            },
            realname: {
                validators: {
                    notEmpty: {
                        message: '真实姓名不能为空'
                    },
                    stringLength: {
                        min: 2,
                        max: 6,
                        message: '请输入您的真实姓名'
                    },
                }
            },
            address: {
                validators: {
                    notEmpty: {
                        message: '地址不能为空'
                    },
                    stringLength: {
                        min: 8,
                        max: 60,
                        message: '地址不能过短或过长'
                    },
                }
            },
            tel: {
                message: '手机号非法',
                validators: {
                    notEmpty: {
                        message: '手机号码不能为空'
                    },
                    stringLength: {
                        min: 11,
                        max: 11,
                        message: '请输入11位手机号码'
                    },
                    regexp: {
                        regexp: /^1[3|5|8]{1}[0-9]{9}$/,
                        message: '请不要输入火星的手机号码'
                    }
                }
            },

            captcha: {
                validators: {
                    callback: {
                        message: '算错啦',
                        callback: function(value, validator) {
                            var items = $('#captchaOperation').html().split(' '), sum = parseInt(items[0]) + parseInt(items[2]);
                            return value == sum;
                        }
                    }
                }
            }
        }
    });

    // Validate the form manually
    $('#validateBtn').click(function() {
        $('#defaultForm').bootstrapValidator('validate');
    });

    $('#resetBtn').click(function() {
        $('#defaultForm').data('bootstrapValidator').resetForm(true);
    });
});
</script>
</body>
</html>