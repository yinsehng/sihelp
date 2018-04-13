<%@ page language="java" import="java.util.*,com.neusoft.util.*,com.neusoft.bean.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>定点医药机构服务协议网签系统</title>
<style type="text/css">
<!--
body {
	margin-left: 3px;
	margin-top: 0px;
	margin-right: 3px;
	margin-bottom: 0px;
}
.STYLE1 {
	color: #e1e2e3;
	font-size: 12px;
}
.STYLE6 {color: #000000; font-size: 12; }
.STYLE10 {color: #000000; font-size: 12px; margin-left: 8px;line-height: 25px;}
.STYLE19 {
	color: #344b50;
	font-size: 12px;
}
.STYLE21 {
	font-size: 12px;
	color: #3b6375;
}
.STYLE22 {
	font-size: 12px;
	color: #295568;
}
.box{float: left;width: 32.6%;margin-left: 3px;margin-right: 4px;margin-top: 5px;margin-bottom: 5px;}
.PicBar { background-color: #0F70C7; border: 1px solid #000000; height: 12px;background-image: url("<%=basePath%>images/dl.gif");}
}
-->
</style>
<script type="text/javascript" src="<%=basePath %>js/jquery-1.6.2.js"></script>
<script type="text/javascript" src="<%=basePath %>js/ymPrompt.js"></script>
<link rel="stylesheet" type="text/css" href="<%=basePath %>css/admin.css" />
<script type="text/javascript" src="<%=basePath %>plugin/jquery/jquery-1.6.2.js"></script>
<script language="javascript" >
	$(function(){
		$.ajax({
			url:"<%=basePath%>servlet/AjaxCountServlet?t="+new Date(),
			dataType:"json",
			type:"post",
			success:function(t){
				//alert(t);
				$("#kc33").empty();
				$("#kc33").append(t.kc33);
				$("#ya02").empty();
				$("#ya02").append(t.ya02);
				$("#localdb").empty();
				$("#localdb").append(t.localdb);
				
				/////
				$("#kc33c").empty();
				$("#kc33c").append(t.kc33c);
				$("#ya02c").empty();
				$("#ya02c").append(t.ya02c);
				$("#localdbc").empty();
				$("#localdbc").append(t.localdbc);
			}
		 });
	});
</script>

</head>
<% 
    EnvServlet env=new EnvServlet(); 
	env.setHashtable();
	
%>
<body>
<form method="get" action="<%=basePath%>switchs.do"></form>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="24" bgcolor="#353c44"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="6%" height="25" ><div align="center"  ><img src="<%=basePath%>images/tb.gif" width="14" height="14" /></div></td>
                <td width="94%"  ><span class="STYLE1"> 系统首页</span></td>
              </tr>
            </table></td>
            <td><div align="right" style="width: 100px;"><span class="STYLE1">
              
              
              </span></div></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td>
     <table width="99%" align="center" height="58" class="border">
  <tr >
							<td colspan="2" class="title">
								<font size="5"> 
										<b>欢迎使用哈尔滨网签系统<br>
										 
								</font>
							</td>
						</tr>
   
</table>
<br>
<div id="tabs">
<table width="99%" align="center" class="border">
  <tr>
    <td colspan="6" class="title" style="text-align: left;" > &nbsp;<b>系统说明</b></td>
  </tr>
  <tr class="tdbg">
    <td colspan="6" height="80" align="center" style="padding: 10px; line-height: 21px; font-size: 13px; color: #ff6600;font-weight: bold;">
    	<span style="font-weight: bold;font-size: 16px;text-align: center;color: red;">系统说明</span><p/>
    	本系统用于医保中心与定点服务机构签订服务协议，请您在登录系统后仔细阅读网签协议，并填写相关内容。登录后请查看上方红色登录名是否为自己定点名称，<br/>
    	如非自己定点请不要做任何操作，点击右上方退出系统按钮退出，确认输入的服务机构编号是否正确后重新登录。<br/>
    </td>
    
  </tr>
</table>
</div>
<br/>
<%User u=(User)session.getAttribute("user"); %>
<table width="99%" align="center" class="border">
  <tr>
    <td colspan="2" class="title" style="text-align: left;">&nbsp;<b>用户信息</b></td>
  </tr>
  <tr class="tdbg">
    <td >&nbsp;服务机构编号: <%=u.getName() %></td>
    <td>&nbsp;服务机构名称: <%=u.getAkb021() %></td>
  </tr>
  <tr class="tdbg2">
    <td >&nbsp;上次登录时间：
    <% if ("".equals(u.getEnddate()) || u.getEnddate() == null) {
    %>
    本次为首次登录
    <%
    } else {
    	%>
    	<%= TimeUtil.getStrDate(u.getEnddate()) %>
    	<%
    } %>
    
    
    </td>
    <td>&nbsp;登录总次数：<%=u.getTimes() %></td>
  </tr>
  <tr class="tdbg">
    <td >&nbsp;本次登录IP地址：<%=request.getRemoteAddr() %></td>
    <td>&nbsp;上次登录IP地址：
    
    <% if ("".equals(u.getIp()) || u.getIp() == null) {
    %>
    本次为首次登录
    <%
    } else {
    	%>
    	<%=u.getIp()%>
    	<%
    } %>
    </td>
  </tr>
  <!-- 
  <tr class="tdbg2">
    <td >&nbsp;清除点数可操作次数：<span id="kc33c"></span></td>
    <td>&nbsp;清除点数已操作次数：<span id="kc33"></span> </td>
  </tr>
  <tr class="tdbg">
    <td >&nbsp;对照问题可处理次数：<span id="ya02c"></span></td>
    <td>&nbsp;对照问题已处理次数：<span id="ya02"></span> </td>
  </tr>
  <tr class="tdbg2">
    <td >&nbsp;传输间隔可修改次数：<span id="localdbc"></span></td>
    <td>&nbsp;传输间隔已修改次数：<span id="localdb"></span> </td>
  </tr>
   -->
</table>

<!-- 
<table width="99%" align="center" class="border">
  <tr>
    <td colspan="2" class="title" style="text-align: left;">&nbsp;<b>服务器信息</b></td>
  </tr>
  <tr class="tdbg">
    <td >&nbsp;服务器的主机名，IP地址: <%=request.getServerName() %> ，<%=request.getRemoteAddr() %></td>
    <td>&nbsp;站点物理路径: <%=application.getRealPath("/") %></td>
  </tr>
  <tr class="tdbg2">
    <td >&nbsp;服务器处理请求的端口：<%=request.getServerPort() %></td>
    <td>&nbsp;服务器操作系统：<%=env.queryHashtable("os.name")%> <%=env.queryHashtable("os.version")%> <%=env.queryHashtable("sun.os.patch.level")%></td>
  </tr>
  <tr class="tdbg">
    <td >&nbsp;正在运行的服务器是<span class="small2">：<%= application.getServerInfo() %></span></td>
    <td>&nbsp;服务器操作系统类型:<%=env.queryHashtable("os.arch")%></td>
  </tr>
  <tr class="tdbg2">
    <td >&nbsp;服务器的时间：<%=new Date().toLocaleString()%></td>
    <td>&nbsp;服务器操作系统模式:<%=env.queryHashtable("sun.arch.data.model")%> </td>
  </tr>
  <tr class="tdbg">
    <td >&nbsp;本文件实际路径：<%=request.getRealPath(request.getServletPath())%></td>
    <td>&nbsp;当前用户：<%=env.queryHashtable("user.name")%>
    	
    </td>
  </tr>
</table>
-->
		  <%
		  	float maxMemory=(float)Runtime.getRuntime().maxMemory(); //最大内存
			float fFreeMemory=(float)Runtime.getRuntime().freeMemory();// 
			float fTotalMemory=(float)Runtime.getRuntime().totalMemory();//已分配内存
			float fPercent=(fTotalMemory-fFreeMemory)/fTotalMemory*100;
			float fm=fTotalMemory/maxMemory*100;
			float ffm=(float) (fFreeMemory/1024/1024);
			float ftm=(float) (fTotalMemory/1024/1024);
			float mm=(float)(maxMemory/1024/1024);
			float width2=(float) (0.85*fm);//分配百分比
			float width=(float) (width2/100*fPercent);//剩余百分比
		  %>
<!-- 
<table width="99%" align="center" class="border">
  <tr>
    <td  colspan="4" class="title" style="text-align: left;">&nbsp;<b>JAVA虚拟机相关参数</b></td>
  </tr>
  <tr class="tdbg">
    <td width="21%"  align="right" class="hback">JAVA运行环境名称：</td>
    <td width="29%" class="hback">&nbsp;<%=env.queryHashtable("java.runtime.version")%></td>
    <td width="27%" align="right" class="hback">JAVA运行环境说明书名称：</td>
    <td width="23%" class="hback"><%=env.queryHashtable("java.specification.version")%></td>
  </tr>
  <tr class="tdbg2">
    <td  align="right" class="hback">JAVA虚拟机名称：</td>
    <td class="hback">&nbsp;<%=env.queryHashtable("java.vm.version")%></td>
    <td align="right" class="hback">JAVA虚拟机说明书名称：</td>
    <td class="hback"><%=env.queryHashtable("java.vm.specification.version")%></td>

  </tr>
  <tr class="tdbg">
    <td  align="right" class="hback">JAVA虚拟机使用内存：</td>
    <td colspan="3" class="hback"><img align="absmiddle" class="PicBar" width='<%=width%>%' id="iffm" src="<%=basePath%>images/dh.gif">&nbsp;<span id="ffm"><%=ftm-(fFreeMemory/1024/1024)%>M</span></td>
  </tr>
  <tr class="tdbg2">
    <td  align="right" class="hback">JAVA虚拟机分配内存：</td>
    <td colspan="3" class="hback"><img  align="absmiddle" class="PicBar" width='<%=width2%>%' src="<%=basePath%>images/dh3.gif" id="iftm">&nbsp;<span id="ftm"><%=ftm%>M</span> </td>
  </tr>
  <tr class="tdbg">
    <td  align="right" class="hback">JAVA虚拟机最大内存：</td>
    <td colspan="3" class="hback"><img width="85%" align="absmiddle" class="PicBar"  src="<%=basePath%>images/dh2.gif">&nbsp;<span id="mm"><%=maxMemory/1024/1024%>M</span> </td>
  </tr>
</table>
 -->
<br/>
<div id="tabs">
<table width="99%" align="center" class="border">
  <tr>
    <td colspan="6" class="title" style="text-align: left;" > &nbsp;<b>网签说明</b></td>
  </tr>
  <tr class="tdbg">
    <td colspan="6" height="80" align="center" style="padding: 10px;   font-size: 13px; color: #ff6600;font-weight: bold;">
    	<span style="font-weight: bold;font-size: 16px;text-align: center;color: blue;">网签使用说明</span><p/>
    	<div style="text-align: left;">
    		点击"<a href="<%=basePath%>course/SelCourseForSdu.do" target="cent">网签协议</a>"菜单,进入网签协议页面，如不会操作的可以点击<a href="<%=basePath%>online/readme.jsp">操作说明</a>进行查看
    	</div>
    </td>
    
  </tr>
</table>
</div>
<br/>


<table align="center">
	<tr>
		<td class="tdbg"><a href="#" target="_blank"></a> 东软集团  技术支持</td>
	</tr>
</table>
    </td>
    
  </tr>
   
</table>
</body>
</html>

