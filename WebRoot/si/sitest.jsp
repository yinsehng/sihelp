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
<title>�ޱ����ĵ�</title>
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
	    	$("[name='cid']").removeAttr("checked");//ȡ��ȫѡ
	    }else{
       		$("[name='cid']").attr("checked",'true');//ȫѡ
	    }
     });
	 
	 $($("[name='all']")).click(function(){  //��ѡ 
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
	 	ymPrompt.errorInfo({title:'������ʾ��',message:'��β���Ϊ�գ�����'});
	 	return;
	 }
	 inputdata=escape(escape(inputdata));
	 ymPrompt.win({message:'<br><center>ִ�������Ժ�......</center>',titleBar:false,width:400,height:50});
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
				if(code==1){//����
					ymPrompt.close();
					ymPrompt.errorInfo({title:'������ʾ��',message:'ִ��ʧ��'});
					$(t).find("header").each(function(i){
						code=$(this).children("errorMessage").attr("detailMessage");
						$("#outputdata").empty();
						$("#outputdata").append("<font color=\"red\"><strong>�������,������Ϣ��</strong></font><br/>"+code);
					});
				}else{
					ymPrompt.close();
					ymPrompt.succeedInfo({title:'��Ϣ��ʾ��',message:'ִ�гɹ�'});
					$(t).find("body").find("parameters").find("parameter").each(function(i){
						var parname=$(this).attr("paraName");
						if(parname=="outputData"){
							$("#outputdata").empty();
							$("#outputdata").append("<font color=\"green\"><strong>����ɹ����������</strong></font><br/>"+$(this).attr("paraValue"));
						}
						//alert(i);
					});
				}
				

				//$("#outputdata").val(t);
			},
			error:function(t){
				ymPrompt.close();
				ymPrompt.errorInfo({title:'������ʾ��',message:'ִ��ʧ��'});
				$("#outputdata").empty();
				$("#outputdata").append("<font color=\"red\"><strong>ִ��ʧ�ܣ���鿴���Ķ˿���̨������Ϣ��</strong></font><br/>");
			}
		 });
 }
 
 
 function setval(id){
 	if(id==1){//ǩ��
	 	$("#inputdata").val("9100^888888^222^^201305281235528888885745^230299^^1^");
 	}else if(id==2){//ǩ��
 		$("#inputdata").val("9110^888888^222^8888-00000222-20130528060^2012110811214099998513^230299^^1^");
 	}else if(id==3){//�����ϱ�
 		$("#inputdata").val("3110^9999^DBA^2032-00000DBA-20130117018^20121229105249211003113434^229900^00213281|51||||||20130101010101||�ٹ���||||||||||||2||^1^");
 	}else if(id==4){
 		$("#inputdata").val("3120^9999^DBA^2032-00000DBA-20130121036^20121229105249211003113434^229900^51|00213281||||28449|^1^");
 	}else if(id==5){//�Һ�
 		$("#inputdata").val("2210^888888^222^8888-00000222-20130528062^20121229105249211003113412^230299^1111|11|20130202121213|K74|||7|8|||||1111|1000069052||||sss|^1^");
 	}else if(id==6){//�����ϴ�
		$("#inputdata").val("2310^9999^DBA^2032-00000DBA-20130121036^20121229105249211003113434^229900^cgh1|2|11|cgh-5|2013|B008845|JLZL00887|mc|11|2||||||||||||||||ddd|222|^1^");
	}else if(id==7){//����
		$("#inputdata").val("2100^9999^DBA^9999-00000DBA-20130129703^20090112124835402008^229900^|^1^");
	}else if(id==8){//����
		$("#inputdata").val("1120^888888^222^8888-00000222-20130528057^201305281244488888888666^230299^0.0|0.0|0.0|0.0|0.0|0.0|0.0|0.0|0|^1^");
	}else if(id==9){//1400����
		$("#inputdata").val("1400^888888^222^8888-00000222-20130528057^201305281250118888886804^230299^|2232332|^1^");
	}else if(id==10){//2610ҩ��Ԥ��
		$("#inputdata").val("2610^888888^222^8888-00000222-20130528062^201305281642348888887654^230299^20364||20130528164233|�ٹ���|||null|$|1|11|AAAA|20130528164233|Y1369723445940|���Ի���ҩ1|20.0|1.0|12|10Ƭ*10��||||||||||�ٹ���||^1^");
	}else if(id==11){// 
		 
	}else if(id==12){//�����ϴ�
		$("#inputdata").val("2310^888888^222^8888-00000222-20130528062^20121229105249211003113412^230299^1111|1|01|sos000185|20130219121212|dl-testyp4|2|11|12.00|3.0||||||||||||||^1^");
	}else if(id==13){//����
		$("#inputdata").val("2410^888888^222^8888-00000222-20130528062^201212291052492110031134^230299^1111|12346|11|20130227020202|||||1||1111||||11||||^1^");
	}else if(id==14){//����
		$("#inputdata").val("2430^888888^222^8888-00000222-20130528062^2012122910524921100311^230299^1111|12346||1111|1||^1^");
	}else if(id==15){//����
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
   		ymPrompt.succeedInfo({title:'��Ϣ��ʾ��',message:'�����ύ�ɹ�������'});
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
                <td width="94%" valign="bottom"><span class="STYLE1"><a href="<%=basePath%>right.jsp"><strong>ϵͳ��ҳ</strong></a>--><font style="font-weight: normal;">�ӿڲ���</font></span></td>
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
		�ӿڲ���
 		</td>
       
      </tr>
      <tr>
        <td bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left;" colspan="2">
          	<table width="100%">
          		<tr >
          		  <td width="8%" style="text-align: right;font-size: 14px; font-weight: bold;">����Ϣ��</td>
          		  <td>
            		<input type="text" id="cardinfo" value="P00217396"/>
          		  </td>
          		</tr>
          		<tr >
          		  <td width="8%" style="text-align: right;font-size: 14px; font-weight: bold;">dllParam��</td>
          		  <td>
            		<input type="text" id="dllparam" value="3C970E8514E3|10|230299BB6C5E13|888888|" style="width: 300px;"/>
          		  </td>
          		</tr>
          		<tr >
          		  <td width="8%" style="text-align: right;font-size: 14px; font-weight: bold;">dllparm��</td>
          		  <td>
            		<input type="text" id="dllparm" value="1$230299|1|131231|1|131231|1|131231|1|131231|0|000000|$" style="width: 400px;"/>
          		  </td>
          		</tr>
          		<tr >
          		  <td width="8%" style="text-align: right;font-size: 14px; font-weight: bold;">��Σ�</td>
          		  <td>
            		<textarea rows="3" cols="85" id="inputdata" ></textarea>
          		  </td>
          		</tr>
          		<tr>
          			<td></td>
          			<td>
          			���ױ���^ҽ�ƻ������^����Ա���^ҵ�����ں�^ҽԺ������ˮ��^���ı���^���^<br/>
          			<input type="radio" name="inputval" onclick="setval('1')"/> ǩ��
          		  	<input type="radio" name="inputval" onclick="setval('8')"/>����
          		  	<input type="radio" name="inputval" onclick="setval('9')"/>��ѯ������Ϣ1400
          		  	<input type="radio" name="inputval" onclick="setval('2')"/>ǩ��
          		  	<input type="radio" name="inputval" onclick="setval('7')"/>����
          		  	<input type="radio" name="inputval" onclick="setval('10')"/>ҩ��Ԥ��
          		  	<input type="radio" name="inputval" onclick="setval('6')"/>�����ϴ�
          		  	<input type="radio" name="inputval" onclick="setval('3')"/>�����ϱ�
          		  	<input type="radio" name="inputval" onclick="setval('4')"/>��������
          		  	<input type="radio" name="inputval" onclick="setval('5')"/>�Ǽ�
          		  	<input type="radio" name="inputval" onclick="setval('12')"/>�����ϴ�
          		  	<input type="radio" name="inputval" onclick="setval('13')"/>����
          		  	<input type="radio" name="inputval" onclick="setval('14')"/>���㳷��
          		  	<input type="radio" name="inputval" onclick="setval('15')"/>����
          		  	</td>
          		</tr>
          		<tr >
          		  <td width="8%" style="text-align: right;font-size: 14px; font-weight: bold;">���Σ�</td>
          		  <td>
            		<div id="outputdata" style="width: 695px; height: 125px; border: 1px solid #00f;  padding: 3px;overflow: hidden;overflow-y:auto; "></div>
          		  </td>
          		</tr>
         
          		<tr >
          		  <td width="8%" style="text-align: right;font-size: 14px; font-weight: bold;"> </td>
          		  <td>
          		  ���Ľ�����ˮ��^���ѻ���־^�������^
          		  	<p/>
            		<input type="button" value="�ύ����" onclick="submitaction()"/> 
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

