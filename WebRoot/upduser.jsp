<%@ page language="java" import="java.util.*,com.neusoft.bean.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改密码</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	body,div{border:0px; padding:0px;}
	.bt{height: 20px; border: 1px solid #33576E;background-color: #ADD2DA;}
	table{font-size: 14px;}
	
	</style>
	<!--[if IE]><style type="text/css"> table{font-size: 14px; margin-top: -18px;}</style><![endif]-->
	<script type="text/javascript" src="<%=basePath %>plugin/jquery/jquery-1.6.2.js"></script>
	<script type="text/javascript" src="<%=basePath %>plugin/prompt/ymPrompt.js"></script>
	<script type="text/javascript" src="<%=basePath %>plugin/jquery/jquery.form.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=basePath %>plugin/prompt/skin/dmm-green/ymPrompt.css"/>
<script type="text/javascript">
    window.name="upd";
	function Alert(){
	   if($("#opassword").val()==""){
	   		ymPrompt.errorInfo({title:'错误提示：',message:'原密码不能为空!'});
	   		//alert("原密码不能为空");
	   		return false;
	   }else if($("#npassword").val()==""){
	   		ymPrompt.errorInfo({title:'错误提示：',message:'新密码不能为空!'});
	   		//alert("新密码不能为空");
	   		return false;
	   }else if($("#dnpassword").val()==""){
	   		//alert("重复密码不能为空");
	   		ymPrompt.errorInfo({title:'错误提示：',message:'重复密码不能为空!'});
	   		return false;
	   }else if($("#npassword").val()!=$("#dnpassword").val()){
	   		//alert("两次输入密码不一致");
	   	    ymPrompt.errorInfo({title:'错误提示：',message:'两次输入的密码不一致!'});
	   		return false;
	   }else{
	   		return true;
	   }
	}
	
	function closes(){
		window.close();
	}
</script>
	
  </head>
  <body bgcolor="#ADD2DA">
  <%Message mes=(Message)request.getAttribute("mes"); %>
  <%if(mes!=null){%>
  		<script type="text/javascript">
	  		$(function(){
	  			ymPrompt.alert({title:'信息提示：',message:'<%=mes.getMessage() %>'});
			});
	  	</script>  
  <%} %>
  	
    <div style="width:350px; height:150px; margin:0px auto;background-color: #ADD2DA;overflow: hidden;margin-top: 25px;">
  	<div style="font-size:18px;font-family:'华文中宋'; padding-top:5px;padding-left:5px;color:#000; background-color:#EDEDED;height: 25px; line-height: 25px;"><img src="<%=basePath%>images/tb.gif"><strong>密码修改</strong></div> 
    <div>
    	<form action="<%=basePath%>servlet/UpdPassWordServlet" target="upd" method="post">
            <table bordercolor="#ADD2DA" border="1" bgcolor="#ffffff" align="center">
              <tr><td>原 密 码：</td>	<td><input type="password" name="opassword" id="opassword"/></td><td style="font-size: 12px;"><font color="red">*</font>输入原密码</td></tr>
              <tr><td>新 密 码：</td><td><input type="password" name="npassword" id="npassword"/></td><td style="font-size: 12px;"><font color="red">*</font>输入新密码</td></tr>
              <tr><td>重复新密码：</td><td><input type="password" name="dnpassword" id="dnpassword"/></td><td style="font-size: 12px;"><font color="red">*</font>重复输入新密码</td></tr>
              <tr>
              	<td align="right" colspan="3">
                 <input type="submit" value="修改" onclick="return Alert()" class="bt"/>
          		 <input type="reset" value="重填" class="bt"/>
          		 <input type="button" value="关闭窗口" onclick="javascript:window.close()" class="bt"/>
          		 </td>
              </tr>
           </table>
       </form>
    </div>
   </div>
  </body>
</html>
