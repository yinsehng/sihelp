<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'redxml.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="<%=basePath %>plugin/jquery/jquery-1.6.2.js"></script>
	<script type="text/javascript" src="<%=basePath %>plugin/prompt/ymPrompt.js"></script>
	<script type="text/javascript" src="<%=basePath %>plugin/jquery/jquery.form.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=basePath %>plugin/prompt/skin/dmm-green/ymPrompt.css"/>
	
	<script type="text/javascript">
	$(function(){
		$.ajax({
		url:"<%=basePath %>t.xml",
		dataType:"xml",
		type:"post",
		success:function(t){
			//alert(t);
			//$(t).find("header").each(function(){ 
			//	alert($(this).children("appCode").text());
		   // });
		   //$(t).find("parameters").each(function(){ 
		   // 	$(this).children("parameter").each(function(){
		   // 		 if($(this).attr("paraValue")=='outputData'){
		   // 		 	alert($(this).attr("paraValue"));
		   // 		 }
		   // 	});
				//alert($(this).children("parameter").attr("paraValue"));
		 //   });

			//alert(t);
			
			$(t).find("body").find("parameters").find("parameter").each(function(i){
				alert($(this).attr("paraName"));
				//alert(i);
			});
		}
	 });
	});
	
	</script>
	
  </head>
  
  <body>
     
  </body>
</html>
