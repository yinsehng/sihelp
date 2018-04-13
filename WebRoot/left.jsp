<%@ page language="java" import="java.util.*,com.neusoft.bean.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
User u=(User)session.getAttribute("user");
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
}
.STYLE3 {
	font-size: 12px;
	color: #435255;
}
.STYLE4 {font-size: 12px; color: #204155;}
.STYLE5 {font-size: 12px; font-weight: bold; color: #204155; }
.hd{display: none;}
.f{cursor:pointer;}
.unline a{text-decoration: none; color: #204155;  }
a:link {
 text-decoration: none;
}
a:visited {
 text-decoration: none;
}
a:hover {
 text-decoration: none;
}
a:active {
 text-decoration: none;
}
-->
</style>
<script type="text/javascript" src="<%=basePath %>plugin/jquery/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="<%=basePath %>plugin/simplepop/simplepop.css"/>
<link rel="stylesheet" href="<%=basePath %>plugin/simplepop/main.css"/>
<script src="<%=basePath %>plugin/simplepop/simplepop.js"></script>
<script type="text/javascript">
 function block(){
	   var i=window.showModalDialog('admin/upduser.jsp','修改密码','dialogWidth:400px;dialogHeight:208px;center:yes;help:no;resizable:no;status:no');
	}
function unopen(){
	SimplePop.confirm("尚未开通!",
			  {
		  		type: "confirm",
		  		title: "错误提示",
		  		opacity: 0.2
			  });
}
</script>

</head>

<body> 
	<div style="width:147px;height:100%;" >
		<% if (u.getType()!=1) {
	    %>
		<div align="center" class="STYLE5" style="width:100%;height:23px;background-image:url('<%=basePath%>images/main_34.gif');line-height:23px; height:23px;">网签协议</div>
		<div height="38px;width:100%;">
			<div style="width:20%;height: 30px;margin-left: 15px;margin-top: 2px;float: left;;background-image:url('<%=basePath%>images/main_48.gif');"></div>
			<div style="float: left;width:5px;height: 30px;"></div>
			<div class="STYLE4" style="height: 30px;padding-top: 8px;width: 95%;cursor:hand" onMouseOver="this.style.backgroundImage='url(<%=basePath%>images/tab_bg.gif)';this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><a href="<%=basePath%>servlet/SelProtocolServlet" target="cent">网签协议</a></div>
		</div>
		
		<%
        } %>
        <%if(u.getType()==1){
		  %>
        <div align="center" class="STYLE5" style="width:100%;height:23px;background-image:url('<%=basePath%>images/main_34.gif');line-height:23px; height:23px;">系统管理</div>
		<div height="38px;width:100%;">
			<div style="width:20%;height: 30px;margin-left: 15px;margin-top: 2px;float: left;background-image:url('<%=basePath%>images/main_48.gif');"></div>
			<div style="float: left;width:5px;height: 30px;"></div>
			<div class="STYLE4" style="height: 30px;padding-top: 8px;width: 95%;cursor:hand" onMouseOver="this.style.backgroundImage='url(<%=basePath%>images/tab_bg.gif)';this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><a href="<%=basePath%>servlet/JInfoMangerServlet" target="cent">甲方信息管理</a></div>
		</div>
		<div height="38px;width:100%;">
			<div style="width:20%;height: 30px;margin-left: 15px;margin-top: 2px;float: left;background-image:url('<%=basePath%>images/main_48.gif');"></div>
			<div style="float: left;width:5px;height: 30px;"></div>
			<div class="STYLE4" style="height: 30px;padding-top: 8px;width: 95%;cursor:hand" onMouseOver="this.style.backgroundImage='url(<%=basePath%>images/tab_bg.gif)';this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><a href="<%=basePath%>servlet/UserManagerServlet" target="cent">用户信息管理</a></div>
		</div>
		<div height="38px;width:100%;">
			<div style="width:20%;height: 30px;margin-left: 15px;margin-top: 2px;float: left;;background-image:url('<%=basePath%>images/main_40.gif');"></div>
			<div style="float: left;width:5px;height: 30px;"></div>
			<div class="STYLE4" style="height: 30px;padding-top: 8px;width: 95%;cursor:hand" onMouseOver="this.style.backgroundImage='url(<%=basePath%>images/tab_bg.gif)';this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><a href="<%=basePath%>servlet/ProtocolManageServlet" target="cent">网签协议管理</a></div>
		</div>
		<div height="38px;width:100%;">
			<div style="width:20%;height: 30px;margin-left: 15px;margin-top: 2px;float: left;;background-image:url('<%=basePath%>images/main_50.gif');"></div>
			<div style="float: left;width:5px;height: 30px;"></div>
			<div class="STYLE4" style="height: 30px;padding-top: 8px;width: 95%;cursor:hand" onMouseOver="this.style.backgroundImage='url(<%=basePath%>images/tab_bg.gif)';this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><a href="<%=basePath%>servlet/ProtocolCountServlet" target="cent">网签协议统计</a></div>
		</div>
		<%
        } %>
	</div>
</body>
</html>

