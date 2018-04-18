<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ include file="../../plugin/plugin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>定点医药机构服务协议网签系统</title>
<link rel="stylesheet" href="<%=basePath %>plugin/simplepop/simplepop.css"/>
<link rel="stylesheet" href="<%=basePath %>plugin/simplepop/main.css"/>
<script src="<%=basePath %>plugin/simplepop/simplepop.js"></script>
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
.content {
    position: absolute;
    top: 50%;
    height: 240px;
    margin-top: -120px; /* negative half of the height */
}
</style>

<script language="javascript">
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
	var bgcolor = $('#t'+id).attr('bgcolor');
	if (bgcolor != "#98F5FF" && bgcolor != "#98f5ff") {
		document.getElementById("t"+id).className='otr';
	}
}
function outs(id){
	var bgcolor = $('#t'+id).attr('bgcolor');
	if (bgcolor != "#98F5FF" && bgcolor != "#98f5ff") {
		document.getElementById("t"+id).className='Notr';
	}
	
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
function isRealNum(val){
    // isNaN()函数 把空串 空格 以及NUll 按照0来处理 所以先去除
    if(val === "" || val ==null){
        return false;
    }
    if(!isNaN(val)){
        return true;
    }else{
        return false;
    }
}    
$(document).ready(function(){
	$("#mto").click(function(){
		var topg = $("#topg").val();
		if (!isRealNum(topg)) {
			SimplePop.confirm("请输入数字!",
					  {
				  		type: "error",
				  		title: "错误提示",
				  		opacity: 0.2,
				  		cancel: function(){
		                  
		              },
		              confirm: function(){
		              	
		              }
					  });
			return;
		}
		window.location.href="<%=basePath %>servlet/UserManagerServlet?page="+topg;
	});
	
	$("#export").click(function(){
		var akb020 = $("#akb020").val();
		var akb021 = $("#akb021").val();
		var WQ_YEAR = $("#WQ_YEAR").val();
		var type = $("#type").val();
		window.location.href="<%=basePath %>/servlet/ExportBooksTableServlet?akb020="+akb020+"&akb021="+akb021+"&WQ_YEAR="+WQ_YEAR+"&type="+type;
	});
	
	$(".dbclick").dblclick(function(){
	    var id = $(this).attr("id");
	    id ="#" + id + " .STYLE19";
	    var val = $($($(id)[5]).children()[0]).attr("attr-val");
	    var akb020 = $($($(id)[1]).children()[0]).attr("attr-val");
	    var year = $($($(id)[6]).children()[0]).attr("attr-val");
	    if (val == '1') {
	    	 $.ajax({
		      	    url:"<%=basePath%>servlet/FindProtocolPersonServlet?temptime="+Math.random(),
		      	    data:{
		      	    	"akb020":akb020,
		      	    	"year":year
		      	    },  
		      	    type:'GET',
		      	    cache:false, 
		      	    dataType:'text',
		      	    success:function(result) {
		      	    	if (result != null) {
		      	    		SimplePop.print(result,
									  {
								  		type: "print",
								  		title: "签订协议人员基本信息",
								  		opacity: 0.2,
								  		cancel: function(){
						                  
						              },
						              confirm: function(){
						              	
						              }
									  });
		      	    	}
		      	  	
		      	    },
		      	    error : function() {
		      	    	
		      	    }
		      	});
	    
	    }
	  });
});
</script>
<script type="text/javascript" src="<%=basePath%>js/page.js"></script>
</head>

<body>
<form action="<%=basePath %>servlet/UserManagerServlet" method="post" id="sform">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="24" bgcolor="#C3D7DA"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="3%" height="19" valign="bottom"><div align="center"><img src="<%=basePath %>images/tb.gif" width="14" height="14" /></div></td>
                <td width="94%" valign="bottom"><span class="STYLE1"><a href="<%=basePath%>right.jsp"><strong>系统首页</strong></a>--><font style="font-weight: normal;">甲方信息管理</font></span></td>
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
		甲方信息列表
 		</td>
      </tr>
     <tr>
        <td height="40" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left;" colspan="2">
          <div style="width: 95%;height:65%;float: left;padding:0px 0px 10px 30px;"> 
			 <div style="width:20%;height:100%;float: left;padding-top: 15px;">
			 	医院编号：<input type="text" id="akb020" name="akb020" value="${akb020}" style="width: 150px;"/>
			 </div>
			 <div style="width:20%;height:100%;float: left;margin-left: 5px;padding-top: 15px;">
			 	医院名称：<input type="text" id="akb021" name="akb021" value="${akb021}" style="width: 150px;"/>
			 </div>
			 <div style="width:20%;height:100%;float: left;margin-left: 5px;padding-top: 15px;">
			 	网签年份：<input type="text" id="WQ_YEAR" name="WQ_YEAR" value="${WQ_YEAR}" style="width: 150px;"/>
			 </div>
			 <div style="width:20%;height:100%;float: left;margin-left: 5px;padding-top: 15px;">
			 	协议状态：<select id="type" name="type" style="width: 150px;">
			  		 <option value="0" >====请选择类别====</option>
			  		 <c:choose>
					    <c:when test="${type==1}"> 
					    	<option value="1" selected="selected">已签订</option>
					    </c:when>
					    <c:otherwise>  
					  	    <option value="1">已签订</option>
					    </c:otherwise>
					 </c:choose>
					 <c:choose>
					    <c:when test="${type==2}"> 
					    	<option value="2" selected="selected">未签订</option>
					    </c:when>
					    <c:otherwise>  
					  	    <option value="2">未签订</option>
					    </c:otherwise>
					 </c:choose>
			  	</select>
			 </div>
			 <div style="width:15%;height:10%;float: left;margin-left: 5px;padding-top: 15px;">
			 	
			 	<div style="width:5%;height:100%;float: left;margin-left: 5px;">
			 		<input type="submit" value="查询"/><p/>
			 	</div>
			 	<div style="width:5%;height:100%;float: left;margin-left: 50px;">
			 		<input id ="export" type="button" value="导出"/><p/>
			 	</div>
			 </div>
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
        <td width="5%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">序号</span></div></td>
        <td width="7%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">用户编号</span></div></td>
        <td width="7%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">密码</span></div></td>
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">医疗机构类型</span></div></td>
        <td width="25%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">医疗机构名称</span></div></td>
        <td width="7%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">签订状态</span></div></td>
        <td width="7%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">签约年份</span></div></td>
        <td width="7%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">登录次数</span></div></td>
        <td width="15%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">最后登录时间</span></div></td>
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">最后登录IP</span></div></td>
      </tr>
      <c:forEach items="${page.list}" var="p" varStatus="status">
		    <tr class="dbclick" onmouseover="moves('${status.index+1}')" onmouseout="outs('${status.index+1}')" id="t${status.index+1}" <c:if test="${p.wq_valid==1}">bgcolor="#98F5FF"</c:if> >
		        <td height="20" <c:if test="${p.wq_valid!=1}">bgcolor="#FFFFFF"</c:if> ><div align="center">
					<input type="checkbox" name="cid"   value="${ status.index + 1}"/>
		        </div></td>
		        <td height="20" <c:if test="${p.wq_valid!=1}">bgcolor="#FFFFFF"</c:if> class="STYLE19"><div align="center">${ status.index + 1}</div></td>
		         <td height="20" <c:if test="${p.wq_valid!=1}">bgcolor="#FFFFFF"</c:if> class="STYLE19"><div align="center" attr-val="${p.name}">${p.name}</div></td>
		         <td height="20" <c:if test="${p.wq_valid!=1}">bgcolor="#FFFFFF"</c:if> class="STYLE19">
		        	<div align="center" style="line-height: 25px;">
						${p.password }
					</div>
				</td>
		        <td height="20" <c:if test="${p.wq_valid!=1}">bgcolor="#FFFFFF"</c:if> class="STYLE19">
		       		<div align="center">
			       		<c:choose>
						    <c:when test="${p.uflag==1}"> 
						    	医院
						    </c:when>
						    <c:otherwise>  
						  	   	 药店
						    </c:otherwise>
						 </c:choose>
		       		</div>
		        </td>
		        
				<td height="20" <c:if test="${p.wq_valid!=1}">bgcolor="#FFFFFF"</c:if> class="STYLE19">
		        	<div align="center" style="line-height: 25px;">
		        	    ${p.akb021 }
					</div>
				</td>
				 <td height="20" <c:if test="${p.wq_valid!=1}">bgcolor="#FFFFFF"</c:if> class="STYLE19">
		       		<div align="center" attr-val="${p.wq_valid}">
			       		<c:choose>
						    <c:when test="${p.wq_valid==1}"> 
						    	已签订
						    </c:when>
						    <c:otherwise>  
						  	   	 未签订
						    </c:otherwise>
						 </c:choose>
		       		</div>
		        </td>
		         <td height="20" <c:if test="${p.wq_valid!=1}">bgcolor="#FFFFFF"</c:if> class="STYLE19">
		        	<div align="center" attr-val="${p.wq_year}">
		        		${p.wq_year }
		        	</div>
		        </td>
		        <td height="20" <c:if test="${p.wq_valid!=1}">bgcolor="#FFFFFF"</c:if> class="STYLE19">
		        	<div align="center">
		        		${p.times }
		        	</div>
		        </td>
		        <td height="20" <c:if test="${p.wq_valid!=1}">bgcolor="#FFFFFF"</c:if> class="STYLE19">
		        	<div align="center">
		        		${p.enddate }
		        	</div>
		        </td>
		        <td height="20" <c:if test="${p.wq_valid!=1}">bgcolor="#FFFFFF"</c:if> class="STYLE19">
		        	<div align="center">
		        		${p.ip }
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
            <td width="49"><div align="center"><a href="<%=basePath %>servlet/UserManagerServlet?page=1&akb020=${akb020}&akb021=${akb021}&WQ_YEAR=${WQ_YEAR}&type=${type}" style="cursor:hand" id="begin"><img src="<%=basePath %>images/main_54.gif" width="40" height="15" /></a></div></td>
            <td width="49"><div align="center"><a <c:if test="${page.current!=1}">href="<%=basePath %>servlet/UserManagerServlet?page=${page.current-1}&akb020=${akb020}&akb021=${akb021}&WQ_YEAR=${WQ_YEAR}&type=${type}"</c:if>  style="cursor:hand" id="before"><img src="<%=basePath %>images/main_56.gif" width="45" height="15" /></a></div></td>
            <td width="49"><div align="center"><a href="<%=basePath %>servlet/UserManagerServlet?page=${page.current+1}&akb020=${akb020}&akb021=${akb021}&WQ_YEAR=${WQ_YEAR}&type=${type}" style="cursor:hand" id="next"><img src="<%=basePath %>images/main_58.gif" width="45" height="15" /></a></div></td>
            <td width="49"><div align="center"><a href="<%=basePath %>servlet/UserManagerServlet?page=${page.count}&akb020=${akb020}&akb021=${akb021}&WQ_YEAR=${WQ_YEAR}&type=${type}" style="cursor:hand" id="end"><img src="<%=basePath %>images/main_60.gif" width="40" height="15" /></a></div></td>
            <td width="37" class="STYLE22"><div align="center">转到</div></td>
            <td width="22"><div align="center">
              <input type="text" name="topg" id="topg"  style="width:25px; height:14px; font-size:12px; border:solid 1px #7aaebd;"/>
            </div></td>
            <td width="22" class="STYLE22"><div align="center">页</div></td>
            <td width="35"><a style="cursor:hand" id="mto"><img src="<%=basePath%>images/main_62.gif" width="26" height="15" /></a></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
</form>
</body>
</html>

