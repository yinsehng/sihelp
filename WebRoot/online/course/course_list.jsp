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
                <td width="94%" valign="bottom"><span class="STYLE1"><a href="<%=basePath%>right.jsp"><strong>系统首页</strong></a>--><font style="font-weight: normal;">培训课程查询</font></span></td>
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
		培训课程列表
 		</td>
 		 <td bgcolor="#d3eaef" ><div align="right"><span class="STYLE1">
              <input type="checkbox" name="allt"  />
              全选      &nbsp;&nbsp;<img src="<%=basePath %>images/add.gif" width="10" height="10" /> <a href="<%=basePath %>online/course/course.jsp">添加</a>&nbsp;&nbsp;
              <img src="<%=basePath %>images/del.gif" width="10" height="10" /> <a id="del" style="cursor: pointer;">批量删除</a>   &nbsp;  &nbsp;
              </span></div></td>
      </tr>
      <tr>
        <td height="80" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left;" colspan="2">
          <div style="width: 30%;float: left;padding:10px 0px 10px 30px;"> 
			<ul>
			  <li>课程类别：<select name="type">
			  		 <option value="0">==选择类别==</option>
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
			  </li>
			  <li>课程名称：<input type="text" name="cname" value="${param.cname }"/></li>
			  <li>是否可见：<select name="aae100">
			  		 <option value="2">==选择==</option>
					 <c:choose>
					    <c:when test="${param.aae100==1}"> 
					    	<option value="1" selected="selected">可见</option>
					    </c:when>
					    <c:otherwise>  
					  	    <option value="1">可见</option>
					    </c:otherwise>
					 </c:choose>
					 <c:choose>
					    <c:when test="${param.aae100==0}"> 
					    	<option value="0" selected="selected">不可见</option>
					    </c:when>
					    <c:otherwise>  
					  	    <option value="0">不可见</option>
					    </c:otherwise>
					 </c:choose>
			  	</select></li>
			</ul>
		   </div>
		   <div style="width: 30%;float: left; margin-top: 10px;"> 
		     <div style="float: left;width: 20%">
		       <input type="submit" value="查询"/><p/>
		       <input type="reset" value="重置"/><p/>
		     </div>
		     <div style="float: left;margin-left: 5px;width: 75%">
		     	<strong>说明：</strong><font color="black">课程类别：1.医院收费端，2.药店收费端<br/><font style="color: red">如需新增请点击右上方添加按钮</font></font>
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
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">课程名称</span></div></td>
        <td width="5%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">课程类别</span></div></td>
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">培训时间</span></div></td>
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">培训定点</span></div></td>
        <td width="5%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">可参加人数</span></div></td>
        <td width="5%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">已参加人数</span></div></td>
         <td width="15%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">培训地点</span></div></td>
         <td width="5%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">是否可见</span></div></td>
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">经办日期</span></div></td>
        <td width="25%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">操作</span></div></td>
      </tr>
      <c:forEach items="${page.list}" var="p">
		    <tr onmouseover="moves('${p.id }')" onmouseout="outs('${p.id }')" id="t_${p.id }" >
		        <td height="20" bgcolor="#FFFFFF"><div align="center">
					<input type="checkbox" name="cid"   value="${p.id }"/>
		        </div></td>
		         <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><strong>${p.cname}</strong></div></td>
		        <td height="20" bgcolor="#FFFFFF" class="STYLE19">
		       		<div align="center">
			       		<c:choose>
						    <c:when test="${p.type==1}"> 
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
						${p.begindate }
					</div>
				</td>
				<td height="20" bgcolor="#FFFFFF" class="STYLE19">
		        	<div align="center" style="line-height: 25px;">
						<c:if test="${p.kb01type==1 }">所有定点</c:if>
						<c:if test="${p.kb01type==0 }">
							<a href="#" onclick="showkb01('${p.id}')">查看定点</a>
						</c:if>
					</div>
				</td>
		        <td height="20" bgcolor="#FFFFFF" class="STYLE19">
		        	<div align="center">
		        		${p.num_a }
		        	</div>
		        </td>
		        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">${p.num_b }</div></td>
		        <td height="20" bgcolor="#FFFFFF" class="STYLE19">
		        	<div align="center">
		        		${p.address }
		        	</div>
		        </td>
		         <td height="20" bgcolor="#FFFFFF" class="STYLE19">
		        	<div align="center">
		        		<c:if test="${p.aae100==1 }">可见</c:if>
		        		<c:if test="${p.aae100==0 }">不可见</c:if>
		        	</div>
		        </td>
		        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">${p.aae036 }</div></td>
		        <td height="20" bgcolor="#FFFFFF" class="STYLE19">
		        	<div align="center">
				        <input type="button" value="修改信息" onclick="javascript:window.open('<%=basePath %>course/SelCourseForUpd.do?pid=${p.id }', '_self')"/>&nbsp;&nbsp;
				        <input type="button" value="查看人员信息" style="margin: 2px;" onclick="javascript:window.open('<%=basePath %>oper/SelOperatorAdmin.do?cid=${p.id }', '_self')"/>&nbsp;&nbsp;
				    	<input type="button" value="删除信息" onclick="delonly('${p.id}')"/>
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

