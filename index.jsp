<%@ page language="java" import="java.util.*,com.neusoft.bean.*" pageEncoding="utf-8" contentType="text/html; charset=UTF-8"%>
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
.STYLE3 {font-size: 12px; color: #adc9d9; }
-->
</style>
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/public.css"/>
<script type="text/javascript" src="<%=basePath %>plugin/jquery/jquery-1.6.2.js"></script>
<script type="text/javascript" src="<%=basePath %>plugin/prompt/ymPrompt.js"></script>
<script type="text/javascript" src="<%=basePath %>plugin/jquery/jquery.form.js"></script>
<script type="text/javascript" src="<%=basePath %>plugin/easyui/jquery.easyui.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=basePath %>plugin/prompt/skin/dmm-green/ymPrompt.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath %>plugin/easyui/themes/default/easyui.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath %>plugin/easyui/themes/icon.css"/>
<script language="JavaScript"> 
 if (window != top) {
 	top.location.href = location.href; 
 	window.event.returnValue = false;
 }
 </script> 
<script type="text/javascript">

//无提示直接关闭窗口
	var browserName=navigator.appName; 
	if (browserName=="Netscape"){ 
		function closeme(){ 
			window.open('','_parent',''); 
			window.close(); 
		} 
	}else{
		if (browserName=="Microsoft Internet Explorer"){ 
			function closynoshowsme() { 
				window.opener = "whocares"; 
				window.close(); 
			} 
		} 
	} 


	function clear(){
		$("input").attr("value","");
	}
	function changeimg(){
		document.getElementById("imgs").src="<%=basePath%>servlet/ImgServlet?temptime="+Math.random();
	}
 
	function Alert(){
	   if($("#username").val()==""){
	   		ymPrompt.errorInfo({title:'错误提示：',message:'用户名不能为空!'});
	   		return false;
	   }else if($("#password").val()==""){
	   		ymPrompt.errorInfo({title:'错误提示：',message:'密码不能为空!'});
	   		return false;
	   }else if($("#yanzheng").val()==""){
	   		ymPrompt.errorInfo({title:'错误提示：',message:'验证码不能为空!'});
	   		return false;
	   }else if($("#yanzheng").val().length!=4){
	   	   ymPrompt.errorInfo({title:'错误提示：',message:'验证码只能是4位!'});
	   		return false;
	   } 
	   
	   
	   var width=1024;
	    var height=768 -57;
	    
	    if(screen.width <=1024){
			width = screen.availWidth;
		}
		
		if(screen.height <= 768){			
			height = screen.availHeight -57;//减去状态栏高度
		}
		
        var screenX=0;
        var screenY=0;
       
		if(screen.width > 1024){
            screenX = (screen.availWidth -width)/2;
        }
        if(screen.height>768){
            screenY = (screen.availHeight-768)/2;
	    }
				
		var sFeatures = "toolbar=0,location=0,directories=0,status=1,menubar=0";
  		sFeatures += ",scrollbars=0,resizable=1,left="+screenX+"px,top="+screenY+"px,width="+width+"px,height="+height+"px";
		 
   		//随机产生窗口的名字
   		var sName = new Date().getTime(); 
   		window.open( "", sName, sFeatures);
   		document.getElementById("l_form").target = sName;
		document.getElementById("l_form").submit();
		window.opener = new Object();
   		self.close();
	   
	}
	 
	function change(key){
		if(key=='no'){
			closeme();
		}
	}
</script>
<%String off=(String)request.getParameter("out"); %>
<%if(off==null){%>
<script language="javascript">
	//ymPrompt.win({message:'<%=basePath%>note.jsp',width:550,height:350,title:'通知公告',maxBtn:true,minBtn:true,iframe:true,handler:change,btn:[['同意','yes'],['不同意','no']]});
</script>
<%} %>
</head>
<body>
<%Message mes=(Message)request.getAttribute("mes"); %>
<%if(mes!=null){%>
   <script type="text/javascript">
   		ymPrompt.errorInfo({title:'错误提示：',message:'<%=mes.getMessage() %>'});
   </script>
<%} %>
<form action="<%=basePath%>servlet/LogonServlet" method="post" id="l_form">
<table width="100%"  height="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td bgcolor="#1075b1">&nbsp;</td>
  </tr>
  <tr>
    <td height="608" background="<%=basePath%>images/login_03.gif"><table width="847" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="318" background="<%=basePath%>images/login_04.png">&nbsp;</td>
      </tr>
      <tr>
        <td height="84"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="381" height="84" background="<%=basePath%>images/login_06.gif">&nbsp;</td>
            <td width="162" valign="middle" background="<%=basePath%>images/login_07.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="44" height="24" valign="bottom"><div align="right"><span class="STYLE3">用户</span></div></td>
                <td width="10" valign="bottom">&nbsp;</td>
                <td height="24" colspan="2" valign="bottom">
                  <div align="left">
                    <input type="text" name="username" id="username" value="" style="width:100px; height:17px; background-color:#87adbf; border:solid 1px #153966; font-size:12px; color:#283439; ">
                  </div></td>
              </tr>
              <tr>
                <td height="24" valign="bottom"><div align="right"><span class="STYLE3">密码</span></div></td>
                <td width="10" valign="bottom">&nbsp;</td>
                <td height="24" colspan="2" valign="bottom"><input type="password" name="password" value="" id="password" style="width:100px; height:17px; background-color:#87adbf; border:solid 1px #153966; font-size:12px; color:#283439; "></td>
              </tr>
              <tr>
                <td height="24" valign="bottom"><div align="right"><span class="STYLE3">验证码</span></div></td>
                <td width="10" valign="bottom">&nbsp;</td>
                <td width="52" height="24" valign="bottom"><input type="text" name="img" id="yanzheng" style="width:50px; height:17px; background-color:#87adbf; border:solid 1px #153966; font-size:12px; color:#283439; "></td>
                <td width="62" valign="bottom"><div align="left"><a href="#" onclick="return changeimg()"><img src="<%=basePath%>servlet/ImgServlet" width="50" height="20" border="0" id="imgs" alt="点击更改验证码"></a></div></td>
              </tr>
              <tr></tr>
            </table></td>
            <td width="26"><img src="<%=basePath%>images/login_08.gif" width="26" height="84"></td>
            <td width="67" background="<%=basePath%>images/login_09.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="25"><div align="center"><input type="image" src="<%=basePath%>images/dl.gif" width="57" height="20" onclick="return Alert()"/></div></td>
              </tr>
              <tr>
                <td height="25"><div align="center"><a href="javascript:clear()"><img src="<%=basePath%>images/cz.gif" width="57" height="20" border="0"></a></div></td>
              </tr>
            </table></td>
            <td width="211" background="<%=basePath%>images/login_10.gif">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="206" background="<%=basePath%>images/login_11.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#152753">&nbsp;</td>
  </tr>
</table>
</form>
</body>
</html>
