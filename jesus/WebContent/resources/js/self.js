
    var telInput = document.getElementById("inputpwd");
    // 正在输入时
    telInput.oninput=function () {
    	alert("dsdas");
        this.setCustomValidity("密码由字母和数字组成，为6-15个字符");
    }
    // 验证失败时
    telInput.oninvalid=function(){
        this.setCustomValidity("请不要输入火星的内容好吗？");
    };
 