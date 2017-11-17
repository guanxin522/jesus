// JavaScript Document
//支持Enter键登录
		document.onkeydown = function(e){
			if($(".bac").length==0)
			{
				if(!e) e = window.event;
				if((e.keyCode || e.which) == 13){
					var obtnLogin=document.getElementById("submit_btn")
					obtnLogin.focus();
				}
			}
		}
function checkUnameLogin()
{	var form = $('#login_form');
	$(document).ready(function() {
	    // Generate a simple captcha
	    function randomNumber(min, max) {
	        return Math.floor(Math.random() * (max - min + 1) + min);
	    };
	    $('#captchaOperation').html([randomNumber(1, 100), '+', randomNumber(1, 200), '='].join(' '));

	    form.bootstrapValidator({
//	        live: 'disabled',
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
	                        url: '${pageContext.request.contextPath}/checkUnameAction?validateUname=1',//验证地址
	                        message: '用户名不存在',//提示消息
	                        delay :  750,//每输入一个字符，就发ajax请求，服务器压力还是太大，设置2秒发送一次ajax（默认输入一个字符，提交一次，服务器压力太大）
	                        type: 'post'//请求方式
	                    },
	                }
	            },
	            uPwd: {
	                validators: {
	                    notEmpty: {
	                        message: '密码不能为空'
	                    },
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
	            },
	        }
	    });
    
	});
	$("#submit_btn").click(function () {
	    //进行表单验证
	    var bv = form.data('bootstrapValidator');
	    bv.validate();
	    if (bv.isValid()) {
	        console.log(form.serialize());
	        //发送ajax请求
	        $.ajax({
	            url: 'loginUserAction',
	            async: true,//同步，会阻塞操作
	            type: 'POST',//PUT DELETE POST
	            data: form.serialize(),
	            success: function (result) {
	                if (result=="loginSuccess") {
	                	setTimeout(function(){location.href="/jesus";},1200);
	                    layer.msg('登陆成功！正在为你跳转！',{icon:6,time:2000});
	                    return false;
	                } else {
		                	layer.msg('密码错误，请重新输入!',{icon:5,time:2000});
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
