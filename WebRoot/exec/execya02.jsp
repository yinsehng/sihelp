<%@ page language="java" import="java.util.*,com.neusoft.bean.*,com.neusoft.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
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
	ymPrompt.confirmInfo({title:'信息提示',message:'确认是否进行对照处理？',handler:handler});
}
function handler(key){
	if(key=='ok'){
		window.open('<%=basePath%>servlet/UpdYa02Servlet?t='+Math.random(),'_self');
	}
}
</script>
<script type="text/javascript" src="<%=basePath%>js/page.js"></script>
<%
Message mes=(Message)request.getAttribute("mes");
Message successmes=(Message)request.getAttribute("successmes"); 
User u=(User)session.getAttribute("user");
String scount =(String)request.getAttribute("count"); 
int count=Integer.parseInt(scount);
ReadPro pro=new ReadPro();
String ya02=pro.getValue("ya02count");
int ya02count=Integer.parseInt(ya02);
%>
<%if(mes!=null){%>
   <script type="text/javascript">
   		ymPrompt.errorInfo({title:'错误提示：',message:'<%=mes.getMessage() %>'});
   </script>
<%} %>
<%if(successmes!=null){%>
   <script type="text/javascript">
   		ymPrompt.succeedInfo({title:'信息提示：',message:'<%=successmes.getMessage() %>'});
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
                <td width="94%" valign="bottom"><span class="STYLE1"><a href="<%=basePath%>right.jsp"><strong>系统首页</strong></a>--><font style="font-weight: normal;">登录点数管理</font></span></td>
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
		登录点数管理
 		</td>
 		 <td bgcolor="#d3eaef" ><div align="right"> </div></td>
      </tr>
      <tr>
        <td height="80" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left;" colspan="2">
          <div style="width: 30%;float: left;padding:10px 0px 10px 30px;"> 
			 <img src="<%=basePath%>images/dz.gif" width="250px" />
		   </div>
		   <div style="width: 30%;float: left; margin-top: 10px;">
		     <%if(ya02count-count>0){%>
                 <a href="javascript:void(0)" onclick="actionClear()"><img src="<%=basePath %>images/dzbt.gif" style="float: left;margin-left:20px; margin-top: 30px;" border="0"/></a>		     
		     <%}else{%>
		     	 <img src="<%=basePath %>images/dzbto.gif" style="float: left;margin-left:20px; margin-top: 30px;" border="0"/>
		     <%} %>
		   </div>
		   <div style="width: 30%;float: left; margin-top: 10px;"> 
		     <div style="float: left;width: 20%">
		     </div>
		     <div style="float: left;margin-left: 5px;width: 75%;font-size: 14px;line-height: 21px;">
		     	<strong>说明：</strong><br/><font color="black" >该功能用于处理所有对照问题，如对照药品或诊疗项目时出现的无法保存删除等错误，以及甲乙类药品变成丙类等，如果按钮为灰色则当天不能再使用该功能</font>
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
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">编号</span></div></td>
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">机构名称</span></div></td>
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">今天可使用次数</span></div></td>
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">已使用次数</span></div></td>
      </tr>
       		<tr onmouseover="moves(' ')" onmouseout="outs(' ')" id="t_ " >
		        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><%=u.getName() %> </div></td>
		        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center" class="datetime"><%=u.getAkb021() %> </div></td>
		        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><%=ya02count-count %></div></td>
		        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><%=count %></div></td>
		    </tr>
    </table></td>
  </tr>
 
</table>
</form>
</body>
</html>

