<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
      	<s:iterator var="foodItem" value="#request.foodList" status='st'>
        <s:if test="%{#foodItem.status>=2}">
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
        </s:if>
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
   
  <div class="container marketing">

      <!-- Three columns of text below the carousel -->
      <div class="row">
        <s:iterator var="foodItem" value="#request.foodList">
        <s:if test="%{#foodItem.status>=1}">
        <div class="col-lg-4">
        <a style="text-decoration:none;color:#5a5a5a;" href="${pageContext.request.contextPath}/foodDetailAction?fId=${foodItem.fId}">
          <img class="img-circle" src="${pageContext.request.contextPath}/${foodItem.fImage}" alt="Generic placeholder image" width="180" height="180">        
          <h2>${foodItem.fName}</h2>
          <p>${foodItem.fDescri}</p>
       	  <p class="btn btn-warning">￥${foodItem.fPrice}</p>
      </a>
        </div><!-- /.col-lg-4 -->    
        </s:if>  
        </s:iterator>
      </div><!-- /.row -->

</div>

<jsp:include page="footer.jsp"/>
</body>
</html>