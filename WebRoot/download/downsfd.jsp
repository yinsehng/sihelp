<%@ page language="java" import="java.util.*,com.neusoft.bean.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<style type="text/css">
<!--
body {
	margin-left: 3px;
	margin-top: 0px;
	margin-right: 3px;
	margin-bottom: 0px;
}
.STYLE1 {
	color:#3B6375;
	font-size: 12px;
}
.STYLE1 a{ color: #204155;text-decoration: none;}
.STYLE1 a:hover{ color: #f60;text-decoration:underline;}
.STYLE6 {color: #000000; font-size: 12px; }
.STYLE10 {color: #000000; font-size: 12px; }
.STYLE19 {
	color: #344b50;
	font-size: 12px;
}
.STYLE21 {
	font-size: 12px; 
	color: #3b6375;
}
.STYLE21 a{ text-decoration: none; color: blue;}
.STYLE21 a:hover{ text-decoration: underline; color: #f60;}
.STYLE22 {
	font-size: 12px;
	color: #295568;
}
.STYLE6 li{ list-style: none; float: left;width: 100%;margin-bottom: 5px;}
-->
ul,li{padding: 0px;margin: 0px; border: 0px;}
.otr td{background-color: #D3EAEF;}
.notr td{background-color: #ffffff;}
</style>

<script type="text/javascript" src="<%=basePath %>plugin/jquery/jquery-1.6.2.js"></script>
<script type="text/javascript" src="<%=basePath %>plugin/prompt/ymPrompt.js"></script>
<script type="text/javascript" src="<%=basePath %>plugin/jquery/jquery.form.js"></script>
<link rel="stylesheet" type="text/css" href="<%=basePath %>plugin/prompt/skin/dmm-green/ymPrompt.css"/>
<script language="javascript">
function moves(id){
	document.getElementById("t_"+id).className='otr';
}
function outs(id){
	document.getElementById("t_"+id).className='Notr';
}

function actionClear(){
	ymPrompt.confirmInfo({title:'信息提示',message:'确认是否清除一个登录点？',handler:handler});
}
function handler(key){
	if(key=='ok'){
		window.open('<%=basePath%>servlet/ClearKc33Servlet?t='+Math.random(),'_self');
	}
}
</script>
<script type="text/javascript" src="<%=basePath%>js/page.js"></script>
<%Message mes=(Message)request.getAttribute("mes"); %>
<%if(mes!=null){%>
   <script type="text/javascript">
   		ymPrompt.errorInfo({title:'错误提示：',message:'<%=mes.getMessage() %>'});
   </script>
<%} %>
</head>

<body>
<form action="<%=basePath %>employee/selAll.action" method="post" id="sform">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="24" bgcolor="#C3D7DA"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="3%" height="19" valign="bottom"><div align="center"><img src="<%=basePath %>images/tb.gif" width="14" height="14" /></div></td>
                <td width="94%" valign="bottom"><span class="STYLE1"><a href="<%=basePath%>right.jsp"><strong>系统首页</strong></a>--><font style="font-weight: normal;">收费端下载</font></span></td>
              </tr>
            </table></td>
           
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce">
      <tr>
        <td width="70%" height="25" bgcolor="#d3eaef" class="STYLE6" style="text-align: left;padding-left: 5px;font-weight: bold;color: #3B6375;">
		药店收费端下载
 		</td>
 		 <td bgcolor="#d3eaef" ><div align="right"> </div></td>
      </tr>
      <tr>
        <td height="80" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left;" colspan="2">
          <div style="width: 30%;float: left;padding:10px 0px 10px 30px;"> 
			 <img src="<%=basePath%>images/sfd.gif" />
		   </div>
		   <div style="width: 30%;float: left; margin-top: 10px;">
		   	 <a href="<%=basePath%>downfile/fshis.rar"><img src="<%=basePath %>images/dbt1.gif" style="float: left; margin-top: 30px;" border="0"/></a>
		   </div>
		   <div style="width: 30%;float: left; margin-top: 10px;"> 
		     <div style="float: left;width: 20%">
		     </div>
		     <div style="float: left;margin-left: 5px;width: 75%;font-size: 14px;line-height: 21px;">
		     	<strong>说明：</strong><br/><font color="black" >本文件用于安装药店收费端，适用于所有长春市医保定点<font color="red"><strong><a href="<%=basePath%>downfile/fshis.rar">药店</a></strong></font>。如需重新安装收费端软件点击下载按钮下载软件进行安装</font>
		     </div>
		   </div>
		</td>
      </tr>
     
    </table></td>
  </tr>
  
  <tr><td>&nbsp;</td></tr>
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce">
      <tr>
        <td width="70%" height="25" bgcolor="#d3eaef" class="STYLE6" style="text-align: left;padding-left: 5px;font-weight: bold;color: #3B6375;">
		门诊医院收费端下载
 		</td>
 		 <td bgcolor="#d3eaef" ><div align="right"> </div></td>
      </tr>
      <tr>
        <td height="80" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left;" colspan="2">
          <div style="width: 30%;float: left;padding:10px 0px 10px 30px;"> 
			 <img src="<%=basePath%>images/sfd.gif" />
		   </div>
		   <div style="width: 30%;float: left; margin-top: 10px;">
		   	 <a href="<%=basePath%>downfile/fshis.rar" ><img src="<%=basePath %>images/dbt2.gif" style="float: left; margin-top: 30px;" border="0"/></a>
		   </div>
		   <div style="width: 30%;float: left; margin-top: 10px;"> 
		     <div style="float: left;width: 20%">
		     </div>
		     <div style="float: left;margin-left: 5px;width: 75%;font-size: 14px;line-height: 21px;">
		     	<strong>说明：</strong><br/><font color="black" >本文件用于安装药店收费端，适用于所有长春市医保定点<font color="red"><strong><a href="<%=basePath%>downfile/fshis.rar" >门诊，医院</a></strong></font>。如需重新安装收费端软件点击下载按钮下载软件进行安装</font>
		     </div>
		   </div>
		</td>
      </tr>
     
    </table></td>
  </tr>
 
</table>
</form>
</body>
</html>

