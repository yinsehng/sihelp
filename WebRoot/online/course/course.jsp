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
 	
 	$("#sub").click(function () {
 		$("[name='kb01']").each(function(){
		    if($(this).attr("checked")){  
		        if($(this).val()=='1'){//清除
		        	$("#kb01type").val("");
		        }
		    } 
		});
 		if ( $.trim($("*[name='cname']").val())== "") { 
			ymPrompt.errorInfo({title:'错误提示：',message:'名称不能为空!'});
			return;
		}
		if ( $.trim($("*[name='type']").val())== "0") { 
			ymPrompt.errorInfo({title:'错误提示：',message:'请选择类别!'});
			return;
		}
		if ( $.trim($("*[name='begindate']").val())== "") { 
			ymPrompt.errorInfo({title:'错误提示：',message:'培训时间不能为空!'});
			return;
		}
		if ( $.trim($("*[name='num_a']").val())== "") { 
			ymPrompt.errorInfo({title:'错误提示：',message:'可报名人数不能为空!'});
			return;
		}
		if ( $.trim($("*[name='address']").val())== "") { 
			ymPrompt.errorInfo({title:'错误提示：',message:'培训地点不能为空!'});
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
<form action="<%=basePath%>course/AddCourse.do" method="post">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="24" bgcolor="#C3D7DA"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="3%" height="19" valign="bottom"><div align="center"><img src="<%=basePath %>images/tb.gif" width="14" height="14" /></div></td>
                <td width="94%" valign="bottom"><span class="STYLE1"><a href="<%=basePath%>right.jsp"><strong>系统首页</strong></a>--><font style="font-weight: normal;">培训课程添加</font></span></td>
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
		 培训课程添加
 		</td>
      </tr>
      <tr>
        <td height="35" width="10%" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left;padding-left: 8px;font-weight: bold;color: #3B6375;" >
    	   课程名称
		</td>
		<td height="35" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left;padding-left: 8px;" >
		  	<input type="text" name="cname" id="cname" value="${course.cname}" style="width: 250px"/>
		  	<input type="hidden" name="id"  value="${course.id}"/>
		</td>
      </tr>
      <tr>
        <td height="35" width="10%" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left;padding-left: 8px;font-weight: bold;color: #3B6375;" >
    	   课程类别
		</td>
		<td height="35" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left;padding-left: 8px;" >
    	   <select name="type">
    	   		<c:if test="${course.type==1}">
    	   			<option value="0">请选择</option>
		    	   	<option value="1" selected="selected">医院</option>
		    	   	<option value="2">药店</option>
    	   		</c:if>
    	   		<c:if test="${course.type==2}">
    	   			<option value="0">请选择</option>
		    	   	<option value="1">医院</option>
		    	   	<option value="2" selected="selected">药店</option>
    	   		</c:if>
    	   		<c:if test="${course.type==null}">
    	   			<option value="0">请选择</option>
		    	   	<option value="1">医院</option>
		    	   	<option value="2">药店</option>
    	   		</c:if>
    	   </select>
		</td>
      </tr>
      
      <tr>
        <td height="35" width="10%" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left;padding-left: 8px;font-weight: bold;color: #3B6375;" >
    	   培训时间
		</td>
		<td height="35" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left;padding-left: 8px;" >
    	   <input type="text"   name="begindate" value="${course.begindate}"/> 
		</td>
      </tr>
       <tr>
        <td height="35" width="10%" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left;padding-left: 8px;font-weight: bold;color: #3B6375;" >
    	   培训定点
		</td>
		<td height="35" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left;padding-left: 8px;" >
			<c:if test="${course.kb01type==1 }">
		    	   <input type="radio" name="kb01" value="1" checked="checked"  onclick="showdiv(0)"/> 所有定点
		    	   <input type="radio" name="kb01" value="0" onclick="showdiv(1)"/>指定定点
		    	 <div id="kb01div" style="display: none;"><br/><input type="text" value="${kb01type }" id="kb01type" name="kb01type" style="width: 600px;"/>输入定点编号以","分割</div>
			</c:if>
			<c:if test="${course.kb01type==null }">
		    	   <input type="radio" name="kb01" value="1"  checked="checked"  onclick="showdiv(0)"/> 所有定点
		    	    <input type="radio" name="kb01" value="0" onclick="showdiv(1)"/>指定定点
		    	 <div id="kb01div" style="display: none;"><br/><input type="text" value="${kb01type }" id="kb01type" name="kb01type" style="width: 600px;"/>输入定点编号以","分割</div>
			</c:if>
			<c:if test="${course.kb01type!=null && course.kb01type!=1}">
		    	  <input type="radio" name="kb01" value="1"  onclick="showdiv(0)"/>  所有定点
		    	  <input type="radio" name="kb01" value="0"  checked="checked" onclick="showdiv(1)"/>  指定定点
		    	 <div id="kb01div"><br/><input type="text" name="kb01type" value="${kb01type }" id="kb01type" style="width: 600px;"/>输入定点编号以","分割</div>
			</c:if>
		</td>
      </tr>
      
      <tr>
        <td height="35" width="10%" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left;padding-left: 8px;font-weight: bold;color: #3B6375;" >
    	   可报名人数
		</td>
		<td height="35" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left;padding-left: 8px;" >
    	   <input type="text" name="num_a" style="width: 50px;" value="${course.num_a}"/>
		</td>
      </tr>
     <tr>
        <td height="35" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left;padding-left: 8px;font-weight: bold;color: #3B6375;" >
                      培训地址
		</td>
		<td height="35" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left; padding-left: 8px;">
    	    <input type="text" name="address" style="width: 350px;" value="${course.address}"/>
		</td>
      </tr>
      <tr>
        <td height="35" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left;padding-left: 8px;font-weight: bold;color: #3B6375;" >
                      定点是否可见
		</td>
		<td height="35" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left; padding-left: 8px;">
    	    <select name="aae100">
    	   		<c:if test="${course.aae100==1}">
		    	   	<option value="1" selected="selected">可见</option>
		    	   	<option value="0">不可见</option>
    	   		</c:if>
    	   		<c:if test="${course.aae100==0}">
		    	   	<option value="1">可见</option>
		    	   	<option value="0" selected="selected">不可见</option>
    	   		</c:if>
    	   		<c:if test="${course.aae100==null}">
		    	   	<option value="1">可见</option>
		    	   	<option value="0">不可见</option>
    	   		</c:if>
    	   </select>
		</td>
      </tr>
      <tr>
        <td height="100" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left;padding-left: 8px;font-weight: bold;color: #3B6375;" >
                         说明
		</td>
		<td height="100" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left; padding-left: 8px;">
    	   <FCK:editor instanceName="exp" height="400px" >
		         <jsp:attribute name="value"> 
		             ${course.exp} 
		         </jsp:attribute>
		    </FCK:editor>
		</td>
      </tr>
      
      <tr>
        <td height="40" bgcolor="#FFFFFF" class="STYLE6 bt"  style="text-align: left;padding-left: 8px;" colspan="2">
        	<a id="sub"><span>提交记录</span></a> <a id="back"><span>返回前页</span></a>
		</td>
      </tr>
    </table>
    </td>
  </tr>
 
</table>
</form>
</body>
</html>

