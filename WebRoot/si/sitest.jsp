<%@ page language="java" import="java.util.*,com.neusoft.bean.*,com.neusoft.util.*" pageEncoding="gbk" contentType="text/html; charset=gbk"%>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK" %>
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
 
 
 function submitaction(){
  
	 var cardinfo=$("#cardinfo").val();
	 var inputdata=$("#inputdata").val();
	 var dllparam=$("#dllparam").val();
	 var dllparm=$("#dllparm").val();
	 //alert(cardinfo+ inputdata);
	 if(inputdata==''){
	 	ymPrompt.errorInfo({title:'错误提示：',message:'入参不能为空！！！'});
	 	return;
	 }
	 inputdata=escape(escape(inputdata));
	 ymPrompt.win({message:'<br><center>执行中请稍后......</center>',titleBar:false,width:400,height:50});
	 $.ajax({
			url:"<%=basePath %>servlet/SihelpServlet?cardinfo="+cardinfo+"&inputdata="+inputdata+"&dllparam="+dllparam+"&dllparm="+dllparm+"&t="+new Date(),
			timeout: 100000,
			dataType:"xml",
			type:"post",
			success:function(t){
				var code;
				$(t).find("header").each(function(i){
					code=$(this).children("appCode").text();
				});
				if(code==1){//错误
					ymPrompt.close();
					ymPrompt.errorInfo({title:'错误提示：',message:'执行失败'});
					$(t).find("header").each(function(i){
						code=$(this).children("errorMessage").attr("detailMessage");
						$("#outputdata").empty();
						$("#outputdata").append("<font color=\"red\"><strong>处理错误,错误信息：</strong></font><br/>"+code);
					});
				}else{
					ymPrompt.close();
					ymPrompt.succeedInfo({title:'信息提示：',message:'执行成功'});
					$(t).find("body").find("parameters").find("parameter").each(function(i){
						var parname=$(this).attr("paraName");
						if(parname=="outputData"){
							$("#outputdata").empty();
							$("#outputdata").append("<font color=\"green\"><strong>处理成功输出参数：</strong></font><br/>"+$(this).attr("paraValue"));
						}
						//alert(i);
					});
				}
				

				//$("#outputdata").val(t);
			},
			error:function(t){
				ymPrompt.close();
				ymPrompt.errorInfo({title:'错误提示：',message:'执行失败'});
				$("#outputdata").empty();
				$("#outputdata").append("<font color=\"red\"><strong>执行失败：请查看中心端控制台错误信息。</strong></font><br/>");
			}
		 });
 }
 
 
 function setval(id){
 	if(id==1){//签到
	 	$("#inputdata").val("9100^888888^222^^201305281235528888885745^230299^^1^");
 	}else if(id==2){//签退
 		$("#inputdata").val("9110^888888^222^8888-00000222-20130528060^2012110811214099998513^230299^^1^");
 	}else if(id==3){//审批上报
 		$("#inputdata").val("3110^9999^DBA^2032-00000DBA-20130117018^20121229105249211003113434^229900^00213281|51||||||20130101010101||迟国会||||||||||||2||^1^");
 	}else if(id==4){
 		$("#inputdata").val("3120^9999^DBA^2032-00000DBA-20130121036^20121229105249211003113434^229900^51|00213281||||28449|^1^");
 	}else if(id==5){//挂号
 		$("#inputdata").val("2210^888888^222^8888-00000222-20130528062^20121229105249211003113412^230299^1111|11|20130202121213|K74|||7|8|||||1111|1000069052||||sss|^1^");
 	}else if(id==6){//处方上传
		$("#inputdata").val("2310^9999^DBA^2032-00000DBA-20130121036^20121229105249211003113434^229900^cgh1|2|11|cgh-5|2013|B008845|JLZL00887|mc|11|2||||||||||||||||ddd|222|^1^");
	}else if(id==7){//读卡
		$("#inputdata").val("2100^9999^DBA^9999-00000DBA-20130129703^20090112124835402008^229900^|^1^");
	}else if(id==8){//对账
		$("#inputdata").val("1120^888888^222^8888-00000222-20130528057^201305281244488888888666^230299^0.0|0.0|0.0|0.0|0.0|0.0|0.0|0.0|0|^1^");
	}else if(id==9){//1400交易
		$("#inputdata").val("1400^888888^222^8888-00000222-20130528057^201305281250118888886804^230299^|2232332|^1^");
	}else if(id==10){//2610药店预结
		$("#inputdata").val("2610^888888^222^8888-00000222-20130528062^201305281642348888887654^230299^20364||20130528164233|迟国会|||null|$|1|11|AAAA|20130528164233|Y1369723445940|测试缓存药1|20.0|1.0|12|10片*10板||||||||||迟国会||^1^");
	}else if(id==11){// 
		 
	}else if(id==12){//处方上传
		$("#inputdata").val("2310^888888^222^8888-00000222-20130528062^20121229105249211003113412^230299^1111|1|01|sos000185|20130219121212|dl-testyp4|2|11|12.00|3.0||||||||||||||^1^");
	}else if(id==13){//结算
		$("#inputdata").val("2410^888888^222^8888-00000222-20130528062^201212291052492110031134^230299^1111|12346|11|20130227020202|||||1||1111||||11||||^1^");
	}else if(id==14){//撤销
		$("#inputdata").val("2430^888888^222^8888-00000222-20130528062^2012122910524921100311^230299^1111|12346||1111|1||^1^");
	}else if(id==15){//冲正
		$("#inputdata").val("2421^888888^222^8888-00000222-20130528062^2012122910524921100311^230299^2410|201310251533461000727375|03||^1^");
	}
 	
 	
 }
 
 
 
