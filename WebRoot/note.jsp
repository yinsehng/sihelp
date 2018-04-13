<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'note.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
     <center><strong style="font-size: 18px; color: #ff0000">系统公告</strong>
     <div style="margin-top: 5px;line-height: 25px;">本系统为定点自助问题处理平台，用户名和密码均为定点编号，登录后请查看是否为自己单位，如不是请立即退出禁止进行任何操作，确认定点编号输入是否正确，定点编号在如图所示中红色区域中服务机构编号
     <img style=" " src="<%=basePath %>images/akb020.jpg">
     </div>
     </center>
  </body>
</html>
