<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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
    	$("form").attr("action", "<%=basePath%>oper/DelOperator.do?ids="+str);
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
    	$("form").attr("action", "<%=basePath%>oper/DelOperator.do?ids="+delid);
  		$("form").submit();
    }
}
</script>
<script type="text/javascript" src="<%=basePath%>js/page.js"></script>
</head>

<body>
<form action="<%=basePath %>oper/SelOperator.do" method="post" id="sform">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="24" bgcolor="#C3D7DA"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="3%" height="19" valign="bottom"><div align="center"><img src="<%=basePath %>images/tb.gif" width="14" height="14" /></div></td>
                <td width="94%" valign="bottom"><span class="STYLE1"><a href="<%=basePath%>right.jsp"><strong>系统首页</strong></a>--><font style="font-weight: normal;">操作员培训报名查询</font></span></td>
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
		操作员培训报名列表
 		</td>
 		 <td bgcolor="#d3eaef" ><div align="right"><span class="STYLE1">
              <input type="checkbox" name="allt"  />
              全选      &nbsp;&nbsp;
              <c:if test="${course.num_a - course.num_b >0}">
              	 <img src="<%=basePath %>images/add.gif" width="10" height="10" /> <a href="<%=basePath %>online/peixun.jsp?cid=${course.id }">添加</a>&nbsp;&nbsp;
              </c:if>
              <img src="<%=basePath %>images/del.gif" width="10" height="10" /> <a id="del" style="cursor: pointer;">批量取消</a>   &nbsp;  &nbsp;
              </span></div></td>
      </tr>
      <tr>
        <td height="80" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left;" colspan="2">
          <div style="width: 30%;float: left;padding:10px 0px 10px 30px;"> 
			<ul>
			  <li>培 训 状态：<select name="flag">
			  		 <option value="0">==选择状态==</option>
					 <c:choose>
					    <c:when test="${param.flag==1}"> 
					    	<option value="1" selected="selected">已报名</option>
					    </c:when>
					    <c:otherwise>  
					  	    <option value="1">已报名</option>
					    </c:otherwise>
					 </c:choose>
					 <c:choose>
					    <c:when test="${param.flag==2}"> 
					    	<option value="2" selected="selected">报名确认</option>
					    </c:when>
					    <c:otherwise>  
					  	    <option value="2">报名确认</option>
					    </c:otherwise>
					 </c:choose>
					 <c:choose>
					    <c:when test="${param.flag==3}"> 
					    	<option value="3" selected="selected">已培训</option>
					    </c:when>
					    <c:otherwise>  
					  	    <option value="3">已培训</option>
					    </c:otherwise>
					 </c:choose>
					 <c:choose>
					    <c:when test="${param.flag==4}"> 
					    	<option value="4" selected="selected">无效报名</option>
					    </c:when>
					    <c:otherwise>  
					  	    <option value="4">无效报名</option>
					    </c:otherwise>
					 </c:choose>
			  	</select>
			  </li>
			  <li>操作员姓名：<input type="text" name="oname" value="${param.oname }"/></li>
			</ul>
		   </div>
		   <div style="width: 30%;float: left; margin-top: 10px;"> 
		     <div style="float: left;width: 20%">
		       <input type="submit" value="查询"/><p/>
		       <input type="reset" value="重置"/><p/>
		     </div>
		     <div style="float: left;margin-left: 5px;width: 75%">
		     	<strong>说明：</strong><font color="black">培训状态：1已报名:可以进行修改和删除，2报名确认：培训方已经确认安排培训不可以删除和修改，3已培训：已参加培训<br/><font style="color: red">如需新增培训人员请点击右上方添加按钮</font></font>
		     </div>
		   </div>
		</td>
      </tr>
     
    </table></td>
  </tr>
  
   <tr><td>&nbsp;</td></tr>
    <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce">
      <tr>
        <td width="70%" height="25" bgcolor="#d3eaef" class="STYLE6" style="text-align: left;padding-left: 5px;font-weight: bold;color: #3B6375;">
		课程信息
 		</td>
 		  
      </tr>
      <tr>
        <td height="40" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left;" colspan="2">
          <div style="width: 100%;float: left;padding:5px 0px 10px 30px;"> 
			<div style="text-align: left;font-size: 18px; color:#f60;margin-bottom: 10px;"><strong>${course.cname }</strong></div>
		    <div>
		     	<strong>培训时间：</strong>${course.begindate},
		     	<strong>培训地点：</strong>${course.address },
		    	<strong> 可参加人数：</strong><span style="color: blue;">${course.num_a }</span>,
		     	<strong> 已参加人数：</strong><span style="color: red;">${course.num_b }</span>
		    </div>
		    <input type="hidden" name="cid" value="${course.id }"/>
		   </div>
		</td>
      </tr>
     
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" >
      <tr>
        <td colspan="10"  height="35" bgcolor="#d3eaef" class="STYLE6" style="text-align: center;padding-left: 5px;font-weight: bold;color: #3B6375;">
		已参加人员列表
 		</td>
 		  
      </tr>
      <tr>
        <td width="5%" height="20" bgcolor="d3eaef" class="STYLE10"><div align="center">
          <input type="checkbox" name="all" title="点击反选"/>
        </div></td>
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">姓名</span></div></td>
        <td width="5%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">性别</span></div></td>
        <td width="5%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">年龄</span></div></td>
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">学历</span></div></td>
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">联系电话</span></div></td>
         <td width="5%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">状态</span></div></td>
         <td width="25%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">审核说明</span></div></td>
        <td width="5%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">添加日期</span></div></td>
        <td width="25%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">操作</span></div></td>
      </tr>
      <c:forEach items="${page.list}" var="p">
		    <tr onmouseover="moves('${p.id }')" onmouseout="outs('${p.id }')" id="t_${p.id }" >
		        <td height="20" bgcolor="#FFFFFF"><div align="center">
		             <c:choose>
					    <c:when test="${p.flag==1}"> 
					    	<input type="checkbox" name="cid"   value="${p.id }"/>
					    </c:when>
					    <c:otherwise>  
					  	    <input type="checkbox" name="cid1"  disabled="disabled" />
					    </c:otherwise>
					 </c:choose>
		        </div></td>
		         <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">${p.name}</div></td>
		        <td height="20" bgcolor="#FFFFFF" class="STYLE19">
		       		<div align="center">
			       		<c:choose>
						    <c:when test="${p.sex==1}"> 
						    	男
						    </c:when>
						    <c:otherwise>  
						  	          女
						    </c:otherwise>
						 </c:choose>
		       		</div>
		        </td>
		        <td height="20" bgcolor="#FFFFFF" class="STYLE19">
		        	<div align="center" style="line-height: 25px;">
						${p.age }岁
					</div>
				</td>
		        <td height="20" bgcolor="#FFFFFF" class="STYLE19">
		        	<div align="center">
		        		<c:if test="${p.xl==1}">小学</c:if>
		        		<c:if test="${p.xl==2}">初中</c:if>
		        		<c:if test="${p.xl==3}">高中</c:if>
		        		<c:if test="${p.xl==4}">大学专科</c:if>
		        		<c:if test="${p.xl==5}">大学本科</c:if>
		        		<c:if test="${p.xl==6}">硕士研究生及以上</c:if>
		        	</div>
		        </td>
		        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">${p.tel }</div></td>
		        <td height="20" bgcolor="#FFFFFF" class="STYLE19">
		        	<div align="center">
		        		<c:if test="${p.flag==1}">已报名</c:if>
		        		<c:if test="${p.flag==2}">报名确认</c:if> 
		        		<c:if test="${p.flag==3}">已培训</c:if> 
		        		<c:if test="${p.flag==4}">无效报名</c:if> 
		        	</div>
		        </td>
		        <td height="20" bgcolor="#FFFFFF" class="STYLE19">
		        	<div align="center">
		        		${p.qxyy }
		        	</div>
		        </td>
		        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">${p.aae036 }</div></td>
		        <td height="20" bgcolor="#FFFFFF" class="STYLE19">
		        	<div align="center">
		        		<c:choose>
						    <c:when test="${p.flag==1}"> 
						        <input type="button" value="修改信息" onclick="javascript:window.open('<%=basePath %>oper/SelOperForUpd.do?pid=${p.id }&cid=${course.id }', '_self')"/>&nbsp;&nbsp;
						    	<input type="button" value="取消报名" onclick="delonly('${p.id}')"/>
						    </c:when>
						    <c:otherwise>  
						        <input type="button" value="修改信息" disabled="disabled"/>&nbsp;&nbsp;
						  	    <input type="button" value="取消报名" disabled="disabled"/>
						    </c:otherwise>
						 </c:choose>
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

