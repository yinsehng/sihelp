<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ include file="../../plugin/plugin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title></title>
	<style type="text/css">
	#mytable {width: 625px;padding: 0;margin: 0; }  
	#mytable caption {padding: 0 0 5px 0;width: 700px; font: italic 12px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;text-align: right;}  
	#mytable th {font: bold 13px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;color: #4f6b72;border-right: 1px solid #C1DAD7;border-bottom: 1px solid #C1DAD7; border-top: 1px solid #C1DAD7; letter-spacing: 2px;text-transform: uppercase; text-align: left; padding: 6px 6px 6px 12px; background: #CAE8EA url(images/bg_header.jpg) no-repeat;	}  
	#mytable th.nobg { border-top: 0; border-left: 0; border-right: 1px solid #C1DAD7; background: none; }  
	#mytable td { border-right: 1px solid #C1DAD7; border-bottom: 1px solid #C1DAD7; background: #fff; font-size:12px; padding: 6px 6px 6px 12px; color: #4f6b72; }  
	#mytable td.alt { background: #F5FAFA; color: #797268; font-size:12px; }  
	#mytable th.spec { border-left: 1px solid #C1DAD7; border-top: 0; background: #fff url(images/bullet1.gif) no-repeat; font: bold 12px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;}
	#mytable th.specalt { border-left: 1px solid #C1DAD7; border-top: 0;  background: #f5fafa url(images/bullet2.gif) no-repeat;font: bold 12px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;color: #797268;}  
	#tabs{position:absolute;top:100px;left: 930px; font: normal 12px auto "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;   color: #4f6b72;  background: #E6EAE9;  }
	
	.STYLE22{ font-size:12px;}
	</style>
	<script type="text/javascript">
	function show(msg){
		ymPrompt.win({message:'<div style=\'padding:5px;\'>'+msg+'</div>',width:380,height:340,title:'网络信息',maxBtn:true,minBtn:true,iframe:false,showMask:false});
	}
	</script>
</head>

<body>
	<div>
        <div style="width:600px; margin:0 auto; margin-top:10px;">
        	<table id="mytable" cellspacing="0">  
              <tr style="text-align: center;">  
                <th>课程名称</th>  
                <th><strong>定点编号</strong></th>
                <th><strong>定点名称</strong></th>
              </tr>
             <c:forEach items="${page.list}" var="ck" varStatus="obj">
                  <tr>  
                  	<th class="specalt">
                     ${course.cname }
                  	</th>
	                <td class="alt">
	                ${ck.akb020 }
					</td>  
	                <td class="alt">
	                ${ck.akb021 }
	                </td>  
	              </tr>  
				              
             </c:forEach>
             
            </table>  
        </div>
        <div style="width:600px; margin:0 auto; margin-top:8px; ">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="40%">
             <div align="left">
               <span class="STYLE22">&nbsp;&nbsp;&nbsp;&nbsp;共 <strong>${page.count}</strong> 页，当前第<strong>${page.current}</strong> 页，每页 <strong>${page.per}</strong> 条记录</span>
	           <input type="hidden" name="_count" value="${page.count}"/>
			   <input type="hidden" name="_current" value="${page.current}"/>
             </div>
            </td>
            <td width="60%"><table width="312" border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
                <td width="49"><div align="center"><a style="cursor:hand" id="begin"><img src="<%=basePath%>images/main_54.gif" width="40" height="15" /></a></div></td>
                <td width="49"><div align="center"><a style="cursor:hand" id="before"><img src="<%=basePath%>images/main_56.gif" width="45" height="15" /></a></div></td>
                <td width="49"><div align="center"><a style="cursor:hand" id="next"><img src="<%=basePath%>images/main_58.gif" width="45" height="15" /></a></div></td>
                <td width="49"><div align="center"><a style="cursor:hand" id="end"><img src="<%=basePath%>images/main_60.gif" width="40" height="15" /></a></div></td>
                <td width="37" class="STYLE22"><div align="center">转到</div></td>
                <td width="22"><div align="center">
                  <input type="text" name="topg" id="topg"  style="width:25px; height:14px; font-size:12px; border:solid 1px #7aaebd;"/>
                </div></td>
                <td width="22" class="STYLE22"><div align="center">页</div></td>
                <td width="35"><a style="cursor:hand" id="to"><img src="<%=basePath%>images/main_62.gif" width="26" height="15" /></a></td>
              </tr>
            </table></td>
          </tr>
        </table>
        </div>
    </div>
</body>
</html>
