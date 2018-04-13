<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK" %>
<%@ include file="../plugin/plugin.jsp"%>
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
 	
 	$("#sub").click(function () {
 		var ggjg=0;
 		$("[name='whcd']").each(function(){
		    if($(this).attr("checked")){  
		       $("#xl").val($(this).val());
		    } 
		});
 		
 		if ( $.trim($("*[name='oname']").val())== "") { 
			ymPrompt.errorInfo({title:'错误提示：',message:'姓名不能为空!'});
			return;
		}
		if ( $.trim($("*[name='sex']").val())== "0") { 
			ymPrompt.errorInfo({title:'错误提示：',message:'请选择性别!'});
			return;
		}
		if ( $.trim($("*[name='age']").val())== "") { 
			ymPrompt.errorInfo({title:'错误提示：',message:'年龄不能为空!'});
			return;
		}
		if ( $.trim($("*[name='tel']").val())== "") { 
			ymPrompt.errorInfo({title:'错误提示：',message:'联系电话不能为空!'});
			return;
		}
		if ( $.trim($("*[name='oname']").val())== "") { 
			ymPrompt.errorInfo({title:'错误提示：',message:'姓名不能为空!'});
			return;
		}
		if($("#xl").val()==''){
			ymPrompt.errorInfo({title:'错误提示：',message:'请选择学历!'});
			return;
		}
 		$("form").submit();
 	});
 	 $("#back").click(function(){
 		history.go(-1);
 	});
 });

 </script>
</head> 
 
<body>
<form action="<%=basePath%>oper/AddOperator.do" method="post">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="24" bgcolor="#C3D7DA"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="3%" height="19" valign="bottom"><div align="center"><img src="<%=basePath %>images/tb.gif" width="14" height="14" /></div></td>
                <td width="94%" valign="bottom"><span class="STYLE1"><a href="<%=basePath%>right.jsp"><strong>系统首页</strong></a>--><font style="font-weight: normal;">操作员培训报名</font></span></td>
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
		 操作员培训报名
 		</td>
      </tr>
      <tr>
        <td height="35" width="10%" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left;padding-left: 8px;font-weight: bold;color: #3B6375;" >
    	   操作员姓名
		</td>
		<td height="35" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left;padding-left: 8px;" >
		   ${operator.name} 
		</td>
      </tr>
      <tr>
        <td height="35" width="10%" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left;padding-left: 8px;font-weight: bold;color: #3B6375;" >
    	   操作员性别
		</td>
		<td height="35" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left;padding-left: 8px;" >
    	   		<c:if test="${operator.sex==1}">
    	   			男
    	   		</c:if>
    	   		<c:if test="${operator.sex==2}">
    	   			女
    	   		</c:if>
		</td>
      </tr>
      
      <tr>
        <td height="35" width="10%" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left;padding-left: 8px;font-weight: bold;color: #3B6375;" >
    	   操作员年龄
		</td>
		<td height="35" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left;padding-left: 8px;" >
    	    ${operator.age}  岁
		</td>
      </tr>
      
      <tr>
        <td height="35" width="10%" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left;padding-left: 8px;font-weight: bold;color: #3B6375;" >
    	   联系电话
		</td>
		<td height="35" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left;padding-left: 8px;" >
    	  ${operator.tel} 
		</td>
      </tr>
     <tr>
        <td height="35" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left;padding-left: 8px;font-weight: bold;color: #3B6375;" >
                      最高学历
		</td>
		<td height="35" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left; padding-left: 8px;">
    	   <c:if test="${operator.xl==1 }">
    	   	  小学
    	   </c:if>
    	   <c:if test="${operator.xl==2 }">
    	   	   初中
    	   </c:if>
    	   <c:if test="${operator.xl==3 }">
    	   	   高中（中职学校、技校、普通高中学校）
    	   </c:if>
    	   <c:if test="${operator.xl==4 }">
    	   	   大学专科
    	   </c:if>
    	   <c:if test="${operator.xl==5}">
    	   	  大学本科
    	   </c:if>
    	   <c:if test="${operator.xl==6 }">
    	   	   硕士研究生及以上
    	   </c:if>
		</td>
      </tr>
      <tr>
        <td height="100" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left;padding-left: 8px;font-weight: bold;color: #3B6375;" >
                         培训目的&要求
		</td>
		<td height="100" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left; padding-left: 8px;">
		     ${operator.mudi} 
		</td>
      </tr>
      
      <tr>
        <td height="40" bgcolor="#FFFFFF" class="STYLE6 bt"  style="text-align: left;padding-left: 8px;" colspan="2">
        <a id="back"><span>返回前页</span></a>
		</td>
      </tr>
    </table>
    </td>
  </tr>
 
</table>
</form>
</body>
</html>

