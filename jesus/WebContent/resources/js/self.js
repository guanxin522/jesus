﻿		document.onkeydown = function(e){
			if($(".bac").length==0)
			{
				if(!e) e = window.event;
				if((e.keyCode || e.which) == 13){
					var obtnLogin=document.getElementById("registerBtn");
					obtnLogin.focus();
				}
			}
		}	
function validateUname(){
	var form = $('#registerForm');
$(document).ready(function() {
    // Generate a simple captcha
    function randomNumber(min, max) {
        return Math.floor(Math.random() * (max - min + 1) + min);
    };
    $('#captchaOperation').html([randomNumber(1, 100), '+', randomNumber(1, 200), '='].join(' '));

    form.bootstrapValidator({
//        live: 'disabled',
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            uName: {
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
                        url: '${pageContext.request.contextPath}/checkUnameAction?validateUname=2',//验证地址
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
            uPwd: {
                validators: {
                    notEmpty: {
                        message: '密码不能为空'
                    },
                    stringLength: {
                        min: 4,
                        max: 15,
                        message: '密码须在4-15个字符之间'
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
            cuPwd: {
                validators: {
                    notEmpty: {
                        message: '确认密码不能为空'
                    },
                    identical: {
                        field: 'uPwd',
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
                    regexp: {
                    	regexp:/^([\u4e00-\u9fa5]{2,4})$/,
                        message: '请输入您的真实姓名'
                    }
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
                        regexp: /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/,
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
        $(form).bootstrapValidator('validate');
    });

    $('#resetBtn').click(function() {
        $(form).data('bootstrapValidator').resetForm(true);
    });
});


$("#registerBtn").click(function () {
    //进行表单验证	
    var bv = form.data('bootstrapValidator');
    bv.validate();
    if (bv.isValid()) {
        console.log(form.serialize());
        //发送ajax请求
        $.ajax({
            url: 'registerAction',
            async: true,//同步，会阻塞操作
            type: 'POST',//PUT DELETE POST
            data: form.serialize(),
            success: function (result) {
                if (result=="registerSuccess") {
                	setTimeout(function(){location.href="/jesus";},2000);
                    layer.msg('注册成功！正在为你登录！',{icon:6,time:2000});
                    return false;
                } else {
	                	layer.msg('注册失败!',{icon:5,time:1000});
	                	return false;
/*		            	    function randomNumber(min, max) {
	            	        return Math.floor(Math.random() * (max - min + 1) + min);
	            	    };
	                	$('#captchaOperation').html([randomNumber(1, 100), '+', randomNumber(1, 200), '='].join(' '));         	/*	                	$("#pwd").val("");
	                	$("#validate").val("");
	                	checkUnameLogin();*/
                }
            }, error: function () {
                alert("服务器繁忙请稍后再试！")
            }
        })
    }
});
}