</script>
<script type="text/javascript" src="<%=basePath%>js/page.js"></script>
<%
String mes=(String)request.getParameter("ok");
%>
<%if(mes!=null){%>
   <script type="text/javascript">
   		ymPrompt.succeedInfo({title:'信息提示：',message:'问题提交成功！！！'});
   </script>
<%} %>
</head>

<body>

<form action="<%=basePath %>servlet/SihelpServlet" method="post" id="sform">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="24" bgcolor="#C3D7DA"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="3%" height="19" valign="bottom"><div align="center"><img src="<%=basePath %>images/tb.gif" width="14" height="14" /></div></td>
                <td width="94%" valign="bottom"><span class="STYLE1"><a href="<%=basePath%>right.jsp"><strong>系统首页</strong></a>--><font style="font-weight: normal;">接口测试</font></span></td>
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
		接口测试
 		</td>
       
      </tr>
      <tr>
        <td bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left;" colspan="2">
          	<table width="100%">
          		<tr >
          		  <td width="8%" style="text-align: right;font-size: 14px; font-weight: bold;">卡信息：</td>
          		  <td>
            		<input type="text" id="cardinfo" value="P00217396"/>
          		  </td>
          		</tr>
          		<tr >
          		  <td width="8%" style="text-align: right;font-size: 14px; font-weight: bold;">dllParam：</td>
          		  <td>
            		<input type="text" id="dllparam" value="3C970E8514E3|10|230299BB6C5E13|888888|" style="width: 300px;"/>
          		  </td>
          		</tr>
          		<tr >
          		  <td width="8%" style="text-align: right;font-size: 14px; font-weight: bold;">dllparm：</td>
          		  <td>
            		<input type="text" id="dllparm" value="1$230299|1|131231|1|131231|1|131231|1|131231|0|000000|$" style="width: 400px;"/>
          		  </td>
          		</tr>
          		<tr >
          		  <td width="8%" style="text-align: right;font-size: 14px; font-weight: bold;">入参：</td>
          		  <td>
            		<textarea rows="3" cols="85" id="inputdata" ></textarea>
          		  </td>
          		</tr>
          		<tr>
          			<td></td>
          			<td>
          			交易编码^医疗机构编号^操作员编号^业务周期号^医院交易流水号^中心编码^入参^<br/>
          			<input type="radio" name="inputval" onclick="setval('1')"/> 签到
          		  	<input type="radio" name="inputval" onclick="setval('8')"/>对账
          		  	<input type="radio" name="inputval" onclick="setval('9')"/>查询患者信息1400
          		  	<input type="radio" name="inputval" onclick="setval('2')"/>签退
          		  	<input type="radio" name="inputval" onclick="setval('7')"/>读卡
          		  	<input type="radio" name="inputval" onclick="setval('10')"/>药店预结
          		  	<input type="radio" name="inputval" onclick="setval('6')"/>处方上传
          		  	<input type="radio" name="inputval" onclick="setval('3')"/>审批上报
          		  	<input type="radio" name="inputval" onclick="setval('4')"/>审批撤销
          		  	<input type="radio" name="inputval" onclick="setval('5')"/>登记
          		  	<input type="radio" name="inputval" onclick="setval('12')"/>处方上传
          		  	<input type="radio" name="inputval" onclick="setval('13')"/>结算
          		  	<input type="radio" name="inputval" onclick="setval('14')"/>结算撤销
          		  	<input type="radio" name="inputval" onclick="setval('15')"/>冲正
          		  	</td>
          		</tr>
          		<tr >
          		  <td width="8%" style="text-align: right;font-size: 14px; font-weight: bold;">出参：</td>
          		  <td>
            		<div id="outputdata" style="width: 695px; height: 125px; border: 1px solid #00f;  padding: 3px;overflow: hidden;overflow-y:auto; "></div>
          		  </td>
          		</tr>
         
          		<tr >
          		  <td width="8%" style="text-align: right;font-size: 14px; font-weight: bold;"> </td>
          		  <td>
          		  中心交易流水号^联脱机标志^输出参数^
          		  	<p/>
            		<input type="button" value="提交请求" onclick="submitaction()"/> 
          		  </td>
          		</tr>
          	</table>
		</td>
      </tr>
     
    </table></td>
  </tr>

</table>
</form>
</body>
</html>

