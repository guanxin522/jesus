<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags" 
%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>商品详情</title>
    <link href="./resources/css/orange.css"rel="stylesheet">
    <link href="./resources/css/share.css"rel="stylesheet">

 
    
</head>
<body>
<!--顶部导航--><jsp:include page="header.jsp"/>
<%-- <div class="headr">
    <div class="heard-con">
        <img src="images/logo.jpg" style="margin-top: 7px;float: left;position: absolute">
        <div class="headr-nav">
            <ul>
                <li><a href="#"><span>首页</span></a> </li>
                <li><a href="#">蔬果热卖</a> </li>
                <li><a href="#">全部产品</a> </li>
                <li><a href="#">最新资讯</a></li>
                <li><a href="#">联系我们</a> </li>
            </ul>
            <div class="sptopfoot">
                <div class="spbottom"  >
                </div>
            </div>
        </div>
        <div class="headr-right">
            <i class="iconfont" style="font-size: 16px;margin-right: 10px">&#xe7d5;</i>
            我的购物车 ∨
            <div class="hr-car">
                <i class="iconfont"style="font-size: 40px;margin-right: 10px">&#xe633;</i>
                您的购物车内暂时没有任何产品。
            </div>
        </div>
    </div>
</div>
<!--顶部导航结束--> --%>

<!--banner图片-->

<!--banner图片结束-->
<!--主页内容-->
<div class="content" style="padding-top: 60px;">
    <div class="cont-top">
        <div class="cont-left">
<%--             <div class="ctl-img">
               
            </div> --%>
             <img src="${pageContext.request.contextPath}${detail.fImage}" width=500 height=450>
        </div>
        <form action="addCartAction" method="get">
        <div class="cont-right">
            <div class="J_productTitle title g_minor">
                <span><s:property  value="#request.detail.fName"/></span>
                <span id="productQrCode" class="webSiteQrCode">&nbsp;
                <div class="code">
                    <img src="images/qrCode%20(1).gif">
                    <p>扫描二微码</p>
                </div>
                </span>
            </div>
           <div class="pict">
            <div class="f-proSatifySumWrap">
            	  价格:
               <span class="f-mallUnit">￥</span>
               <span class="pcc"><s:property  value="#request.detail.fPrice"/></span>
               </div>
           </div>
            <div class="pict">
                <div class="f-proSatifySumWrap">
                                         商品描述：
                    <s:property  value="#request.detail.fDescri"/>
                   
                </div>
            </div>
             <div class="pict">
                <div class="f-proSatifySumWrap">
                                        销量：
                    <s:property  value="#request.detail.fVolume"/>
                   
                </div>
            </div>          
            <div class="fk-pd5MallCartCount">
                <div class="f-cartbuyCountWrap">
                    <span class="f-propName g_minor" style="width:75px;min-width:75px;max-width: 75px;">购买数量：</span>
             <!--       <input type="text"  value="1" class="g_itext cartBuyCount f-cartBuyCount" name="q">-->

                    <input type="hidden" name="cart.fId" value="${detail.fId}"/>
                    <input  class="g_itext cartBuyCount f-cartBuyCount" type="number" required 
                    min="1" name="cart.quantity" value="1" 
                    onKeyUp="this.value=this.value.replace(/[^\.\d]/g,'');this.value=this.value.replace('.','');" 
                    oninput="if(value.length>2)value=value.slice(0,2)"/>
                    
                </div>
<!--                 <div class="f-buyCountBtn">
                    <div  class="f-countBtn mallJian"></div>
                    <div  class="f-countBtn disableMallJian"></div>
                </div> -->
            </div>
            <div class="fk-pd5MallActBtns">
                    <div class="buttn butto"><input  class="buttn butto" type="submit" value="加入购物车" /></div>        
            </div>

        </div>
        </form>
    </div>

    

</div>
<!--主页内容结束-->

<jsp:include page="footer.jsp"/>



</body>	
</html>