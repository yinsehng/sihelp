<%@ page language="java" import="java.util.*,com.vonecake.bean.*,com.vonecake.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript" src="<%=basePath %>plugin/jquery/jquery-1.6.2.js"></script>
<script type="text/javascript" src="<%=basePath %>plugin/prompt/ymPrompt.js"></script>
<script type="text/javascript" src="<%=basePath %>plugin/jquery/jquery.form.js"></script>
<link rel="stylesheet" type="text/css" href="<%=basePath %>plugin/prompt/skin/black/ymPrompt.css"/>
<link rel="stylesheet" href="<%=basePath%>plugin/cal/css/jscal2.css" type="text/css"></link>
<link rel="stylesheet" href="<%=basePath%>plugin/cal/css/border-radius.css" type="text/css"></link>
<link rel="stylesheet" href="<%=basePath%>plugin/cal/css/gold/gold.css" type="text/css"></link>
<script type="text/javascript" src="<%=basePath%>plugin/cal/jscal2.js"></script>
<script type="text/javascript" src="<%=basePath%>plugin/cal/lang/cn.js"></script>
