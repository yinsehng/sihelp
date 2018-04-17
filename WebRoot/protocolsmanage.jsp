<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ include file="../../plugin/plugin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>定点医药机构服务协议网签系统</title>
<script type="text/javascript" src="<%=basePath %>plugin/jquery/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="<%=basePath %>plugin/simplepop/simplepop.css"/>
<link rel="stylesheet" href="<%=basePath %>plugin/simplepop/main.css"/>
<script src="<%=basePath %>plugin/simplepop/simplepop.js"></script>
<script language="javascript" src="<%=basePath %>plugin/lodop/LodopFuncs.js"></script>
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

<script language="javascript">

var ymr = timer();
var LODOP; //声明为全局变量      
function PrintOneURL(url){
	CreatePage();
	var allUrl = "<%=basePath%>" + url;
	LODOP=getLodop();
	LODOP.ADD_PRINT_URL(30,20,746,"95%",allUrl);
	LODOP.SET_PREVIEW_WINDOW(0,0,0,1000,600,"");
	LODOP.SET_SHOW_MODE("SKIN_TYPE",14);	
	LODOP.PREVIEW();
};
function CreatePage(){
	LODOP=getLodop();  
	LODOP.PRINT_INITA(12,14,690,450,"按网址打印");
	LODOP.SET_PRINT_STYLEA(0,"FontSize",30);
	LODOP.SET_PRINT_STYLEA(1,"Horient",2);
};
$(function(){
	$("#del").click(function(){
		if($("[name='cid']:checked").length<1){
			ymPrompt.errorInfo({title:'错误提示：',message:'请选择要取消的记录!'});
		}else{ 
	    	ymPrompt.confirmInfo({message:'取消后不可恢复您确定要取消吗？',title:'取消提示：',handler:del});
	    }
	}); 
	 
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
function del(t){
	var str="";
	$("[name='cid']:checked").each(function(){
		str+=$(this).val()+",";		       
	}); 
    if(t=='ok'){//执行删除
    	$("form").attr("action", "<%=basePath%>course/DelCourse.do?ids="+str);
  		$("form").submit();
    }
}
function moves(id){
	document.getElementById("t_"+id).className='otr';
}
function outs(id){
	document.getElementById("t_"+id).className='Notr';
}
var delid;
function delonly(id){
	ymPrompt.confirmInfo({message:'取消后不可恢复您确定要取消吗？',title:'取消提示：',handler:delonlyone});
	delid=id;
}
function editJinfo(type){
	window.location.href = "<%=basePath%>servlet/EditJInfoServlet?type=" + type;
}
function delonlyone(t){
    if(t=='ok'){//执行删除
    	$("form").attr("action", "<%=basePath%>course/DelCourse.do?ids="+delid);
  		$("form").submit();
    }
}
function showkb01(cid){
	ymPrompt.win({message:'<%=basePath%>/course/SelCourKb01.do?cid='+cid,width:650,height:450,title:'定点列表',maxBtn:true,minBtn:true,iframe:true});
}
function editProtocol(AKB020,WQ_YEAR) {
	window.location.href = "<%=basePath%>servlet/EditProtocolServlet?AKB020=" + AKB020+"&WQ_YEAR="+WQ_YEAR;
}

function printProtocol(AKB020,WQ_YEAR) {
	$.ajax({
  	    url:"<%=basePath%>servlet/CheckProtocolServlet?temptime="+Math.random(),
  	    data:{
  	    	"AKB020":AKB020,
  	    	"WQ_YEAR":WQ_YEAR,
  	    	"ADMIN":1
  	    },  
  	    type:'GET',
  	    cache:false, 
  	    dataType:'text',
  	    success:function(result) {
  	    	if (result == "repeat") {
  	    		//今年已经签署，可以打印
  	    		SimplePop.confirm("还未签署协议不能进行打印，请确认!",
						  {
					  		type: "error",
					  		title: "错误提示",
					  		opacity: 0.2,
					  		cancel: function(){
			                 }
  	    		});
  	    	} else {
  	    		PrintOneURL(result);
  	    	}
  	    },
  	    error : function() {
  	    	
  	    }
  	});
}
function timer() {
	var date = new Date();
	var y= date.getFullYear();
	var yue=date.getMonth();
	var ri=date.getDate();
	return y+"年"+(yue+1)+"月"+ri+"日";
}
</script>
<script type="text/javascript" src="<%=basePath%>js/page.js"></script>
</head>

<body>
<form action="<%=basePath %>servlet/ProtocolManageServlet" method="post" id="sform">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >
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
        <td width="70%" height="25" bgcolor="#d3eaef" class="STYLE6" style="text-align: left;padding-left: 5px;font-weight: bold;color: #3B6375;">
		网签协议列表
 		</td>
      </tr>
      
      <tr>
        <td height="40" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left;" colspan="2">
         <div style="width: 95%;height:40%;float: left;padding:0px 0px 10px 30px;"> 
			 <div style="width:20%;height:100%;float: left;"></div>
			 <div style="width:20%;height:100%;float: left;margin-left: 5px;">
			 	医院药店：<select name="type" style="width: 150px;">
			  		 <option value="0">====请选择类别====</option>
					 <c:choose>
					    <c:when test="${param.type==1}"> 
					    	<option value="1" selected="selected">医院</option>
					    </c:when>
					    <c:otherwise>  
					  	    <option value="1">医院</option>
					    </c:otherwise>
					 </c:choose>
					 <c:choose>
					    <c:when test="${param.type==2}"> 
					    	<option value="2" selected="selected">药店</option>
					    </c:when>
					    <c:otherwise>  
					  	    <option value="2">药店</option>
					    </c:otherwise>
					 </c:choose>
			  	</select>
			 </div>
			 <div style="width:20%;height:100%;float: left;margin-left: 5px;">
			 	网签年份：<input type="text" name="WQ_YEAR" value="${param.WQ_YEAR}" style="width: 150px;"/>
			 </div>
			 <div style="width:20%;height:100%;float: left;margin-left: 5px;">
			 	<input type="submit" value="查询"/><p/>
			 </div>
			 <div style="width:15%;height:100%;float: left;margin-left: 5px;"></div>
		  </div>
		</td>
      </tr>
      
    </table></td>
  </tr>
  <tr><td>&nbsp;</td></tr>
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" >
      <tr>
        <td width="5%" height="20" bgcolor="d3eaef" class="STYLE10"><div align="center">
          <input type="checkbox" name="all" title="点击反选"/>
        </div></td>
        <td width="15%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">名称</span></div></td>
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">医院&药店</span></div></td>
        <td width="5%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">乙方法人</span></div></td>
        <td width="20%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">地址</span></div></td>
        <td width="15%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">联系电话</span></div></td>
        <td width="5%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">IP地址</span></div></td>
         <td width="5%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">网签年份</span></div></td>
         <td width="8%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">经办时间</span></div></td>
        <td width="17%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">操作</span></div></td>
      </tr>
      <c:forEach items="${page.list}" var="p" varStatus="status">
		    <tr onmouseover="moves('${status.index+1}')" onmouseout="outs('${status.index+1}')" id="t_${status.index+1}" >
		        <td height="20" bgcolor="#FFFFFF"><div align="center">
					<input type="checkbox" name="cid"   value=""/>
		        </div></td>
		         <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><strong>${p.WQ_AKB021}</strong></div></td>
		        <td height="20" bgcolor="#FFFFFF" class="STYLE19">
		       		<div align="center">
			       		<c:choose>
						    <c:when test="${p.TYPE==1}"> 
						    	医院
						    </c:when>
						    <c:otherwise>  
						  	   	 药店
						    </c:otherwise>
						 </c:choose>
		       		</div>
		        </td>
		        <td height="20" bgcolor="#FFFFFF" class="STYLE19">
		        	<div align="center" style="line-height: 25px;">
						${p.WQ_NAME }
					</div>
				</td>
				<td height="20" bgcolor="#FFFFFF" class="STYLE19">
		        	<div align="center" style="line-height: 25px;">
		        	    ${p.WQ_ADDRESS }
					</div>
				</td>
		        <%-- <td height="20" bgcolor="#FFFFFF" class="STYLE19">
		        	<div align="center">
		        		${p.WQ_POSTALCODE }
		        	</div>
		        </td> --%>
		        <td height="20" bgcolor="#FFFFFF" class="STYLE19">
		        	<div align="center">
		        		${p.WQ_TEL }
		        	</div>
		        </td>
		         <td height="20" bgcolor="#FFFFFF" class="STYLE19">
		        	<div align="center">
		        		${p.WQ_IP }
		        	</div>
		        </td>
		        <td height="20" bgcolor="#FFFFFF" class="STYLE19">
		        	<div align="center">
		        		${p.WQ_YEAR }
		        	</div>
		        </td>
		        <td height="20" bgcolor="#FFFFFF" class="STYLE19">
		        	<div align="center">
		        		${p.WQ_TIME }
		        	</div>
		        </td>
		        <td height="20" bgcolor="#FFFFFF" class="STYLE19">
		        	<div align="left" style="margin-top: 5px;">
				        <input style="margin-left: 5px;" type="button" value="修改信息" onclick="editProtocol(${p.AKB020},${p.WQ_YEAR});"/>&nbsp;&nbsp;
				        <input type="button" value="打印" onclick="printProtocol(${p.AKB020},${p.WQ_YEAR});"/>&nbsp;&nbsp;
		        	</div>
		        </td>
		    </tr>
     	</c:forEach>	
    </table></td>
  </tr>
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="33%">
         <div align="left">
          <span class="STYLE22">&nbsp;&nbsp;&nbsp;&nbsp;共 <strong>${page.count}</strong> 页，当前第<strong>${page.current}</strong> 页，每页 <strong>${page.per}</strong> 条记录</span>
          <input type="hidden" name="_count" value="${page.count}"/>
		  <input type="hidden" name="_current" value="${page.current}"/>
         </div>
        </td>
        <td width="67%"><table width="312" border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td width="49"><div align="center"><a style="cursor:hand" id="begin"><img src="<%=basePath %>images/main_54.gif" width="40" height="15" /></a></div></td>
            <td width="49"><div align="center"><a style="cursor:hand" id="before"><img src="<%=basePath %>images/main_56.gif" width="45" height="15" /></a></div></td>
            <td width="49"><div align="center"><a style="cursor:hand" id="next"><img src="<%=basePath %>images/main_58.gif" width="45" height="15" /></a></div></td>
            <td width="49"><div align="center"><a style="cursor:hand" id="end"><img src="<%=basePath %>images/main_60.gif" width="40" height="15" /></a></div></td>
            <td width="37" class="STYLE22"><div align="center">转到</div></td>
            <td width="22"><div align="center">
              <input type="text" name="topg" id="topg"  style="width:25px; height:14px; font-size:12px; border:solid 1px #7aaebd;"/>
            </div></td>
            <td width="22" class="STYLE22"><div align="center">页</div></td>
            <td width="35"><a style="cursor:hand" id="to"><img src="<%=basePath %>images/main_62.gif" width="26" height="15" /></a></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
</form>
</body>
</html>

