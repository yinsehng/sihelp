<%@ page language="java" import="java.util.*,com.neusoft.bean.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
User u=(User)session.getAttribute("user");
%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>哈尔滨网签系统</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE3 {
	font-size: 12px;
	color: #435255;
}
.STYLE4 {font-size: 12px; color: #204155;}
.STYLE5 {font-size: 12px; font-weight: bold; color: #204155; }
.hd{display: none;}
.f{cursor:pointer;}
.unline a{text-decoration: none; color: #204155;  }
-->
</style>
<script type="text/javascript" src="<%=basePath%>plugin/jquery/jquery-1.6.2.js"></script>
<script type="text/javascript">
 function dis(id){
    for(var i=0;i<3;i++){
    	if(id==i){
    		$("#di"+id).show();
    		$("#m"+id).css({ "font-weight": "bold"});
    	}else{
    		$("#di"+i).hide();
    		$("#m"+i).css({ "font-weight": "normal"});
    	}
    }
 }
 $(function(){
	 $("#di3").show();
	 $("#m3").css({ "font-weight": "bold"}); 
 });
 function block(){
	   var i=window.showModalDialog('admin/upduser.jsp','修改密码','dialogWidth:400px;dialogHeight:208px;center:yes;help:no;resizable:no;status:no');
	}
function unopen(){
	alert("尚未开通！！！");
}
</script>

</head>

<body> 
<table width="147" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <% if (u.getType()!=1) {
	  %>
	
	   <tr class="f" onclick="dis('3')">
	    <td height="23" background="<%=basePath%>images/main_34.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
	      <tr>
	        <td width="9%">&nbsp;</td>
	        <td width="83%"><div align="center" class="STYLE5" id="m">网签协议</div></td>
	        <td width="8%">&nbsp;</td>
	      </tr>
	    </table></td>
	  </tr>
		  <tr id="di3" class="hd unline">
	    <td valign="top"><div align="center">
	      <table width="82%" border="0" align="center" cellpadding="0" cellspacing="0">
	    
	        <tr>
	          <td height="38"><table width="100%" border="0" cellspacing="0" cellpadding="0">
	            <tr>
	              <td width="33" height="28"><img src="<%=basePath%>images/main_48.gif" width="28" height="28"></td>
	              <td width="99"><table width="100%" border="0" cellspacing="0" cellpadding="0">
	                  <tr>
	                    <td height="23" class="STYLE4" style="cursor:hand" onMouseOver="this.style.backgroundImage='url(<%=basePath%>images/tab_bg.gif)';this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><a href="<%=basePath%>servlet/SelProtocolServlet" target="cent">网签协议</a></td>
	                  </tr>
	              </table></td>
	            </tr>
	          </table></td>
	        </tr>
	        
	        <tr>
	          <td height="38"><table width="100%" border="0" cellspacing="0" cellpadding="0">
	            
	          </table></td>
	        </tr>
	        
	         <tr>
	          <td height="38"><table width="100%" border="0" cellspacing="0" cellpadding="0">
	            
	          </table></td>
	        </tr>
	   
	   
	  <%
  } %>
	 
	
	  <%if(u.getType()==1){
		  %>
		  <tr class="f" onclick="dis('3')">
	    <td height="23" background="<%=basePath%>images/main_34.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
	      <tr>
	        <td width="9%">&nbsp;</td>
	        <td width="83%"><div align="center" class="STYLE5" id="m">系统管理</div></td>
	        <td width="8%">&nbsp;</td>
	      </tr>
	    </table></td>
	  </tr>
		  <tr id="di3" class="hd unline">
	    <td valign="top"><div align="center">
	      <table width="82%" border="0" align="center" cellpadding="0" cellspacing="0">
	    
	        <tr>
	          <td height="38"><table width="100%" border="0" cellspacing="0" cellpadding="0">
	            <tr>
	              <td width="33" height="28"><img src="<%=basePath%>images/main_48.gif" width="28" height="28"></td>
	              <td width="99"><table width="100%" border="0" cellspacing="0" cellpadding="0">
	                  <tr>
	                    <td height="23" class="STYLE4" style="cursor:hand" onMouseOver="this.style.backgroundImage='url(<%=basePath%>images/tab_bg.gif)';this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><a href="<%=basePath%>servlet/JInfoMangerServlet" target="cent">甲方信息管理</a></td>
	                  </tr>
	              </table></td>
	            </tr>
	          </table></td>
	        </tr>
	        
	        <tr>
	          <td height="38"><table width="100%" border="0" cellspacing="0" cellpadding="0">
	            <tr>
	              <td width="33" height="28"><img src="<%=basePath%>images/main_40.gif" width="28" height="28"></td>
	              <td width="99"><table width="100%" border="0" cellspacing="0" cellpadding="0">
	                  <tr>
	                    <td height="23" class="STYLE4" style="cursor:hand" onMouseOver="this.style.backgroundImage='url(<%=basePath%>images/tab_bg.gif)';this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><a href="<%=basePath%>servlet/ProtocolManageServlet" target="cent">网签协议管理</a></td>
	                  </tr>
	              </table></td>
	            </tr>
	          </table></td>
	        </tr>
	        
	         <tr>
	          <td height="38"><table width="100%" border="0" cellspacing="0" cellpadding="0">
	            <tr>
	              <td width="33" height="28"><img src="<%=basePath%>images/main_50.gif" width="28" height="28"></td>
	              <td width="99"><table width="100%" border="0" cellspacing="0" cellpadding="0">
	                  <tr>
	                    <td height="23" class="STYLE4" style="cursor:hand" onMouseOver="this.style.backgroundImage='url(<%=basePath%>images/tab_bg.gif)';this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><a href="<%=basePath%>servlet/ProtocolCountServlet" target="cent">网签协议统计</a></td>
	                  </tr>
	              </table></td>
	            </tr>
	          </table></td>
	        </tr>
	        <%} %>
	      </table>
	    </div></td>
	  </tr> 
	  
  <tr>
    <td height="19" background="<%=basePath%>images/main_69.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="24%">&nbsp;</td>
        <td width="76%" valign="bottom"><span class="STYLE3">版本：2017 v1.0</span></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>

