<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>定点医药机构服务协议网签系统</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	overflow:hidden;
}
-->
</style>
</head>

<body style="height: 100%;">
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="8" bgcolor="#353c44">&nbsp;</td>
    <td width="147" valign="top"><iframe height="100%" width="100%" border="0" frameborder="0" src="<%=basePath %>left.jsp"></iframe></td>
    <td width="10" bgcolor="#add2da">&nbsp;</td>
    <td valign="top" height="100%"><iframe height="100%" width="100%" border="0" frameborder="0" src="<%=basePath %>right.jsp" name="cent"></iframe></td>
    <td width="8" bgcolor="#353c44">&nbsp;</td>
  </tr>
</table>
</body>
</html>