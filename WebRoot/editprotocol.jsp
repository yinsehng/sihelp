<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK" %>
<%@ include file="../../plugin/plugin.jsp"%>
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
 
-->
ul,li{padding: 0px;margin: 0px; border: 0px;}
.otr td{background-color: #D3EAEF;}
.notr td{background-color: #ffffff;}
#guige{padding: 5px;}
#guige input{ height: 20px;}
.ggprice{ width: 40px;}
.ggdes{ width: 250px;}
</style>
 <link rel="stylesheet" type="text/css" href="<%=basePath%>css/public.css"/>
 <script type="text/javascript">

 $(function () {
 	
 	$("#save").click(function () {
 		if ( $.trim($("*[name='WQ_AKB021']").val())== "") { 
			ymPrompt.errorInfo({title:'错误提示：',message:'名称不能为空!'});
			return;
		}
		if ( $.trim($("*[name='WQ_NAME']").val())== "") { 
			ymPrompt.errorInfo({title:'错误提示：',message:'法人代表不能为空!'});
			return;
		}
		if ( $.trim($("*[name='WQ_ADDRESS']").val())== "") { 
			ymPrompt.errorInfo({title:'错误提示：',message:'地址不能为空!'});
			return;
		}
		if ( $.trim($("*[name='WQ_POSTALCODE']").val())== "") { 
			ymPrompt.errorInfo({title:'错误提示：',message:'邮政编码不能为空!'});
			return;
		}
		if ( $.trim($("*[name='WQ_TEL']").val())== "") { 
			ymPrompt.errorInfo({title:'错误提示：',message:'联系方式不能为空!'});
			return;
		}
		
		
 		$("form").submit();
 	});
 	 $("#back").click(function(){
 		history.go(-1);
 	});
 });
function showdiv(id){
	if(id=='1'){
		$("#kb01div").show();
	}else{
		$("#kb01div").hide();
	}
}
 </script>
</head> 
 
<body>
<form action="<%=basePath%>servlet/SaveProtocolServlet" method="post">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="24" bgcolor="#C3D7DA"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="3%" height="19" valign="bottom"><div align="center"><img src="<%=basePath %>images/tb.gif" width="14" height="14" /></div></td>
                <td width="94%" valign="bottom"><span class="STYLE1"><a href="<%=basePath%>right.jsp"><strong>系统首页</strong></a>--><font style="font-weight: normal;">网签协议管理</font></span></td>
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
        <td width="100%" height="25" bgcolor="#d3eaef" class="STYLE6" style="text-align: left;padding-left: 5px;font-weight: bold;color: #15428B;" colspan="2">
		修改网签协议列表
 		</td>
      </tr>
      <tr>
        <td height="35" width="10%" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left;padding-left: 8px;font-weight: bold;color: #3B6375;" >
    	   名称
		</td>
		<td height="35" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left;padding-left: 8px;" >
		   <input type="text" name="WQ_AKB021" value="${protocol.WQ_AKB021}" style="width: 500px;"/> 
		</td>
      </tr>
      <tr>
        <td height="35" width="10%" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left;padding-left: 8px;font-weight: bold;color: #3B6375;" >
    	   医院&药店
		</td>
		<td height="35" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left;padding-left: 8px;" >
   	   		<c:if test="${protocol.TYPE==1}">
   	   			医院 
   	   		</c:if>
   	   		<c:if test="${protocol.TYPE==2}">
   	   			药店 
   	   		</c:if>
		</td>
      </tr>
      
      <tr>
        <td height="35" width="10%" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left;padding-left: 8px;font-weight: bold;color: #3B6375;" >
    	   法人代表
		</td>
		<td height="35" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left;padding-left: 8px;" >
    	 <input type="text" name="WQ_NAME" value="${protocol.WQ_NAME}" style="width: 500px;"/>   
		</td>
      </tr>
      
      <tr>
        <td height="35" width="10%" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left;padding-left: 8px;font-weight: bold;color: #3B6375;" >
    	   地址
		</td>
		<td height="35" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left;padding-left: 8px;" >
    	   <input type="text" name="WQ_ADDRESS" value="${protocol.WQ_ADDRESS}" style="width: 500px;"/>
		</td>
      </tr>
      <tr>
        <td height="35" width="10%" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left;padding-left: 8px;font-weight: bold;color: #3B6375;" >
    	   邮政编码
		</td>
		<td height="35" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left;padding-left: 8px;" >
    	   <input type="text" name="WQ_POSTALCODE" value="${protocol.WQ_POSTALCODE}" style="width: 500px;"/>
		</td>
      </tr>
     <tr>
        <td height="35" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left;padding-left: 8px;font-weight: bold;color: #3B6375;" >
                      联系电话
		</td>
		<td height="35" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left; padding-left: 8px;">
    	   <input type="text" name="WQ_TEL" value="${protocol.WQ_TEL}" style="width: 500px;"/>
    	   <input type="hidden" name="AKB020" value="${protocol.AKB020}"/> 
    	   <input type="hidden" name="WQ_YEAR" value="${protocol.WQ_YEAR}"/> 
		</td>
      </tr>
      
      <tr>
        <td height="35" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left;padding-left: 8px;font-weight: bold;color: #3B6375;" >
                      是否有效
		</td>
		<td height="35" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left; padding-left: 8px;">
    	   <select name="WQ_VALID" style="width: 100px;">
					 <c:choose>
					    <c:when test="${protocol.WQ_VALID==0}"> 
					    	<option value="0" selected="selected">无效</option>
					    </c:when>
					    <c:otherwise>  
					  	    <option value="0">无效</option>
					    </c:otherwise>
					 </c:choose>
					 <c:choose>
					    <c:when test="${protocol.WQ_VALID==1}"> 
					    	<option value="1" selected="selected">有效</option>
					    </c:when>
					    <c:otherwise>  
					  	    <option value="1">有效</option>
					    </c:otherwise>
					 </c:choose>
			  	</select>
		</td>
      </tr>
      
      <tr>
        <td height="40" bgcolor="#FFFFFF" class="STYLE6 bt"  style="text-align: left;padding-left: 8px;" colspan="2">
        	  <a id="save"><span>保存</span></a>
		</td>
      </tr>
    </table>
    </td>
  </tr>
 
</table>
</form>
</body>
</html>

