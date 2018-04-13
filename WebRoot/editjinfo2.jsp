<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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
.STYLE6 li{ list-style: none; float: left;width: 100%;margin-bottom: 5px;}
-->
ul,li{padding: 0px;margin: 0px; border: 0px;}
.otr td{background-color: #D3EAEF;}
.notr td{background-color: #ffffff;}
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
</script>
<script type="text/javascript" src="<%=basePath%>js/page.js"></script>
</head>

<body>
<form action="<%=basePath %>course/SelCourse.do" method="post" id="sform">
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
		修改甲方信息列表
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
        <td width="20%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">甲方名称</span></div></td>
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">医院&药店</span></div></td>
        <td width="5%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">法人</span></div></td>
        <td width="15%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">地址</span></div></td>
        <td width="5%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">邮编</span></div></td>
        <td width="30%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">联系电话</span></div></td>
        <td width="15%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">操作</span></div></td>
      </tr>
    </table></td>
  </tr>
</table>
</form>
</body>
</html>

