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

.uldiv li{ float: left;width: 200px;}
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
		操作文档下载
 		</td>
 		 <td bgcolor="#d3eaef" ><div align="right"> </div></td>
      </tr>
      <tr>
        <td height="80" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left;" colspan="2">
          <div style="width: 100%;float: left;padding:10px 0px 10px 30px;" class="uldiv"> 
			<ul>
				<li><div><img src="<%=basePath %>images/word.png"/> </div><div><a href="<%=basePath%>downfile/wyd.doc">药店收费培训手册下载</a></div></li>
				<li><div><img src="<%=basePath %>images/word.png"/> </div><div><a href="<%=basePath%>downfile/wmz.doc">门诊收费培训手册下载</a></div></li>
				<li><div><img src="<%=basePath %>images/word.png"/> </div><div><a href="<%=basePath%>downfile/winf.doc">信息维护培训手册下载</a></div></li>
				<li><div><img src="<%=basePath %>images/word.png"/> </div><div><a href="<%=basePath%>downfile/wzy.doc">住院收费培训手册下载</a></div></li>
				<li><div><img src="<%=basePath %>images/word.png"/> </div><div><a href="<%=basePath%>downfile/print.doc">打印机设置下载</a></div></li>
			</ul>
		  </div>
		</td>
      </tr>
     
    </table></td>
  </tr>
  
   
 
</table>
</form>
</body>
</html>

