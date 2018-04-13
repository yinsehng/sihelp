<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ include file="../../plugin/plugin.jsp"%>
<%
    Integer TOTALNUM = (Integer)request.getAttribute("TOTALNUM");
    Integer VALIDNUM = (Integer)request.getAttribute("VALIDNUM");
    Integer NOVALIDNUM = TOTALNUM - VALIDNUM;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>定点医药机构服务协议网签系统</title>
<script type="text/javascript" src="<%=basePath %>plugin/jquery/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="<%=basePath %>plugin/corechart/js/jsapi.js"></script>
<script type="text/javascript" src="<%=basePath %>plugin/corechart/js/corechart.js"></script>		
<script type="text/javascript" src="<%=basePath %>plugin/corechart/js/jquery.gvChart-1.0.1.min.js"></script>
<script type="text/javascript" src="<%=basePath %>plugin/corechart/js/jquery.ba-resize.min.js"></script>
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
.text{width: 200px;padding: 2px;}
</style>
<script type="text/javascript">
(function($){
    $.fn.placeholder = function(options){
        var opts = $.extend({}, $.fn.placeholder.defaults, options);
        var isIE = document.all ? true : false;
        return this.each(function(){
            var _this = this,
                placeholderValue =_this.getAttribute("placeholder"); //缓存默认的placeholder值
            if(isIE){
                _this.setAttribute("value",placeholderValue);
                _this.onfocus = function(){
                    $.trim(_this.value) == placeholderValue ? _this.value = "" : '';
                };
                _this.onblur = function(){
                    $.trim(_this.value) == "" ? _this.value = placeholderValue : '';
                };
            }
        });
    };
})(jQuery);
</script>
</head>

<body>
<form action="<%=basePath %>servlet/ProtocolCountServlet" method="post" id="sform">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="24" bgcolor="#C3D7DA"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="3%" height="19" valign="bottom"><div align="center"><img src="<%=basePath %>images/tb.gif" width="14" height="14" /></div></td>
                <td width="94%" valign="bottom"><span class="STYLE1"><a href="<%=basePath%>right.jsp"><strong>系统首页</strong></a>--><font style="font-weight: normal;">网签协议统计</font></span></td>
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
		网签协议统计列表
 		</td>
      </tr>
     
    </table></td>
  </tr>
  <tr>
	 <td height="40" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left;" colspan="2">
          <div style="width: 30%;float: left;padding:10px 0px 10px 30px;"> 
			<ul>
			  <li>网签年份：<input placeholder="请输入用查询年份" type="text" class="text" name="WQ_YEAR" value=""/></li>
			</ul>
		   </div>
		   <div style="width: 30%;float: left; margin-top: 10px;"> 
		     <div style="float: left;width: 20%">
		       <input type="submit" value="查询"/><p/>
		     </div>
		   </div>
		</td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" >
    	

	   <table id='myTable1'>
			<caption>网签协议签署情况统计(共<%=TOTALNUM %>)</caption>
			<thead>
				<tr>
					<th></th>
					<th>已签署(<%=VALIDNUM %>)</th>
					<th>未签署(<%=NOVALIDNUM %>)</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th><%=TOTALNUM %></th>
					<td><%=VALIDNUM %></td>
					<td><%=NOVALIDNUM %></td>
				</tr>
			</tbody>
		</table>  
	
    	
    </table></td>
  </tr>
</table>
</form>
<script type="text/javascript">
gvChartInit();
$(document).ready(function(){
		$('#myTable1').gvChart({
			chartType: 'PieChart',
			gvSettings: {
			vAxis: {title: 'No of players'},
			hAxis: {title: 'Month'},
			width: 600,
			height: 350
		}
	});
});
$(".text").placeholder();
</script>
</body>
</html>

