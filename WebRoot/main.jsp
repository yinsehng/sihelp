<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>定点医药机构服务协议网签系统</title>
<script type="text/javascript" src="<%=basePath %>plugin/prompt/ymPrompt.js"></script>
<link rel="stylesheet" type="text/css" href="<%=basePath %>plugin/prompt/skin/dmm-green/ymPrompt.css" />
<script type="text/javascript" src="<%=basePath %>plugin/jquery/jquery-1.6.2.js"></script>
 
</head>

<frameset rows="127,*,11" frameborder="no" border="0" framespacing="0">
  <frame src="<%=basePath %>top.jsp" name="topFrame" scrolling="no" noresize="noresize" id="topFrame" />
  <frame src="<%=basePath %>center.jsp" name="mainFrame" id="mainFrame" />
  <frame src="<%=basePath %>down.jsp" name="bottomFrame" scrolling="no" noresize="noresize" id="bottomFrame" />
</frameset>
<noframes><body>
</body>
</noframes></html>
