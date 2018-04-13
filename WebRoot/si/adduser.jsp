<%@ page language="java" import="java.util.*,com.neusoft.bean.*,com.neusoft.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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

<script type="text/javascript" src="<%=basePath %>plugin/jquery/jquery-1.6.2.js"></script>
<script type="text/javascript" src="<%=basePath %>plugin/prompt/ymPrompt.js"></script>
<script type="text/javascript" src="<%=basePath %>plugin/jquery/jquery.form.js"></script>
<link rel="stylesheet" type="text/css" href="<%=basePath %>plugin/prompt/skin/dmm-green/ymPrompt.css"/>
<script language="javascript">
function moves(id){
	document.getElementById("t_"+id).className='otr';
}
function outs(id){
	document.getElementById("t_"+id).className='Notr';
}

function actionClear(){
	ymPrompt.confirmInfo({title:'信息提示',message:'确认是否清除一个登录点？',handler:handler});
}
function handler(key){
	if(key=='ok'){
		window.open('<%=basePath%>servlet/ClearKc33Servlet?t='+Math.random(),'_self');
	}
}





$(function(){
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

function openall(){
	if($("[name='cid']:checked").length<1){
		ymPrompt.errorInfo({title:'错误提示：',message:'请选择至少一条记录!'});
		return;
	}else{
		
	}
}

function opens(akb020){
	ymPrompt.win({message:$('#txt').html(),title:'选择操作项目',width:300,height:180,handler:testHd,btn:[['清除登录','1,'+akb020+''],['修改传输','3,'+akb020+''],['处理对照','2,'+akb020+'']]});
}

function testHd(tp){
	if(tp!='close'){
		$.ajax({
			url:"<%=basePath%>exec.action?al="+tp+"&t="+new Date(),
			dataType:"json",
			type:"post",
			success:function(t){
				if(t.error=='0'){
					ymPrompt.succeedInfo({title:'信息提示：',message:t.success});
				}else{
					ymPrompt.errorInfo({title:'错误提示：',message:t.error});
				}
			}
		 });
	 }
}

</script>
<script type="text/javascript" src="<%=basePath%>js/page.js"></script>
<%
Message mes=(Message)request.getAttribute("mes");
Message successmes=(Message)request.getAttribute("successmes"); 
User u=(User)session.getAttribute("user"); 
%>
<%if(mes!=null){%>
   <script type="text/javascript">
   		ymPrompt.errorInfo({title:'错误提示：',message:'<%=mes.getMessage() %>'});
   </script>
<%} %>
<%if(successmes!=null){%>
   <script type="text/javascript">
   		ymPrompt.succeedInfo({title:'信息提示：',message:'<%=successmes.getMessage() %>'});
   </script>
<%} %>
</head>

<body>
<div style="display: none;" id="txt">
	 <span style="line-height: 25px;margin-top: 10px;">
    <strong>操作说明：</strong>
    <br/>
  	1.清除登录：清除用户登录点数。<br/>
	2.修改传输：修改传输时间间隔。<br/>
	3.处理对照：处理无法对照，甲乙丙类等级出错等。
	</span>
</div>
<form action="<%=basePath %>servlet/AddUser" method="post" id="sform">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="24" bgcolor="#C3D7DA"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="3%" height="19" valign="bottom"><div align="center"><img src="<%=basePath %>images/tb.gif" width="14" height="14" /></div></td>
                <td width="94%" valign="bottom"><span class="STYLE1"><a href="<%=basePath%>right.jsp"><strong>系统首页</strong></a>--><font style="font-weight: normal;">管理员问题处理</font></span></td>
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
		查询定点信息
 		</td>
       <td bgcolor="#d3eaef" ><div align="right"><span class="STYLE1">
              <input type="checkbox" name="allt"  />
              全选      &nbsp;&nbsp;<img src="<%=basePath %>images/edit.gif" width="10" height="10" /> <a style="cursor: pointer;" onclick="openall()">批量操作</a>   &nbsp;</span><span class="STYLE1"> &nbsp;</span></div></td>
       
      </tr>
      <tr>
        <td height="80" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left;" colspan="2">
          <div style="width: 30%;float: left;padding:10px 0px 10px 30px;"> 
		   	 <ul>
		   	  <li> 
		   	   ID：<input type="text" class="nl" name="id" style="width:150px;" value="${id }"/><br/>
		   	  </li>
		   	  <li>
		   	   name：<input type="text" class="nl" name="name" style="width:150px;" value="${name }"/>
		   	  </li>
		   	  <li>
		   	   age：<input type="text" class="nl" name="age" style="width:150px;" value="${age }"/>
		   	  </li>
		   	 </ul>
		   </div>
		   <div style="width: 30%;float: left; margin-top: 10px;">
		   	 <input type="submit"  value="新增" style="width: 60px; height: 60px;"/>
		   </div>
		   <div style="width: 30%;float: left; margin-top: 10px;"> 
		     <div style="float: left;width: 20%">
		     </div>
		     <div style="float: left;margin-left: 5px;width: 75%;font-size: 14px;line-height: 21px;">
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
      	<td width="4%" height="20" bgcolor="d3eaef" class="STYLE10"><div align="center">
          <input type="checkbox" name="all" title="点击反选"/>
        </div></td>
        <td width="5%" height="25" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">编号</span></div></td>
        <td width="15%" height="25" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">机构名称</span></div></td>
        <td width="5%" height="25" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">联系人</span></div></td>
        <td width="7%" height="25" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">联系电话</span></div></td>
        <td width="15%" height="25" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">联系地址</span></div></td>
        <td width="10%" height="25" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">服务标志</span></div></td>
        <td width="5%" height="25" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">操作</span></div></td>
      </tr>
        	
        	<tr onmouseover="moves('')" onmouseout="outs('')" id="t_" >
        		<td height="20" bgcolor="#FFFFFF"><div align="center">
	              <input type="checkbox" name="cid"   value=""/>
		        </div></td>
		        <td height="22" bgcolor="#FFFFFF" class="STYLE19"><div align="center">1 </div></td>
		        <td height="22" bgcolor="#FFFFFF" class="STYLE19"><div align="center">2 </div></td>
		        <td height="22" bgcolor="#FFFFFF" class="STYLE19"><div align="center">3</div></td>
		        <td height="22" bgcolor="#FFFFFF" class="STYLE19"><div align="center">4</div></td>
		        <td height="22" bgcolor="#FFFFFF" class="STYLE19"><div align="center">5</div></td>
		        <td height="22" bgcolor="#FFFFFF" class="STYLE19"><div align="center">6</div></td>
		        <td height="22" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><input type="button" onclick="opens('1')" value="操作" style="width: 35px; height: 18px;font-size: 10px;border: 1px solid #a8c7ce;color: #204155;text-align: center;"/></div></td>
		    </tr>
        	
    </table></td>
  </tr>
 <tr>
 	<%
 	String count=(String)request.getAttribute("count");
 	String current=(String)request.getAttribute("current");
 	String per=(String)request.getAttribute("per");
 	%>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="33%">
         <div align="left">
          <span class="STYLE22">&nbsp;&nbsp;&nbsp;&nbsp;共 <strong><%=count %></strong> 页，当前第<strong><%=current %></strong> 页，每页 <strong><%=per %></strong> 条记录</span>
          <input type="hidden" name="_count" value="<%=count %>" />
		  <input type="hidden" name="_current" value="<%=current %>" />
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
              <input type="text" name="topg" id="topg"  style="width:20px; height:12px; font-size:12px; border:solid 1px #7aaebd;"/>
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

