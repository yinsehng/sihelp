<%@ page language="java" import="java.util.*,com.neusoft.util.*,com.neusoft.bean.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
pageContext.setAttribute("basePath",basePath);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
.STYLE1 {
	font-size: 12px;
	color: #000000;
}
.STYLE5 {font-size: 12}
.STYLE7 {font-size: 12px; color: #FFFFFF; }
#menu a{text-decoration: none; color: white;}
._clock{ width: 210px;}
-->
</style>
<script type="text/javascript" src="<%=basePath %>plugin/jquery/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="<%=basePath %>plugin/simplepop/simplepop.css"/>
<link rel="stylesheet" href="<%=basePath %>plugin/simplepop/main.css"/>
<script src="<%=basePath %>plugin/simplepop/simplepop.js"></script>
<script type="text/javascript">
	
	function timer() {
		var date = new Date();
		var y= date.getFullYear();
		var yue=date.getMonth();
		var ri=date.getDate();
		var h = date.getHours();
		var m = date.getMinutes();
		var s = date.getSeconds();
		var time = (h < 10 ? "0" + h : h) + ":" + (m < 10 ? "0" + m : m) + ":" + (s < 10 ? "0" + s : s);
		$("#clock").empty().append("当前时间："+y+"年"+(yue+1)+"月"+ri+"日"+time);
		window.setTimeout(timer, 1000);
	}
	function block(){
	  //ymPrompt.alert({message:'http://www.qq.com',title:'确认要提交吗?',handler:function(){alert('good')}});
	  //ymPrompt.win({title:'操作处理单',width:408,height:240,fixPosition:true,maxBtn:true,minBtn:true,iframe:{id:'myId',name:'myName',src:'<%=basePath%>admin/upduser.jsp'}});
	   var i=window.showModalDialog('<%=basePath%>upduser.jsp','修改密码','dialogWidth:350px;dialogHeight:200px;center:yes;help:no;resizable:no;status:no');
	}
	function unopen(){
		SimplePop.confirm("该功能暂时尚未开通!",
				  {
			  		type: "confirm",
			  		title: "提示",
			  		opacity: 0.2
				  });
	}
</script>
<!--[if IE 6]>  
	<script type="text/javascript">
	function block(){
	   var i=window.showModalDialog('admin/upduser.jsp','修改密码','dialogWidth:408px;dialogHeight:238px;center:yes;help:no;resizable:no;status:no');
	}
	</script>
<![endif]--> 


</head>
<body onload="timer()">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="57" background="<%=basePath%>images/main_03.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="378" height="57" background="<%=basePath%>images/main_01.gif">&nbsp;</td>
        <td>&nbsp;</td>
        <td width="281" valign="bottom"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="33" height="27"><img src="<%=basePath%>images/main_05.gif" width="33" height="27" /></td>
            <td width="248" background="<%=basePath%>images/main_06.gif"><table width="225" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td height="17"><div align="right"><a href="javascript:block();"><img src="<%=basePath%>images/pass.gif" width="69" height="17" border="0"/></a></div></td>
                <td><div align="right"><a href="javascript:void(0)" onclick="unopen();" target="cent"><img src="<%=basePath%>images/user.gif" border="0" width="69" height="17" /></a></div></td>
                <td><div align="right"><a href="<%=basePath%>logout.jsp" target="_top"><img src="<%=basePath%>images/quit.gif" width="69px" height="17px" border="0"/></a></div></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="40" background="<%=basePath%>images/main_10.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="194" height="40" background="<%=basePath%>images/main_07.gif">&nbsp;</td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr id="menu">
            <td width="21"><img src="<%=basePath%>images/main_13.gif" width="19" height="14" /></td>
            <td width="35" class="STYLE7"><div align="center"><a href="<%=basePath%>right.jsp"  target="cent">首页</a></div></td>
            <td width="21" class="STYLE7"><img src="<%=basePath%>images/main_15.gif" width="19" height="14" /></td>
            <td width="35" class="STYLE7"><div align="center"><a href="#" onclick="javascript:history.go(-1)">后退</a> </div></td>
            <td width="21" class="STYLE7"><img src="<%=basePath%>images/main_17.gif" width="19" height="14" /></td>
            <td width="35" class="STYLE7"><div align="center"><a href="#" onclick=history.go(1)>前进</a></div></td>
            <td width="21" class="STYLE7"><img src="<%=basePath%>images/main_19.gif" width="19" height="14" /></td>
            <td width="35" class="STYLE7"><div align="center"><a href="#" onclick=history.go(0)>刷新</a></div></td>
            <td width="21" class="STYLE7"><img src="<%=basePath%>images/main_21.gif" width="19" height="14" /></td>
            <td width="35" class="STYLE7"><div align="center">帮助</div></td>
            <td>&nbsp;</td>
          </tr>
        </table></td>
        <td width="248" background="<%=basePath%>images/main_11.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15%"><span class="STYLE5"></span></td>
            <td width="80%"><div align="center" class="_clock"><span class="STYLE7" id="clock">当前时间：0000-00-00 00:00:00</span></div></td>
            <td width="5%">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="30" background="<%=basePath%>images/main_31.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="8" height="30"><img src="<%=basePath%>images/main_28.gif" width="8" height="30" /></td>
        <td width="147" background="<%=basePath%>images/main_29.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="24%">&nbsp;</td>
            <td width="43%" height="20" valign="bottom" class="STYLE1">管理菜单</td>
            <td width="33%">&nbsp;</td>
          </tr>
        </table></td>
        <td width="39"><img src="<%=basePath%>images/main_30.gif" width="39" height="30" style="cursor: pointer;" onclick="show()"/></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <%User u=(User)session.getAttribute("user"); %>
            <td height="20" valign="bottom"><span class="STYLE1">当前登录用户：<font color="#ff0000"><%=u.getAkb021() %></font><%if(u.getIp()==null && u.getEnddate()==null){%> 【您是第一次登录】<%}else{%><font color="#204155">【上次登录时间：<%=TimeUtil.getStrDate(u.getEnddate()) %>】【上次登录IP：<%=u.getIp()%>】</font><%}%></span></td>
            <td valign="bottom" class="STYLE1"><div align="right"></div></td>
          </tr>
        </table></td>
        <td width="17"><img src="<%=basePath%>images/main_32.gif" width="17" height="30" /></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>

