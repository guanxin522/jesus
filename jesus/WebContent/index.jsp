<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="resources/css/jq22.css" rel="stylesheet" type="text/css" />
<script src="resources/js/snow_index.js"></script>
<script>createSnow('', 100);</script>

</head>
<body>
<!-- 引入头部 -->
<jsp:include page="header.jsp"/>
     <!-- Carousel
    ================================================== -->
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
<!--       Indicators
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="2" class="active"></li>        
      </ol> -->
      <div class="carousel-inner" role="listbox">
      	<s:iterator var="foodItem" value="#request.foodCarousel" status='st'>
            <s:if test="#st.first ">
            <div class="item active">
    		</s:if>
    		<s:else>
    		<div class="item">
    		</s:else>
          <img class="first-slide" src="${pageContext.request.contextPath}/${foodItem.fImage}" alt="Second slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>${foodItem.fName}</h1>
              <p>${foodItem.fDescri}</p>
              <p><a class="btn btn-lg btn-warning" href="#" role="button">￥${foodItem.fPrice}</a></p>
            </div>
          </div>
        </div>
        </s:iterator>
              
      </div>
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div><!-- /.carousel -->
    <div class="bc-social">
    <div class="container">
      <ul class="bc-social-buttons">
        <li class="social-forum">
            <i class="fa fa-comments"></i> Jesus网上订餐
        </li>
        <li class="social-weibo">
          <a href="javascript:;" onClick="contact()">联系我们</a>
        </li>
      </ul>
    </div>
  </div>


  <div class="container marketing">
      <div class="projects-header page-header">
      <h2>欢迎光临Jesus网上订餐</h2>
      <p>本餐厅经营各种美味佳肴，欢迎选购</p>
              <form id="search" method="get" action="${pageContext.request.contextPath}/searchFoodAction">
            <input type="text" id="searchInput"  placeholder="搜索食品" name="fName">
          </form>
    </div>
      <!-- Three columns of text below the carousel -->
      <div class="row">
        <s:iterator var="foodItem" value="#request.foodSell">

        <div class="col-lg-4">
        <a style="text-decoration:none;color:#5a5a5a;" href="${pageContext.request.contextPath}/foodDetailAction?fId=${foodItem.fId}">
          <img class="img-circle" src="${pageContext.request.contextPath}/${foodItem.fImage}" alt="Generic placeholder image" width="180" height="180">        
          <h2>${foodItem.fName}</h2>
          <p>${foodItem.fDescri}</p>
       	  <p class="btn btn-warning">￥${foodItem.fPrice}</p>
      </a>
        </div><!-- /.col-lg-4 -->    
        </s:iterator>
      </div><!-- /.row -->

</div>
<jsp:include page="footer.jsp"/>
<script type="text/javascript" src="resources/js/zzsc.js"></script>
<div class="bottom_tools">
  <div class="qr_tool">二维码</div>
  <a id="feedback" href="${pageContext.request.contextPath}/feedback.jsp" title="意见反馈">意见反馈</a>
  <a id="scrollUp" href="javascript:;" title="飞回顶部"></a>
  <img class="qr_img" src="resources/images/wx.jpg">
</div>
<script>
function contact() {
	layer.open({
		  type: 1
		  ,title: false //不显示标题栏
		  ,closeBtn: false
		  ,area: '570px;'
		  ,shade: 0.8
		  ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
		  ,resize: false
		  ,btn: ['我知道了']
		  ,btnAlign: 'c'
		  ,moveType: 1 //拖拽模式，0或者1
		  ,content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">餐厅地址：广东省广州市花都区新华街道学府路1号华南理工大学广州学院<br>联系电话：13570325854<br>对本系统你有更好的意见和建议，欢迎提交到意见反馈<br>本系统为学生练习开发，无任何商业用途，图片均来自网络，如有侵权，请联系我们！</div>'
		  ,yes:function(index){
		layer.close(index);
		}
		});
}
$('#searchInput').keydown(function(e){
if(e.keyCode==13){
    var sousuo = $("#searchInput").val();
   if (sousuo == "") { alert("请输入信息"); return false; }
$('#search').submit(); //处理事件
}
});
</script>
</body>
</html>