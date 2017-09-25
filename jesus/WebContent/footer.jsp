<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/self.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/num-alignment.js"></script>

<script>
	$(function(){
	    $("#show-login-modal").click(function(){
	      $("#login-modal").modal("toggle");
	    });
	    $("#show-admin-modal").click(function(){
		      $("#admin-modal").modal("toggle");
		    });
	    $("#show-save-admin-modal").click(function(){
		      $("#save-admin-modal").modal("toggle");
		    });
	    $("#show-add-book-modal").click(function(){
	      $("#add-book-modal").modal("toggle");
	    });
	    $("#show-save-book-modal").click(function(){
		      $("#save-book-modal").modal("toggle");
		    });
	    $("#show-pay-book-modal").click(function(){
		      $("#pay-book-modal").modal("toggle");
		    });
	    $("#show-count-book-modal").click(function(){
		      $("#count-book-modal").modal("toggle");
		    });
	    $("#show-countAll-book-modal").click(function(){
		      $("#countAll-book-modal").modal("toggle");
		    });
	    $("#show-data-client-modal").click(function(){
		      $("#data-client-modal").modal("toggle");
		    });
	});
</script>
	<script type="text/javascript">
 	var flag233=true;
	var form111;
	function getform()
	{
		var form1 = document.forms['form1'];
		return form1;
		}
	function form123(fm)
	{
		var form1=getform();
		if(fm==1)
		form1.action = '${pageContext.request.contextPath}/CalOrderPrice';
		else
	form1.action = '${pageContext.request.contextPath}/AddOrderServlet';
		//执行SUBMIT
		form1.submit();
	} 

	</script>