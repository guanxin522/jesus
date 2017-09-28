<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<head>
    <script type="text/javascript" src="resources/js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="resources/dist/js/bootstrapValidator.js"></script>
    <script type="text/javascript" src="resources/js/self.js"></script>
</head>
<script>
validateUname();
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


