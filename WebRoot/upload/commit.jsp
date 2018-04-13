<%@ page language="java" import="java.util.*,com.neusoft.bean.*,com.neusoft.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK" %>
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

$(function(){
	 $("[name='allt']").click(function(){
	    if(!$(this).attr("checked")){
	    	$("[name='cid']").removeAttr("checked");//取消全选
	    }else{
       		$("[name='cid']").attr("checked",'true');//全选
	    }
     });
	 
	 $($("[name='all']")).click(function(){  //反选 
	   $("[name='cid']").each(function(){
	     if($(this).attr("checked")){  
	        $(this).removeAttr("checked");  
	     }else{  
	      $(this).attr("checked",'true');  
	     } 
	  });  
	 }); 
});
 
</script>
<script type="text/javascript" src="<%=basePath%>js/page.js"></script>
<%
String mes=(String)request.getParameter("ok");
%>
<%if(mes!=null){%>
   <script type="text/javascript">
   		ymPrompt.succeedInfo({title:'信息提示：',message:'问题提交成功！！！'});
   </script>
<%} %>
</head>

<body>

<form action="<%=basePath %>servlet/SubmitPb01" method="post" id="sform">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="24" bgcolor="#C3D7DA"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="3%" height="19" valign="bottom"><div align="center"><img src="<%=basePath %>images/tb.gif" width="14" height="14" /></div></td>
                <td width="94%" valign="bottom"><span class="STYLE1"><a href="<%=basePath%>right.jsp"><strong>系统首页</strong></a>--><font style="font-weight: normal;">提交问题</font></span></td>
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
		问题提交
 		</td>
       
      </tr>
      <tr>
        <td bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left;" colspan="2">
          	<table width="100%">
          		<tr >
          		  <td width="8%" style="text-align: right;font-size: 14px; font-weight: bold;">标题：</td>
          		  <td>
            		<input type="text" style="width: 350px;" name="title"/> 
          		  </td>
          		</tr>
          		<tr >
          		  <td width="8%" style="text-align: right;font-size: 14px; font-weight: bold;">内容：</td>
          		  <td>
            		<FCK:editor instanceName="body" height="400px" >
				         <jsp:attribute name="value"> 
				           
				         </jsp:attribute>
				    </FCK:editor>     
          		  </td>
          		</tr>
          		<tr >
          		  <td width="8%" style="text-align: right;font-size: 14px; font-weight: bold;"> </td>
          		  <td>
            		<input type="submit" value="提交问题内容" /> 
          		  </td>
          		</tr>
          	</table>
		</td>
      </tr>
     
    </table></td>
  </tr>

</table>
</form>
</body>
</html>

