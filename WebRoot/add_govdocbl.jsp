<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>白山市人民政府办公室公文处理单（文件办理）</title>
<style type="text/css">
body{font-weight: bold;margin-left: 3px;
	margin-top: 0px;
	margin-right: 3px;
	margin-bottom: 0px;}
.l{ float:left;}
.r{ float:right;}
.c{ clear:both;}
.dis{ border:1px solid #F00;}
.fatdiv{ width:750px; margin:0px auto;}
.title{ width:750px; text-align:center; font-size:32px; font-family:"华文中宋"; font-weight:900;}
.st{ width:740px; border: #000 double; height: 0px; border-width: 0px 0px 3px;letter-spacing:5px; }
.st span{ font-family:"隶书"; font-weight:normal; font-size:25px;}
.tbody{ width:750px;   margin:0px auto; margin-top:8px; overflow:hidden;}
.tablea{ border:2px solid #ADD2DA; text-align:center; font-family:"宋体"}
.tablea td{ border:1px solid #ADD2DA;}
.nl{ border:0px; border-bottom:1px dotted #000;}
.STYLE1 {
	color:#3B6375;
	font-size: 12px;
}
.STYLE1 a{ color: #204155;text-decoration: none;}
.STYLE1 a:hover{ color: #f60;text-decoration:underline;}
.STYLE6 {color: #000000; font-size: 12; }
.STYLE10 {color: #000000; font-size: 12px; margin-left: 8px;line-height: 25px;}
.STYLE19 {
	color: #344b50;
	font-size: 12px;
}
.STYLE21 {
	font-size: 12px;
	color: #3b6375;
}
.STYLE22 {
	font-size: 12px;
	color: #295568;
}
</style>
<script type="text/javascript" src="<%=basePath%>plugin/cal/jscal2.js"></script>
<script type="text/javascript" src="<%=basePath%>plugin/cal/lang/cn.js"></script>
<link rel="stylesheet" type="text/css" href="<%=basePath%>plugin/cal/css/jscal2.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>plugin/cal/css/border-radius.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>plugin/cal/css/gold/gold.css" />
<script type="text/javascript" src="<%=basePath %>plugin/jquery/jquery-1.6.2.js"></script>
<script type="text/javascript" src="<%=basePath %>plugin/prompt/ymPrompt.js"></script>
<script type="text/javascript" src="<%=basePath %>plugin/jquery/jquery.form.js"></script>
<link rel="stylesheet" type="text/css" href="<%=basePath %>plugin/prompt/skin/dmm-green/ymPrompt.css"/>

	<script language="javascript">
	function subs(){
	   if($("[name='lwdw']").val()==""){
	   		ymPrompt.errorInfo({title:'错误提示：',message:'来文单位不能为空!'});
	   		return false;
	   }else if($("[name='fwrq']").val()==""){
	   		ymPrompt.errorInfo({title:'错误提示：',message:'发文日期不能为空!'});
	   		return false;
	   }else if($("[name='fwh']").val()==""){
	   		ymPrompt.errorInfo({title:'错误提示：',message:'发文号不能为空!'});
	   		return false;
	   }else if($("[name='swrq']").val()==""){
	   	   ymPrompt.errorInfo({title:'错误提示：',message:'收文日期不能为空!'});
	   		return false;
	   }else if($("[name='swh']").val()==""){
	   	   ymPrompt.errorInfo({title:'错误提示：',message:'收文号不能为空!'});
	   		return false;
	   }else if($("[name='fs']").val()==""){
	   	   ymPrompt.errorInfo({title:'错误提示：',message:'份数不能为空!'});
	   		return false;
	   }else if($("[name='wjbt']").val()==""){
	   	   ymPrompt.errorInfo({title:'错误提示：',message:'文件标题不能为空!'});
	   		return false;
	   }else{
	   		return true;
	   }
	}
	<%
		if(request.getParameter("cg")!=null){%>
			ymPrompt.succeedInfo({message:'操作成功！！',title:'选择操作',width:300,height:180,handler:sel,btn:[['处理单添加','yes'],['处理单管理','no']]});
	<%  }	%>
	function sel(sl){
		if(sl=='no'){
			window.open("<%=basePath%>selgovdocbl.do?page=1&?t=<%=new Date()%>","_self");
		}
	}
	</script>
</head>

<body>
<form action="<%=basePath %>util/addbean.jsp" method="post">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="24" bgcolor="#C3D7DA"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="2%" height="25" ><div align="center" ><img src="<%=basePath%>images/tb.gif" width="14" height="14" /></div></td>
                <td width="99%"  ><span class="STYLE1"> <a href="<%=basePath%>right.jsp">系统首页</a>--><font style="font-weight: normal;">政府公文处理单(文件办理)填写</font></span></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
  <td>
<div class="fatdiv">
    <div class="title"><span class="st">白山市人民政府公文处理单<span>（文件办理）</span></span></div>
    <div class="tbody">
<table width="748" border="1px" cellspacing="0px" style="border-collapse:collapse; font-weight: normal;" class="tablea" >
         <tr>
           <td width="94" height="34">来文单位</td>
           <td width="150"><input type="text" class="nl" name="lwdw" style="width:150px;"/></td>
           <td width="79">发文日期</td>
           <td width="95"><input type="text" class="nl" name="fwrq" style="width:95px;" id="fwrq" readonly="readonly"/></td>
           <td width="66">发文号</td>
           <td colspan="3"><input type="text" class="nl" name="fwh" style=" width:220px;"/></td>
         </tr>
         <tr>
           <td height="33" style="letter-spacing:5px; ">密 级</td>
           <td><input type="text" class="nl" style="width:150px;" name="mj"/></td>
           <td>收文日期</td>
           <td><input type="text" class="nl" name="swrq" style="width:95px;" id="swrq" readonly="readonly"/></td>
           <td>收文号</td>
           <td width="87"><input type="text" class="nl" name="swh" style="width:80px;"/></td>
           <td width="83">份数</td>
           <td width="48"><input type="text" class="nl" name="fs" style="width:48px;"/></td>
         </tr>
         <tr>
           <td height="78" width="94" style="letter-spacing:5px; "><p>文 件</p>
           <p>标 题</p></td>
           <td colspan="7" width="660" style="font-size:24px; font-weight:bold;  font-family:"楷体";" valign="center">
           	  <input type="text" class="nl" style="width:545px;" name="wjbt"/>
           </td>
         </tr>
         <tr>
           <td height="299"><p>市</p>
           <p>政</p>
           <p>府</p>
           <p>领</p>
           <p>导</p>
           <p>批</p>
           <p>示</p></td>
           <td colspan="7">
            <textarea name="szfldps" style="width:545px; height:250px; overflow-y:hidden ; border:1px dotted #000;" ></textarea>
           </td>
         </tr>
         <tr>
           <td style="letter-spacing:5px; "><p>办公室</p>
           <p>领导意见</p></td>
           <td colspan="7">
            <textarea  name="bgsldyj" style="width:545px;height: 70px;border: 1px dotted #000; overflow-y:hidden ;"></textarea>
           </td>
         </tr>
         <tr>
           <td style="letter-spacing:5px; "><p>文电科</p>
           <p>拟办意见</p></td>
           <td colspan="7">
           	<textarea name="wdknbyj" style="width:545px;height: 70px;border: 1px dotted #000; overflow-y:hidden ;"></textarea>
           </td>
         </tr>
         <tr>
           <td rowspan="3" style="letter-spacing:5px; "><p>转 办</p>
           <p>去 向</p></td>
           <td colspan="2"  style="text-align:left;"><input type="text" class="nl" name="zbtit1" style="width:200px;"/></td>
           <td colspan="5"  style="text-align:left;"><input type="text" class="nl" name="zbbody1" style="width:350px;" /></td>
         </tr>
         <tr style="text-align:left;">
           <td colspan="2"><input type="text" class="nl" style="width:200px;" name="zbtit2"/></td>
           <td colspan="5"><input type="text" class="nl" style="width:350px;" name="zbbody2" /></td>
         </tr>
         <tr  style="text-align:left;">
           <td colspan="2"><input type="text" class="nl" style="width:200px;" name="zbtit3"/></td>
           <td colspan="5"><input type="text" class="nl" style="width:350px;" name="zbbody3" /></td>
         </tr>
      </table>
    </div>
    
  </div>
  </td>
  </tr>
  </table>
  <div style="width: 748px; margin: 0px auto; text-align: right;">
  	<%
  			Date d = new Date();
			java.text.SimpleDateFormat sf = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
			String code = sf.format(d); //条形码内容
			StringBuffer barCode = new StringBuffer();
			barCode.append("<img src='");
			barCode.append(request.getContextPath());
			barCode.append("/CreateBarCode?code=");
			barCode.append(code+"\r");
			barCode.append("&barType=CODE128&checkCharacter=n&checkCharacterInText=n'>");
			out.println(barCode.toString());
  	
  	 %>
  </div>
  <div style="width: 748px; margin: 0px auto; text-align: center;">
  	<input type="submit" onclick="return subs()" value="添加记录" style="width: 120px;height: 30px; background-color: #ADD2DA;font-weight: bold;color: #204155;"/>
  </div>
  <script type="text/javascript"> 

      var cal = Calendar.setup({
          onSelect: function(cal) { cal.hide() },
          showTime: true
      });
      cal.manageFields("fwrq", "fwrq", "%Y-%m-%d");
      cal.manageFields("swrq", "swrq", "%Y-%m-%d");
      cal.manageFields("f_btn2", "f_date2", "%b %e, %Y");
      cal.manageFields("f_btn3", "f_date3", "%e %B %Y");
      cal.manageFields("f_btn4", "f_date4", "%A, %e %B, %Y");

     </script>
     <input type="hidden" name="url" value="../addGovdocBl.do"/>
     <input type="hidden" name="barcode" value="<%=code %>"/>
 </form>
</body>
 
</html>
