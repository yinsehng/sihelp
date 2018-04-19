<%@page import="com.neusoft.util.TimeUtil"%>
<%@page import="com.neusoft.bean.Jinfo"%>
<%@page import="com.neusoft.bean.Protocol"%>
<%@ page language="java" import="java.util.*,com.neusoft.bean.Kb01" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String flag = (String)request.getAttribute("flag");
	Protocol protocol = (Protocol)request.getAttribute("protocol");
	String valid = "0";
	String WQ_DATE="";
	if (protocol!=null) {
		valid = protocol.getWQ_VALID();
		WQ_DATE = protocol.getWQ_TIME();
		WQ_DATE = TimeUtil.getDate(WQ_DATE);
	}
	Kb01 kb01 = (Kb01)request.getAttribute("kb01");
	Jinfo jinfo = (Jinfo)request.getAttribute("jinfo");
	String tel = jinfo.getTEL();
	String year = TimeUtil.getYear();
	String[] tels = null;
	if (tel != null && !"".equals(tel)) {
		tels = tel.split(",");
	}
	String[] options = null;
	if (flag == "1") {
		String option = protocol.getWQ_OPTIONS();
		options = option.split(",");
	}
	String[] protocols = new String[19];
	if (kb01 != null) {
		String pro = kb01.getProtocols();
		if (pro != null){
			protocols = pro.split(",");
		} else {
			for (int i = 0; i < 18; i++) {
				protocols[i] = "";
			}
		}
		
	}
	
%>

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
<script language="javascript" src="<%=basePath %>js/my.js"></script>
<style type="text/css">
.body{
    font: 11px/1.25 Microsoft Yahei,Helvetica,sans-serif;
    background-color: #fff;
    color: #000;
}
.common {
	font: 15px/1.25 Microsoft Yahei,Helvetica,sans-serif;
}
.hd {
    overflow: hidden;
    height: 30px;
}
ul {
    float: right;
    overflow: hidden;
    zoom: 1;
    margin-top: 10px;
}
.hd ul li.on{ background:#f00;  }
.hd ul li {
    /* position: relative; */
    _display: inline;
    float: left;
    width: 10px;
    height: 10px;
    overflow: hidden;
    background: #ccc;
    margin-right: 10px;
    text-indent: -999px;
    cursor: pointer;
    -webkit-border-radius: 10px;
    -moz-border-radius: 10px;
    border-radius: 10px;
    behavior: url(../PIE.htc);
}
</style>
<script type="text/javascript">
var ymr = timer();

$(document).ready(function(){
	  
	  $("#protocol_heard_right").text(getYear());
	  $("input").attr("readonly","true");
	  $("#prev").click(function(){
		var curentDisplay = getDisplayDiv();
		var total = $(".protocol").length;
		
	    if (curentDisplay == 0) {
	    	//表示当前为第一页，则显示最后一页
	    	showDiv(total - 1);
	    	showNum(total - 1);
	    	showPageNum(total);
	    } else {
	    	showDiv(curentDisplay - 1);
	    	showNum(curentDisplay - 1);
	    	showPageNum(curentDisplay);
	    }
	  });
	  $(".options").focus(function(){
		  $(this).css("background-color","#FFFFCC");
	  });
	  $(".options").blur(function(){
		  $("this").css("background-color","#D6D6FF");
		  var name = $(this).attr("name");
		  var page = $(this).attr("currentPage");
		  var val = $(this).val();
		  var optionNum = $(this).attr("order-name");
		  if (name.substr(0,6) != "option") {
			  if (val == "") {
				  SimplePop.confirm("第<font size='7px' color='red'>"+page+"</font>页存在未填写的指标项，请确认!",
						  {
					  		type: "error",
					  		title: "错误提示",
					  		opacity: 0.2,
					  		cancel: function(){
			                  
			              },
			              confirm: function(){
			              	showDiv(page-1);
							showNum(page-1);
							showPageNum(page);
			              }
						  });
			  }
			  return;
		  }
		  if (name != "option3") {
			  if (!isNum($(this).val())) {
				  tip(page,optionNum);
			  } else {
				  if (name == "option5" || name == "option6" || name == "option18") {
					  if ($(this).val()>100||$(this).val()<0){
						  tip(page,optionNum);
					  }
				  }
			  }
		  }
	  });
	  $("#next").click(function(){
			var curentDisplay = getDisplayDiv();
			var total = $(".protocol").length;
		    if (curentDisplay == (total-1)) {
		    	//表示当前为第一页，则显示最后一页
		    	showDiv(0);
		    	showNum(0);
		    	showPageNum(1);
		    } else {
		    	showDiv(curentDisplay + 1);
		    	showNum(curentDisplay + 1);
		    	showPageNum(curentDisplay + 2);
		    }
		  });
	  $(".point").click(function(){
		  var point_num = $(this).text();
		  showDiv(point_num - 1);
		  showNum(point_num - 1);
		  showPageNum(point_num);
	  });
	  
	  $("#print").click(function(){
		  print("<%=basePath%>");
	  });
	  
	  $("#agree").click(function(){
		  
		  var inputs = $(".options");
			  
			  for (var i = 0; i < inputs.length; i++) {
				  var value = $(inputs[i]).val();
				  var optionNum = $(inputs[i]).attr("order-name");
				  var page = $(inputs[i]).attr("currentPage");
				  var name = $(inputs[i]).attr("name");
				  
				  if (value == "") {
						  SimplePop.confirm("第<font size='7px' color='red'>"+page+"</font>页存在未填写的指标项，请确认!",
								  {
							  		type: "error",
							  		title: "错误提示",
							  		opacity: 0.2,
							  		cancel: function(){
					                  
					              },
					              confirm: function(){
					              	showDiv(page-1);
									showNum(page-1);
									showPageNum(page);
					              }
								  });
						  return;
				   } else {
					   if (name.substr(0,6) == "option" && name != "option3") {
							  if (!isNum(value)) {
								  tip(page,optionNum);
								  return;
							  } else {
								  if (name == "option5" || name == "option6" || name == "option18") {
									  if (value > 100 || value < 0){
										  tip(page,optionNum);
										  return;
									  }
								  }
								  continue;
							  }
						  }
					   continue;
				   }
				  
			  }
			  //判断是否勾选阅读协议
			  if (!$("#select").prop("checked")) {
				  SimplePop.confirm("在同意之前请选中阅读协议!",
						  {
					  		type: "error",
					  		title: "错误提示",
					  		opacity: 0.2,
						  });
				  return;
			  }
		  
		  
		  //看是不是已经填写完签署单
		  $.ajax({
    		      	    url:"<%=basePath%>servlet/CheckPersonServlet?temptime="+Math.random(),
    		      	    data:{},  
    		      	    type:'GET',
    		      	    cache:false, 
    		      	    dataType:'text',
    		      	    success:function(result) {
    		      	    	if (result == "1") {
    		      			  //此时开始提交所有参数，成功后自动刷新本页面
    		      			  //获取所有参数
    		      			  var WQ_AKB021 = "";
    		      			  var WQ_NAME = "";
    		      			  var WQ_ADDRESS = "";
    		      			  var WQ_POSTALCODE = "";
    		      			  var WQ_TEL = "";
    		      			  var WQ_OPTIONS = "";
    		      			  for (var i = 0; i < inputs.length; i++) {
    		      				  var value = $(inputs[i]).val();
    		      				  switch (i){
    		      					  case 0:
    		      					  	WQ_AKB021 = value;
    		      					  	break;
    		      					  case 1:
    		      						WQ_NAME = value;
    		      						break;
    		      					  case 2:
    		      						WQ_ADDRESS = value;
    		      						break;
    		      					  case 3:
    		      						WQ_POSTALCODE = value;
    		      						break;
    		      					  case 4:
    		      						WQ_TEL = value;
    		      						value = "";
    		      					  default:
    		      						WQ_OPTIONS = WQ_OPTIONS + value + ",";
    		      						break;
    		      				      
    		      				  }  
    		      			  }
    		      			  $.ajax({
    		      		      	    url:"<%=basePath %>servlet/SubmitProtocolServlet?temptime="+Math.random(),
    		      		      	    data:{
    		      		      	    	"WQ_AKB021":WQ_AKB021,
    		      		      	    	"WQ_NAME":WQ_NAME,
    		      		      	    	"WQ_ADDRESS":WQ_ADDRESS,
    		      		      	    	"WQ_POSTALCODE":WQ_POSTALCODE,
    		      		      	    	"WQ_TEL":WQ_TEL,
    		      		      	    	"TYPE":1, //表示医院
    		      		      	    	"WQ_OPTIONS":WQ_OPTIONS
    		      		      	    },  
    		      		      	    type:'GET',
    		      		      	    cache:false, 
    		      		      	    dataType:'text',
    		      		      	    success:function(result) {
    		      		      	    	if (result == "repeat") {
    		      		      	    		 SimplePop.confirm("您今年已经签署过协议，如需重新签订请联系管理员!",
    		      									  {
    		      								  		type: "error",
    		      								  		title: "提示",
    		      								  		opacity: 0.2,
    		      									  });
    		      		      	    	} else if (result == "ok") {
    		      		      	    		 SimplePop.confirm("协议签署成功，您可以点击网签协议进行查看!",
    		      									  {
    		      								  		type: "right",
    		      								  		title: "提示",
    		      								  		opacity: 0.2,
    		      									  });
    		      		      	    	} else if (result == "error") {
    		      		      	    		SimplePop.confirm("协议没有保存成功，请联系管理员及时处理!",
    		      									  {
    		      								  		type: "confirm",
    		      								  		title: "提示",
    		      								  		opacity: 0.2,
    		      									  });
    		      		      	    	}
    		      		      	    },
    		      		      	    error : function() {
    		      		      	    	
    		      		      	    }
    		      		      	});
    		      	    	} else {
    		      	    		 SimplePop.prompt("",{
     		      	    			type: "confirm", 
     		      	    			cancel: function(){
     		      	    				 
     		      	    			}, 
     		      	    		    confirm: function(msg){
     		      	    		    	var name = $("#name").val();
     		      	    		    	var card = $("#card").val();
     		      	    		    	var tel = $("#tel").val();
     		      	    		    	var reg = "^[1-9]\\d{5}(18|19|([23]\\d))\\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\\d{3}[0-9Xx]$";
     		      	    		    	var regex=new RegExp(reg);
     		      	    		    	
     		      	    		    	if (!regex.test(card)|| card == ''){
     		      	    		    		$('#error_card').css('display','');
     		      	    		    		return;
     		      	    		    	} else {
     		      	    		    		$('#error_card').css('display','none');
     		      	    		    	}
     		      	    		    	if (name == '') {
     		      	    		    		$('#error_name').css('display','');
     		      	    		    		return;
     		      	    		    	} else {
     		      	    		    		$('#error_name').css('display','none');
     		      	    		    	}
     		      	    		    	if (tel == '') {
     		      	    		    		$('#error_tel').css('display','');
     		      	    		    		return;
     		      	    		    	} else {
     		      	    		    		$('#error_tel').css('display','none');
     		      	    		    	}
     		      	    		    	//校验成功，保存数据
     		      	    		    	$.ajax({
     		      	    		      	    url:"<%=basePath%>servlet/SavePersonServlet?temptime="+Math.random(),
     		      	    		      	    data:{
     		      	    		      	    	"name":name,
     		      	    		      	    	"card":card,
     		      	    		      	    	"tel":tel
     		      	    		      	    },  
     		      	    		      	    type:'GET',
     		      	    		      	    cache:false, 
     		      	    		      	    dataType:'text',
     		      	    		      	    success:function(result) {
     		      	    		      	    	if (result == "success") {
     		      	    		      	    		$(".popTitle .close").triggerHandler("click");
     		      	    		      	    	SimplePop.confirm("<font size='7'>保存成功!</font>",
     		      	    		      				  {
     		      	    		      			  		type: "right",
     		      	    		      			  		title: "提示",
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
    		      	    	}
    		      	    },
    		      	    error : function() {
    		      	    	
    		      	    }
    		      	});
	  });
	});
	
//提供一个查询方法，用于查询当前哪个div处于显示的状态
function getDisplayDiv(){
	var allDiv = $(".protocol");
	for (var i = 0; i < allDiv.length; i++) {
		var display = $($(".protocol")[i]).css("display");
		if (display == "block") {
			return i;
		}
	}
}
//提供一个显示的方法，用于传入一个标号，进行显示
function showDiv(p){
	//把显示的置为不显示
	var allDiv = $(".protocol");
	for (var i = 0; i < allDiv.length; i++) {
		$($(".protocol")[i]).css("display", "none");
	}
	$($(".protocol")[p]).css("display", "block");
}
//提供红点显示消失的方法
function showNum(p){
	var num = $(".num li");
	for (var i = 0; i < num.length; i++) {
		$(num[i]).css("background","#ccc");
	}
	$(num[p]).css("background","#f00");
}
//用于显示下标的页码
function showPageNum(p){
	$("#pageNum").text(p+"/20");
}
//提供所有数字验证
function isNum(val){
	var reg = new RegExp("^[0-9]+\.?[0-9]*$");
	if(!reg.test(val)){
        return false;  
    }
	return true;
}

function tip(page,optionNum){
	SimplePop.confirm("第<font size='7px' color='red'>"+page+"</font>页第<font size='7px' color='red'>"+optionNum+"</font>项指标项不符合规格，请确认!",
			  {
		  		type: "error",
		  		title: "错误提示",
		  		opacity: 0.2,
		  		cancel: function(){
                  
              },
              confirm: function(){
              	showDiv(page-1);
				    showNum(page-1);
				    showPageNum(page);
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
function getYear(){
	var date = new Date();
	var y= date.getFullYear();
	return "（"+y+"版）";
}
function CheckIsInstall() {	 
	try{ 
	    var LODOP=getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM')); 
		if ((LODOP!=null)&&(typeof(LODOP.VERSION)!="undefined")) {
			return true;
		}else {
			return false;
		} 
	 }catch(err){ 
		//alert("Error:本机未安装或需要升级!"); 
		 } 
};
</script>
</head>
<body>


<div class="protocol" align="center" style="width:95%;position: absolute;display: block;">
   <div class="common" style="width:100%;margin-top: 10px;">
       <div id="protocol_heard_left" style="width:5%;padding-left: 32%;float: left;font-size: 12px;font-weight: bold;" align="left">医保编号</div>
       <div id="protocol_heard_right" style="width:40%;float: right;padding-right: 13%;font-size: 12px;font-weight: bold; align:left">（2017版）</div>
   </div>
   <div style="width:100%;padding-top: 20px;">
       <div style="width:100%;padding-left:0%;font-size: 25px;font-weight: bold;">哈尔滨市城镇基本医疗保险</div>
       <div style="width:100%;padding-left:0%;font-size: 25px;font-weight: bold;">定点医疗机构服务</div>
       <div style="width:100%;padding-left:0%;font-size: 25px;font-weight: bold;">协议书</div>
   </div>
   <div class="common" style="width:100%;padding-top: 15px;">
       <div style="padding-left: 35%;padding-top: 3px;" align="left">甲方：</div>
       <div style="padding-left: 35%;padding-top: 3px;" align="left">名称：<%=jinfo.getNAME() %></div>
       <div style="padding-left: 35%;padding-top: 3px;" align="left">法定代表人：<%=jinfo.getCORPORATION() %></div>
       <div style="padding-left: 35%;padding-top: 3px;" align="left">地址：<%=jinfo.getADDRESS() %></div>
       <div style="padding-left: 35%;padding-top: 3px;" align="left">邮政编码：<%=jinfo.getPOSTALCODE() %></div>
       <div style="padding-left: 35%;padding-top: 3px;" align="left">联系电话：<%=tels[0] %></div>
       <%
       if (tels.length > 1) {
    	   for (int i = 1; i < tels.length; i++) {
        	   %>
        	   <div style="padding-left: 41.5%;padding-top: 3px;" align="left"><%=tels[i] %></div>
        	   <%
    	   }
       }%>
       
   </div>
   <div class="common" style="width:100%;padding-top: 5px;">
       <div style="padding-left: 35%;padding-top: 3px;" align="left">乙方：</div>
       <div style="padding-left: 35%;padding-top: 3px;" align="left">名称：<input type="text" class="options" currentPage="1" name="wq_akb021" value=
       "<% if (flag == "1"){%><%=protocol.getAKB021() %><%} else {%><%=kb01.getAkb021()==null?"":kb01.getAkb021() %><%} %>" 
       size="12" style="border:0px;border-bottom:#000000 1px solid;width: 315px;"/></div>
       <div style="padding-left: 35%;padding-top: 3px;" align="left">法定代表人或委托代理人：<input type="text" class="options" currentPage="1" name="wq_name" value=
       "<% if (flag == "1"){%><%=protocol.getWQ_NAME() %><%} else {%><%=kb01.getAae004()==null?"":kb01.getAae004() %><%} %>"
       size="12" style="border:0px;border-bottom:#000000 1px solid;width: 180px;"/></div>
       <div style="padding-left: 35%;padding-top: 3px;" align="left">地址：<input type="text" class="options" currentPage="1" name="wq_address" value=
       "<% if (flag == "1"){%><%=protocol.getWQ_ADDRESS() %><%} else {%><%=kb01.getAae006()==null?"":kb01.getAae006() %><%} %>"
       size="12" style="border:0px;border-bottom:#000000 1px solid;width: 315px;"/></div>
       <div style="padding-left: 35%;padding-top: 3px;" align="left">邮政编码：<input type="text" class="options" currentPage="1" name="wq_postalcode" value=
       "<% if (flag == "1"){%><%=protocol.getWQ_POSTALCODE() %><%} else {%><%=kb01.getCkb162()==null?"":kb01.getCkb162() %><%} %>"
       size="12" style="border:0px;border-bottom:#000000 1px solid;width: 284px;"/></div>
       <div style="padding-left: 35%;padding-top: 3px;" align="left">联系电话：<input type="text" class="options" currentPage="1" name="wq_tel" value=
       "<% if (flag == "1"){%><%=protocol.getWQ_TEL() %><%} else {%><%=kb01.getAae005()==null?"":kb01.getAae005() %><%} %>"
       size="12" style="border:0px;border-bottom:#000000 1px solid;width: 284px;"/></div>
   </div>
</div>



<div class="protocol" align="center" style="position: absolute;display: none;width: 67%;">
   <div class="common" style="width:100%;margin-top: 10px;padding-left: 37%">
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	为保障基本医疗保险参保人员的合法权益， 维护医保基金安全， 促进医保制度可持续
        </div>
      	<div style="padding-top: 3px;" align="left">
        	发展，根据《中华人民共和国社会保险法》 、 人力资源社会保障部《关于完善基本医疗保
        </div>
      	<div style="padding-top: 3px;" align="left">
        	险定点医药机构协议管理的指导意见》、《基本医疗保险定点医药机构协议管理经办规程》
        </div>
      	<div style="padding-top: 3px;" align="left">
        	、《哈尔滨市城镇基本医疗保险暂行办法》、《哈尔滨市城镇居民基本医疗保险暂行办法》
        </div>
      	<div style="padding-top: 3px;" align="left">
        	、《哈尔滨市城镇居民基本医疗保险门诊统筹暂行办法》、《哈尔滨市开展城镇居民大病保
        </div>
      	<div style="padding-top: 3px;" align="left">
        	险工作实施方案》等法律法规及相关政策，经甲乙双方协商，就基本医疗保险医疗服务有关
        </div>
      	<div style="padding-top: 3px;" align="left">
        	事宜签订如下协议。
        </div>
      	<div style="padding-top: 3px;" align="left">
        	<span style="padding-left: 30%;font-size: 20px;">第一章  总  则</span>
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	第一条  甲乙双方应当认真贯彻国家 、 省以及市基本医疗保险 、 医疗卫生、药品监督、
        </div>
        <div style="padding-top: 3px;" align="left">
        	价格和医改等相关规定，保证参保人员享受基本医疗保险服务。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	第二条  甲方依据乙方的服务质量、服务能力、服务价格等通过协商谈判 ， 确定乙方的
        </div>
        <div style="padding-top: 3px;" align="left">
        	服务类别、服务范围、服务内容、付费方式。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	甲方确定乙方为基本医疗保险定点医疗机构。甲乙双方约定医疗服务为（城镇职工基本
        </div>
        <div style="padding-top: 3px;" align="left">
        	医疗保险□ /城镇居民基本医疗保险（含城镇居民大病保险 ）□)，共
        	<input type="text" class="options" currentPage="2" name="option1" order-name="1" value="<% if (flag == "1"){%><%=options[0] %><%}else{%><%=protocols[0] %><%}%>"
        	size="12" style="border:0px;border-bottom:#000000 1px solid;width: 60px;"/>
        	项。乙方承担
        </div>
        <div style="padding-top: 3px;" align="left">
        	的基本医疗保险服务范围为（门诊 □ /居民门诊统筹 □/住院 □），共
        	<input type="text" class="options" currentPage="2" name="option2" order-name="2" value="<% if (flag == "1"){%><%=options[1] %><%}else{%><%=protocols[1] %><%}%>" size="12" style="border:0px;border-bottom:#000000 1px solid;width: 60px;"/>
        	项。住院仅限
        </div>
        <div style="padding-top: 3px;" align="left">
        	
        	<input type="text" class="options" currentPage="2" name="option3" order-name="3" value="<% if (flag == "1"){%><%=options[2] %><%}else{%><%=protocols[2] %><%}%>" size="12" style="border:0px;border-bottom:#000000 1px solid;width: 160px;"/>
        	科室，共
        	<input type="text" class="options" currentPage="2" name="option4" order-name="4" value="<% if (flag == "1"){%><%=options[3] %><%}else{%><%=protocols[3] %><%}%>" size="12" style="border:0px;border-bottom:#000000 1px solid;width: 60px;"/>
        	项。
        </div>
         <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	第三条  甲乙双方应指导、督促经办机构工作人员、定点医疗机构工作人员和参保人员自
        </div>
        <div style="padding-top: 3px;" align="left">
        	觉遵守医疗保险的各项规定；有权向对方提出合理化建议，管理措施调整时应及时通报对
        </div>
        <div style="padding-top: 3px;" align="left">
        	方，并听取意见；有权检举和投诉对方工作人员的违规行为。
        </div>
   </div>
</div>

<!-- 第三页 -->
<div class="protocol" align="center" style="position: absolute;display: none;width: 67%;">
   <div class="common" style="width:100%;margin-top: 10px;padding-left: 37%">
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	第四条  甲方应及时向乙方传达基本医疗保险政策、经办规定、管理制度及业务操作
        </div>
        <div style="padding-top: 3px;" align="left">
        	流程的要求和变化情况，提供与乙方有关的参保人员信息及相关资料，做好医疗保险的管
        </div>
        <div style="padding-top: 3px;" align="left">
        	理服务工作，接受乙方咨询。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	第五条  乙方应建立健全医疗保险管理服务机制，明确一名院级领导分管医疗保险工
        </div>
        <div style="padding-top: 3px;" align="left">
        	作，配备专职管理人员，并明确相应的职责。制定执行基本医疗保险政策法规的相应措施，
        </div>
        <div style="padding-top: 3px;" align="left">
        	并为参保人员就医提供方便。
        </div>
         <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	协议履行期间，乙方名称、 地址、 法定代表人（ 企业负责人 ）、经营范围、类别
        </div>
        <div style="padding-top: 3px;" align="left">
                                 （营利/非营利）、级别、床位数、诊疗科目、大型诊疗项目和银行账户等信息发生变化时，
        </div>
        <div style="padding-top: 3px;" align="left">
        	  需在乙方收到批准机构变更材料10个工作日内，向甲方申请变更，变更时需提供行政主
        </div>
        <div style="padding-top: 3px;" align="left">
        	  管部门批准材料的原件和复印件。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	第六条  乙方应按照卫生计生等部门批准的经营许可范围开展工作，根据国家有关法
        </div>
        <div style="padding-top: 3px;" align="left">
        	律法规以及本协议为参保人员提供合理、必要的医疗服务，严格执行首诊医师负责制和因
        </div>
        <div style="padding-top: 3px;" align="left">
        	病施治及优先使用适宜技术的原则，合理检查、合理治疗、合规收费，采取有效措施控制
        </div>
        <div style="padding-top: 3px;" align="left">
        	医疗费用的不合理增长，减轻参保患者个人负担。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	第七条  甲方负责建立健全医保医师服务管理信息系统。乙方应按照《哈尔滨市基本
        </div>
        <div style="padding-top: 3px;" align="left">
        	医疗保险定点医疗机构服务医师管理暂行办法》的相关规定，积极配合甲方开展医保医师
        </div>
        <div style="padding-top: 3px;" align="left">
        	管理工作，做好医疗保险政策培训，定期组织医疗保险政策知识考核，并督促本单位医保
        </div>
        <div style="padding-top: 3px;" align="left">
        	医师正确履行医师工作职责。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	第八条  乙方应当严格执行政府主管部门制定的医院财务制度、医院会计制度及收入
        </div>
        <div style="padding-top: 3px;" align="left">
        	分配制度，规范财务管理。不得将医务人员的工资和奖金与其业务收入直接挂钩。被甲方
        </div>
        
   </div>
</div>
<!-- 第三页 end -->

<!-- 第四页 -->

<div class="protocol" align="center" style="position: absolute;display: none;width: 67%;">
   <div class="common" style="width:100%;margin-top: 10px;padding-left: 37%">
        <div style="padding-top: 3px;" align="left">
        	拒付的医疗费用，乙方应及时作相应财务处理。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	第九条  乙方应在本单位显要位置悬挂基本医疗保险定点医疗机构标识；利用医院网
        </div>
        <div style="padding-top: 3px;" align="left">
        	站、宣传栏等开展多种形式医疗保险政策宣传，公示基本医疗保险的主要政策、本协议的
        </div>
        <div style="padding-top: 3px;" align="left">
        	重点内容和就医流程。公布医疗保险监督举报电话，设置医疗保险投诉信箱，对参保人员
        </div>
         <div style="padding-top: 3px;" align="left">
        	的投诉及时核实、处理。医保相关工作人员应认真学习协议及相关文件，能够做到为患者
        </div>
        <div style="padding-top: 3px;" align="left">
        	正确解答医保政策，不得以任何理由拒绝解答患者及家属的咨询，不得故意曲解医保政策。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	第十条  甲方根据年度考核结果对乙方进行分级评价，实行分级管理，考核评价结果
        </div>
        <div style="padding-top: 3px;" align="left">
        	与医疗费用审核结算、考核资金（预留金）的返还等激励和惩戒内容挂钩。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	第十一条  甲方可对乙方医疗服务过程及相关医疗费用通过智能监控、实地检查等多
        </div>
        <div style="padding-top: 3px;" align="left">
        	种方式进行监督，根据需要对乙方医疗服务进行定期或不定期审核，审核后意见应及时反
        </div>
        <div style="padding-top: 3px;" align="left">
        	馈乙方，乙方对于审核意见，应在规定时限内予以回复，超过规定时限未进行回复的，甲
        </div>
        <div style="padding-top: 3px;" align="left">
        	方将按乙方认同审核意见处理。甲方如需查看参保人员病历及有关资料、询问当事人，乙
        </div>
        <div style="padding-top: 3px;" align="left">
        	方应予以合作。乙方有责任向甲方提供医疗服务有关的材料和数据，并确保内容真实完整。
        </div>
        <div style="padding-top: 3px;" align="left">
        	因提供不实资料、传输虚假数据产生的经济和法律责任由乙方承担。对于乙方提供的资料，
        </div>
        <div style="padding-top: 3px;" align="left">
        	甲方有保密的义务。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	第十二条   乙方经卫生计生等部门审批，确立为医养结合性质医疗机构的，应认真贯
        </div>
        <div style="padding-top: 3px;" align="left">
        	彻落实国家、省、市相关政策规定，厘清医疗与养老相关收费项目，确保基金合理使用。
        </div>
         <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	第十三条  甲方组织定点医疗机构临床专家对涉及基本医疗保险结算的临床诊疗施治
        </div>
        <div style="padding-top: 3px;" align="left">
        	行为、医疗纠纷、医疗事故等存在一定争议的问题作出鉴定结果。
        </div>
   </div>
</div>

<!-- 第四页end -->
<!-- 第五页 -->

<div class="protocol" align="center" style="position: absolute;display: none;width: 67%;">
   <div class="common" style="width:100%;margin-top: 10px;padding-left: 37%">
        <div style="padding-top: 3px;" align="left">
        	<span style="padding-left: 30%;font-size: 20px;">第二章  诊疗服务</span>
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	第十四条  参保人员就诊时，乙方必须提示其出示社会保障卡或城镇居民医保证，并
        </div>
        <div style="padding-top: 3px;" align="left">
        	按规定及时上传其入院信息。乙方禁止代办和留存参保人员社会保障卡或城镇居民医保证
        </div>
        <div style="padding-top: 3px;" align="left">
        	密码，严禁泄露参保人员信息。
        </div>
        <div style="padding-top: 3px;" align="left">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	参保人员就诊时，乙方应进行身份识别。发现人、证不符时不得进行医疗保险结算
        </div>
         <div style="padding-top: 3px;" align="left">
        	并及时告知甲方。需住院治疗的参保患者，由乙方医保管理部门及所在科室的相关责任人
        </div>
        <div style="padding-top: 3px;" align="left">
        	根据有效证件进行身份核实，留存《哈尔滨市基本医疗保险、工伤保险、生育保险参保人
        </div>
        <div style="padding-top: 3px;" align="left">
        	员住院登记信息表》，并告知患者住院治疗期间随身携带社会保障卡或城镇居民医保证。
        </div>
        <div style="padding-top: 3px;" align="left">
        	不得留存参保患者社会保障卡或城镇居民医保证原件。
        </div>
        <div style="padding-top: 3px;" align="left">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	第十五条  乙方应为参保人员就诊建立普通门诊、特殊疾病门诊、城镇居民基本医疗
        </div>
        <div style="padding-top: 3px;" align="left">
        	保险门诊及住院病历,就诊记录应清晰、准确、完整，并妥善保存备查；乙方要积极配合
        </div>
        <div style="padding-top: 3px;" align="left">
        	甲方做好参保职工（居民）特殊疾病门诊和城镇居民门诊定点就医的选择及改选工作。
        </div>
        <div style="padding-top: 3px;" align="left">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	第十六条  被确定为特殊疾病门诊服务定点的医疗机构，应严格按照特殊疾病门诊相
        </div>
        <div style="padding-top: 3px;" align="left">
        	关病种进行申请、审批，为患者建立特殊疾病门诊病历，并严格执行登记备案、信息录入、
        </div>
        <div style="padding-top: 3px;" align="left">
        	指纹信息及“五定”管理制度，工作人员应使用实名制操作，恶性肿瘤门诊治疗定点医疗机
        </div>
        <div style="padding-top: 3px;" align="left">
        	构在进行初次审批和续批时，应严格执行恶性肿瘤门诊治疗审批的相关规定，  审批材料应
        </div>
        <div style="padding-top: 3px;" align="left">
        	保存两年以上，以备甲方查验。
        </div>
        <div style="padding-top: 3px;" align="left">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	第十七条  特殊慢性病患者就诊时，乙方应严格执行《哈尔滨市医疗保险特殊慢性病
        </div>
        <div style="padding-top: 3px;" align="left">
        	门诊治疗医疗费补贴暂行办法》等相关规定，不得超范围支付，不得以任何理由拒绝患者在
        </div>
   </div>
</div>

<!-- 第五页end -->

<!-- 第六页 -->
<div class="protocol" align="center" style="position: absolute;display: none;width: 67%;">
   <div class="common" style="width:100%;margin-top: 10px;padding-left: 37%">
        <div style="padding-top: 3px;" align="left">
        	门诊享受特殊慢性病待遇。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	第十八条  乙方医保医师为参保人员提供诊疗服务开具处方时，应将医保医师姓名及
        </div>
        <div style="padding-top: 3px;" align="left">
        	处方信息一并录入到医疗保险信息系统。非医保医师为参保人员诊疗所发生的费用，甲方
        </div>
        <div style="padding-top: 3px;" align="left">
        	不予支付（急诊、急救除外）。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	第十九条  乙方应保证参保患者知情同意权，通过住院《温馨提示》等形式告知患者
        </div>
        <div style="padding-top: 3px;" align="left">
        	相关权利与义务，及时向参保人员提供门诊、住院费用结算清单和住院日费用清单,建立
        </div>
        <div style="padding-top: 3px;" align="left">
        	自费项目参保人员知情确认制度。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	乙方向参保人员提供自费或部分支付的医疗服务，包括药品、诊疗项目和服务设施等
        </div>
        <div style="padding-top: 3px;" align="left">
        	，需征得本人或其家属同意并签字确认。由于未签自费协议而发生费用纠纷的，应由乙方
        </div>
        <div style="padding-top: 3px;" align="left">
        	承担责任（急诊、急救除外）。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	第二十条  乙方应建立健全转诊、转院、转科制度，及时为符合转诊、转院、转科条件
        </div>
        <div style="padding-top: 3px;" align="left">
        	的参保患者按有关规定办理相关手续。严格控制年度内转出患者人数比例。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	第二十一条  乙方应对参保人员在其他同级医疗机构所做的检查化验结果，实行互认，
        </div>
        <div style="padding-top: 3px;" align="left">
        	充分予以利用，避免不必要的重复检查。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	 第二十二条  乙方应执行门诊处方外配制度，满足参保人员外配处方要求。参保人员
        </div>
        <div style="padding-top: 3px;" align="left">
        	 要求到药店购药时，乙方应按规定为参保人员提供外配处方。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	 第二十三条  甲方建立出院参保患者回访抽查机制。乙方应及时将参保人员联系电话
        </div>
        <div style="padding-top: 3px;" align="left">
        	 上传到医保系统，并保证留存的地址、电话等基本信息真实完整，如甲方回访发现乙方留
        </div>
        <div style="padding-top: 3px;" align="left">
        	 存的相关信息不真实，核实后拒付相应结算费用。
        </div>
   </div>
</div>
<!-- 第六页 end-->
<!-- 第七页 -->

<div class="protocol" align="center" style="position: absolute;display: none;width: 67%;">
   <div class="common" style="width:100%;margin-top: 10px;padding-left: 37%">
        <div style="padding-top: 3px;" align="left">
        	<span style="padding-left: 30%;font-size: 20px;">第三章  目录管理</span>
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	第二十四条  乙方应严格执行《黑龙江省基本医疗保险、工伤保险和生育保险药品目
        </div>
        <div style="padding-top: 3px;" align="left">
        	录（2010年版）》（以下简称《药品目录》）、医疗保险诊疗项目及医疗服务设施标准，
        </div>
        <div style="padding-top: 3px;" align="left">
        	超出目录或标准范围的费用，甲方不予支付，乙方要书面向参保人员告知使用理由和费用标
        </div>
        <div style="padding-top: 3px;" align="left">
        	准。乙方按甲方要求及时进行医疗保险药品目录、诊疗项目和服务设施标准的调整。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	营利性医疗保险定点医疗机构，应根据物价等部门制定的非营利性医疗机构相关标
        </div>
        <div style="padding-top: 3px;" align="left">
        	准收费。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	1、乙方要认真贯彻执行价格主管部门药品价格规定，不得随意提高药品价格。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	2、乙方应严格执行价格主管部门制定的医疗服务收费标准，按规定的项目和标准
        </div>
        <div style="padding-top: 3px;" align="left">
        	收费。甲方可通过与乙方谈判协商的方式对价格主管部门收费标准内价格实行弹性调整。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	3、乙方应保证为参保人员提供符合基本医疗保险服务范围和标准的住院床位。住
        </div>
        <div style="padding-top: 3px;" align="left">
        	院床位总数不得超过卫生计生部门《关于下发医疗机构基本标准（试行）的通知》规定的同
        </div>
        <div style="padding-top: 3px;" align="left">
        	级别最大床位数。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	第二十五条  乙方应按照规定配备和使用基本药物，优先和合理使用《药品目录》
        </div>
        <div style="padding-top: 3px;" align="left">
        	甲类药品。《药品目录》内药品配备率要达到85%以上，目录内药品使用率要达到80%以上
        </div>
        <div style="padding-top: 3px;" align="left">
        	。药品费用占住院总费用比例不超过
        	<input type="text" class="options" currentPage="7" name="option5" order-name="1" value="<% if (flag == "1"){%><%=options[4] %><%}else{%><%=protocols[4] %><%}%>" size="12" style="border:0px;border-bottom:#000000 1px solid;width: 60px;"/>
        	%，其中目录内药品占药品总费用比例不低于
        </div>
        <div style="padding-top: 3px;" align="left">
        	85%。自费药品占药品总费用比例
        	<input type="text" class="options" currentPage="7" name="option6" order-name="2" value="<% if (flag == "1"){%><%=options[5] %><%}else{%><%=protocols[5] %><%}%>" size="12" style="border:0px;border-bottom:#000000 1px solid;width: 60px;"/>
        	%以下。乙方被确认为城镇居民基本医疗保险门
        </div>
        <div style="padding-top: 3px;" align="left">
        	诊统筹定点医疗机构的，应按照国家及省相关规定配备和使用基本药物。
        </div>
   </div>
</div>

<!-- 第七页 end-->
<!-- 第八页 -->
<div class="protocol" align="center" style="position: absolute;display: none;width: 67%;">
   <div class="common" style="width:100%;margin-top: 10px;padding-left: 37%">
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	第二十六条  医师开具西药处方须符合西医疾病诊治原则，开具中成药处方须遵循中
        </div>
        <div style="padding-top: 3px;" align="left">
        	医辩证施治原则和理法方药，对于每一最小分类下的同类药品原则上不宜叠加使用。要采取
        </div>
        <div style="padding-top: 3px;" align="left">
        	措施鼓励医师按照先甲类后乙类、先口服制剂后注射制剂、先常释剂型后缓（控）释剂型等
        </div>
        <div style="padding-top: 3px;" align="left">
        	原则选择药品，鼓励药师在调配药品时首先选择相同品种剂型中价格低廉的药品。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	 对《药品目录》中限定使用范围的药品，乙方应严格执行，并提供相关佐证材料便
        </div>
        <div style="padding-top: 3px;" align="left">
        	 于甲方核查。严格掌握药品适应症和用药原则，凡超出药品说明书适应症和使用量以外的用
        </div>
        <div style="padding-top: 3px;" align="left">
        	 药，甲方不予支付费用。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	 第二十七条  乙方提供的药品应有小包装。参保人员出院时，乙方只能提供与疾病治
        </div>
        <div style="padding-top: 3px;" align="left">
        	 疗有关的药品（限口服药），急性病不得超过7天量，慢性病不得超过15天量，品种数不得
        </div>
        <div style="padding-top: 3px;" align="left">
        	 超过4个。不得带检查和治疗项目出院。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	 第二十八条  甲方随时受理具有申报资质的定点医疗机构对目录内药品的补充申报，
        </div>
        <div style="padding-top: 3px;" align="left">
        	 申报同时报送药品的定价依据相关材料。乙方使用经相关部门批准生产和核定价格且符合
        </div>
        <div style="padding-top: 3px;" align="left">
        	《药品目录》支付范围的医院内制剂，其费用甲方按规定予以支付，并限于乙方内部使用；
        </div>
        <div style="padding-top: 3px;" align="left">
        	医院制剂相关信息变更时，乙方应及时向甲方提出信息变更申请；乙方因未及时申报符合药
        </div>
        <div style="padding-top: 3px;" align="left">
        	品目录规定的药品，影响参保患者医疗待遇的，乙方应承担相应责任。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	 第二十九条  乙方购销存药品及耗材过程中，应严格按国家相关法律法规管理。乙方
        </div>
        <div style="padding-top: 3px;" align="left">
        	 应当建立植入类医疗器械使用内部申请制度，永久保存并按规定向参保患者或甲方检查人
        </div>
        <div style="padding-top: 3px;" align="left">
        	 员提供使用记录。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	 第三十条  乙方应遵守大型诊疗设备备案制度，严格掌握各项化验和检查的适应症，不能
        </div>
   </div>
</div>
<!-- 第八页end -->

<!-- 第九页-->
<div class="protocol" align="center" style="position: absolute;display: none;width: 67%;">
   <div class="common" style="width:100%;margin-top: 10px;padding-left: 37%">
        <div style="padding-top: 3px;" align="left">
        	将特殊检查项目（如彩超、CT、MRI等）列为常规检查。应建立特殊检查项目内部申请审
        </div>
        <div style="padding-top: 3px;" align="left">
        	核制度，有关资料存档备查。甲方对特殊检查治疗实行阳性控制指标，CT>60%、ECT>
        </div>
        <div style="padding-top: 3px;" align="left">
        	70%、MRI>70%。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	 第三十一条  乙方应当按照省和本统筹地区医疗服务项目和价格收费标准及其说明等
        </div>
        <div style="padding-top: 3px;" align="left">
        	规定进行收费。未经卫生计生部门和价格主管部门批准的项目不得收费，不得套用、提高
        </div>
        <div style="padding-top: 3px;" align="left">
        	收费标准或分解收费。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	 乙方经卫生计生和价格主管部门批准的新收费项目，应当凭批准文件和有关材料向甲
        </div>
        <div style="padding-top: 3px;" align="left">
        	方申请，双方对申请项目经协商谈判确定医保支付标准的,按医保支付标准执行；未经同
        </div>
        <div style="padding-top: 3px;" align="left">
        	意的，其费用甲方不予支付。乙方以科研、临床验证为目的收治参保人员所发生的相关费
        </div>
        <div style="padding-top: 3px;" align="left">
        	用，甲方不予支付。
        </div>
        <div style="padding-top: 3px;" align="left">
        	<span style="padding-left: 30%;font-size: 20px;">第四章  费用结算管理</span>
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	 第三十二条  基本医疗保险基金实行预算管理，甲方在当年基金收入预算的基础上，根
        </div>
        <div style="padding-top: 3px;" align="left">
        	据近年医疗保险基金实际支付情况，结合参保人数、年龄结构、疾病谱变化、政策调整和
        </div>
        <div style="padding-top: 3px;" align="left">
        	待遇水平等因素，科学编制年度基金支出预算。经双方协商同意，住院医疗费用的费用给
        </div>
        <div style="padding-top: 3px;" align="left">
        	付标准如下：
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	1、确定乙方为城镇职工基本医疗保险总额控制付费方式管理定点医疗机构，本年度住
        </div>
        <div style="padding-top: 3px;" align="left">
        	院统筹费用总额控制指标（以下简称为总控指标）为
        	<input type="text" class="options" currentPage="9" name="option7" order-name="1" value="<% if (flag == "1"){%><%=options[6] %><%}else{%><%=protocols[6] %><%}%>" size="12" style="border:0px;border-bottom:#000000 1px solid;width: 120px;"/>
        	万元，将年度总控
        </div>
        <div style="padding-top: 3px;" align="left">
        	指标按12个月平均分配，实行按月申报，审核结算。乙方申报费用在月份额度内的，甲
        </div>
        <div style="padding-top: 3px;" align="left">
        	方按申报额支付；超出月份额度的，甲方按月份额度支付，超出部分甲方暂缓支付，年终
        </div>
   </div>
</div>

<!-- 第九页end -->

<!-- 第10页-->
<div class="protocol" align="center" style="position: absolute;display: none;width: 67%;">
   <div class="common" style="width:100%;margin-top: 10px;padding-left: 37%">
        <div style="padding-top: 3px;" align="left">
        	清算时一并计算。甲方可在年度中期或年终清算方案中对上述额度作适当调整。原则上平
        </div>
        <div style="padding-top: 3px;" align="left">
        	均每一住院人次结算费用应控制在
        	<input type="text" class="options" currentPage="10" order-name="1" name="option8" value="<% if (flag == "1"){%><%=options[7] %><%}else{%><%=protocols[7] %><%}%>" size="12" style="border:0px;border-bottom:#000000 1px solid;width: 120px;"/>
        	元。连续一个月以上没有住院费用结
        </div>
        <div style="padding-top: 3px;" align="left">
        	算的，总控指标按月核减。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	乙方第四季度的住院人次及住院医疗费不得超出或低于前三个季度均数的15%，并与
        </div>
        <div style="padding-top: 3px;" align="left">
        	年终清算挂钩。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	2、职工基本医疗保险甲方按年度平均每一住院人次结算费用
        	<input type="text" class="options" currentPage="10" name="option9" order-name="2" value="<% if (flag == "1"){%><%=options[8] %><%}else{%><%=protocols[8] %><%}%>" size="12" style="border:0px;border-bottom:#000000 1px solid;width: 60px;"/>
        	元与乙方结算，
        </div>
        <div style="padding-top: 3px;" align="left">
        	实际费用高于或等于住院次均结算费用指标按住院次均结算费用指标结算，实际费用低于
        </div>
        <div style="padding-top: 3px;" align="left">
        	住院次均结算费用指标按指标结算，原则上一个年度内住院统筹费用总额应控制在不超过
        </div>
        <div style="padding-top: 3px;" align="left">
        	<input type="text" class="options" currentPage="10" name="option10" order-name="3" value="<% if (flag == "1"){%><%=options[9] %><%}else{%><%=protocols[9] %><%}%>" size="12" style="border:0px;border-bottom:#000000 1px solid;width: 185px;"/>
        	万元。居民基本医疗保险甲方按年度平均每一住院人次结算
        </div>
        <div style="padding-top: 3px;" align="left">
        	费用
        	<input type="text" class="options" currentPage="10" name="option11" order-name="4" value="<% if (flag == "1"){%><%=options[10] %><%}else{%><%=protocols[10] %><%}%>" size="12" style="border:0px;border-bottom:#000000 1px solid;width: 120px;"/>
        	元与乙方结算。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	乙方第四季度的住院人次及住院医疗费不得超出或低于前三个季度均数的15%，并与
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	3、精神类专科医院专科疾病治疗，城镇职工医疗保险平均住院床日费用按
        	<input type="text" class="options" currentPage="10" name="option12" order-name="5" value="<% if (flag == "1"){%><%=options[11] %><%}else{%><%=protocols[11] %><%}%>" size="12" style="border:0px;border-bottom:#000000 1px solid;width: 55px;"/>
        	元
        </div>
        <div style="padding-top: 3px;" align="left">
        	结算，乙方年度总床日数不超过
        	<input type="text" class="options" currentPage="10" name="option13" order-name="6" value="<% if (flag == "1"){%><%=options[12] %><%}else{%><%=protocols[12] %><%}%>" size="12" style="border:0px;border-bottom:#000000 1px solid;width: 105px;"/>
        	天；城镇居民医疗保险平均住院床日费用
        </div>
        <div style="padding-top: 3px;" align="left">
        	按
        	<input type="text" class="options" currentPage="10" name="option14" order-name="7" value="<% if (flag == "1"){%><%=options[13] %><%}else{%><%=protocols[13] %><%}%>" size="12" style="border:0px;border-bottom:#000000 1px solid;width: 85px;"/>
        	元结算，乙方年度总床日数不超过
        	<input type="text" class="options" currentPage="10" name="option15" order-name="8" value="<% if (flag == "1"){%><%=options[14] %><%}else{%><%=protocols[14] %><%}%>" size="12" style="border:0px;border-bottom:#000000 1px solid;width: 85px;"/>
        	天。按床日费用结算的精
        </div>
        <div style="padding-top: 3px;" align="left">
        	神病专科医院收治长期住院参保患者可每两个月做一次在院结算，结算费用必须为当次结算
        </div>
        <div style="padding-top: 3px;" align="left">
        	期内的全部费用。每年度末（12月31日前）将所有患者办理一次出院结算。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	4、乙方为单病种结算定点医疗机构，可对符合规定的住院费用按单病种结算，甲方需
        </div>
        <div style="padding-top: 3px;" align="left">
        	根据级别不同规定统筹金支付额和个人负担限额，个人不设起付标准，治疗过程中不受基本
        </div>
        <div style="padding-top: 3px;" align="left">
        	医疗保险药品、诊疗项目和服务设施支付范围限制。应由医疗保险基金支付的，乙方记账后，
        </div>
   </div>
</div>

<!-- 第10页end -->


<!-- 第11页-->
<div class="protocol" align="center" style="position: absolute;display: none;width: 67%;">
   <div class="common" style="width:100%;margin-top: 10px;padding-left: 37%">
        <div style="padding-top: 3px;" align="left">
        	按月向甲方申报结算。单病种结算费用记入总额控制指标统一清算。   甲方应根据政策调整、
        </div>
        <div style="padding-top: 3px;" align="left">
        	物价上涨等因素，适时调整医保统筹支付标准。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	5、职工基本医疗保险统筹支付的费用包括基本医疗保险统筹基金、大额医疗救助金、
        </div>
        <div style="padding-top: 3px;" align="left">
        	公务员医疗补助金支付或部分支付的费用。居民医疗保险结算费用包括基本医疗保险统筹
        </div>
        <div style="padding-top: 3px;" align="left">
        	基金支付或部分支付的费用。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	6、医疗照顾人员在乙方住院所发生的结算费用，统一纳入哈尔滨市城镇职工基本医
        </div>
        <div style="padding-top: 3px;" align="left">
        	疗保险基金结算申报表中，按照城镇职工基本医疗保险的付费方式和结算办法统一管理。
        </div>
        <div style="padding-top: 3px;" align="left">
        	年度终结后，医疗照顾人员超出普通参保患者住院待遇部分，如乙方发生住院超支情况，
        </div>
        <div style="padding-top: 3px;" align="left">
        	将给予相应补偿。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	7、城镇居民在乙方发生大病保险医疗费用，由乙方先行垫付，中国人寿保险股份有
        </div>
        <div style="padding-top: 3px;" align="left">
        	病保险医疗费用全额拨付乙方。甲方负责督促中国人寿保险股份有限公司黑龙江省分公
        </div>
        <div style="padding-top: 3px;" align="left">
        	司按时足额拨付乙方大病保险医疗费用。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	第三十三条  乙方必须严格掌握入院标准和出院标准及重症监护病房收治标准，经双
        </div>
        <div style="padding-top: 3px;" align="left">
        	方协商：职工医疗保险以参保人员每百门(急)诊人次的比例核定住院结算人次，乙方
        </div>
        <div style="padding-top: 3px;" align="left">
        	每百门(急)诊住院人次核定为
        	<input type="text" class="options" currentPage="11" name="option16" order-name="1" value="<% if (flag == "1"){%><%=options[15] %><%}else{%><%=protocols[15] %><%}%>" size="12" style="border:0px;border-bottom:#000000 1px solid;width: 40px;"/>
        	，实际住院人次与住院人数之比核定为
        	<input type="text" class="options" currentPage="11" name="option17" order-name="2" value="<% if (flag == "1"){%><%=options[16] %><%}else{%><%=protocols[16] %><%}%>" size="12" style="border:0px;border-bottom:#000000 1px solid;width: 40px;"/>
        	，按年度
        </div>
        <div style="padding-top: 3px;" align="left">
        	结算，超出部分甲方将根据实际情况核减结算人次。乙方要按照有关规定，年住院参保人员
        </div>
        <div style="padding-top: 3px;" align="left">
        	的次均费用中自费部分比例平均不得超过
        	<input type="text" class="options" currentPage="11" name="option18" order-name="3" value="<% if (flag == "1"){%><%=options[17] %><%}else{%><%=protocols[17] %><%}%>" size="12" style="border:0px;border-bottom:#000000 1px solid;width: 40px;"/>
        	%，超过部分甲方在年终结算时扣除。同时
        </div>
        <div style="padding-top: 3px;" align="left">
        	，自费部分必须全额统计在《哈尔滨市职工（居民）医疗保险住院费用结算单》中。
        </div>
   </div>
</div>

<!-- 第11页end -->

<!-- 第12页-->
<div class="protocol" align="center" style="position: absolute;display: none;width: 67%;">
   <div class="common" style="width:100%;margin-top: 10px;padding-left: 37%">
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	第三十四条  甲方应认真执行《哈尔滨市城镇职工基本医疗保险费用结算暂行办法》
        </div>
        <div style="padding-top: 3px;" align="left">
        	的有关规定，城镇居民医疗保险结算方式参照城镇职工医疗保险有关规定执行。乙方不得减
        </div>
        <div style="padding-top: 3px;" align="left">
        	少或虚报服务数量、降低服务质量标准，不得将费用控制标准分解到每个具体参保患者。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	第三十五条  乙方应按甲方下达的住院总控指标、住院次均费用定额结算指标、住院
        </div>
        <div style="padding-top: 3px;" align="left">
        	人次合理增长比例和自费比例等医疗费用控制指标管理，并应保证医疗质量，降低重复住院
        </div>
        <div style="padding-top: 3px;" align="left">
        	发生情况等原因造成乙方费用超支，年度终结后经甲方审核认定（扣减违规不合理费用），
        </div>
        <div style="padding-top: 3px;" align="left">
        	可根据当年基金收支实际情况，按照超支部分分担、结余全部次年留用原则，年度清算时制
        </div>
        <div style="padding-top: 3px;" align="left">
        	定相应具体医疗费用超支补偿方案。本年度住院超支部分分担补偿范围为：乙方年度总控指
        </div>
        <div style="padding-top: 3px;" align="left">
        	标（或住院次均结算总额）的10%左右，按阶梯式递减分担补偿。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	第三十六条  甲乙双方应积极研究探索参保患者医疗费用结算支付方式，尽可能避免
        </div>
        <div style="padding-top: 3px;" align="left">
        	乙方垫付过多费用。甲方及时审核并按规定向乙方拨付应由医疗保险基金支付的医疗费用。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	第三十七条  甲方通过智能监控、实地检查等多种方式，对乙方提供的医疗服务进行
        </div>
        <div style="padding-top: 3px;" align="left">
        	监督审核，对于乙方发生的不合理费用，甲方有权拒付相关费用。乙方如有异议，可在接到
        </div>
        <div style="padding-top: 3px;" align="left">
        	拒付通知后20个工作日内向甲方作出书面说明，甲方根据实际情况进行相应处理。乙方违
        </div>
        <div style="padding-top: 3px;" align="left">
        	规行为涉及的项目费用，按照上传的违规项目整体费用计算。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	第三十八条  乙方应按照医保相关规定为参保人员即时结算医疗费用。参保人员在乙
        </div>
        <div style="padding-top: 3px;" align="left">
        	方就医结算时，只需交纳按规定应当由参保人员个人承担的费用，乙方应当开具专用票据。
        </div>
        <div style="padding-top: 3px;" align="left">
        	其余费用由甲方按本协议与乙方结算。乙方应向患者或家属出具由市医保信息系统提供的
        </div>
        <div style="padding-top: 3px;" align="left">
                                  《哈尔滨市职工（居民）医疗保险住院费用结算单》、《哈尔滨市城镇居民大病保险住院结
        </div>
   </div>
</div>

<!-- 第12页end -->

<!-- 第13页-->
<div class="protocol" align="center" style="position: absolute;display: none;width: 67%;">
   <div class="common" style="width:100%;margin-top: 10px;padding-left: 37%">
        <div style="padding-top: 3px;" align="left">
                                  算单》及《医疗费用明细表》，并由参保患者或其家属签字确认，出院结算的费用总额必须
        </div>
        <div style="padding-top: 3px;" align="left">
                                  与所有住院处方汇总费用相符。乙方应在72小时内为需要转院继续治疗的参保人员完成出院
        </div>
        <div style="padding-top: 3px;" align="left">
                                  费用结算。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	第三十九条  乙方确定为哈尔滨市统筹地区之外异地定点医疗机构的，原则上应按当地物
        </div>
        <div style="padding-top: 3px;" align="left">
                                  价部门规定的医疗服务项目及价格规定执行，并与黑龙江省医疗服务价格项目相对应， 高于
        </div>
        <div style="padding-top: 3px;" align="left">
                                 黑龙江省价格标准的，差价部分由参保患者个人承担，低于黑龙江省价格标准的，应按实际
        </div>
        <div style="padding-top: 3px;" align="left">
                                  价格录入。未列入黑龙江省医疗服务价格项目的，应由参保患者个人承担。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	第四十条  甲方每月按乙方申报确认的医保支付金额的90%拨付，另10%部分年终经考核
        </div>
        <div style="padding-top: 3px;" align="left">
                                  评分后一次拨付。乙方须于每月初前5个工作日（节假日顺延）核对上月发生的结算数据  ，无
        </div>
        <div style="padding-top: 3px;" align="left">
                                误后要及时进行网上申报确认。当月未发生业务的也需按要求进行网上申报确认。乙方需指定
        </div>
        <div style="padding-top: 3px;" align="left">
                                  一名操作员专门负责医保网上申报结算确认工作，并且要求实名制录入相关信息。 因乙方原
        </div>
        <div style="padding-top: 3px;" align="left">
                                 因网上申报不及时的，甲方将暂停拨付相关费用，待乙方申报确认报告甲方后，年度终结清
        </div>
        <div style="padding-top: 3px;" align="left">
                                  算前拨付；上年度申报数据次年2月份仍未申报的，由系统按上传中心数据统一自动确认。乙
        </div>
        <div style="padding-top: 3px;" align="left">
                                 方 应在1月前5个工作日（节假日顺延）报送上年度数据纸介结算报表，未及时报送的，暂缓
        </div>
        <div style="padding-top: 3px;" align="left">
                                  拨付月结算费用。甲方应为乙方提供本年度和上年度费用发 生及拨付情况的查询服务。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	第四十一条  乙方进行住院退结算操作，应向甲方提出书面申请，甲方批准后方可 进行。
        </div>
        <div style="padding-top: 3px;" align="left">
                                 如因退结算导致乙方当月申报数据出现负值，甲方将在乙方未支付的费用中予以扣除。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	经甲方核实的乙方违规行为涉及的结算费用统筹支付为零的，按照乙方定额结算指标或上
        </div>
        <div style="padding-top: 3px;" align="left">
                                 年度人均费用核定。
        </div>
   </div>
</div>

<!-- 第13页end -->

<!-- 第14页-->
<div class="protocol" align="center" style="position: absolute;display: none;width: 67%;">
   <div class="common" style="width:100%;margin-top: 10px;padding-left: 37%">
        
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	第四十二条  职工基本医疗保险参保人员处于欠费封锁状态住院治疗时，乙方应按正常状
        </div>
        <div style="padding-top: 3px;" align="left">
                                  态录入医保系统，并按医保患者相关规定统一管理。出院时仍处于封锁状态的，应在医保系
        </div>
        <div style="padding-top: 3px;" align="left">
                                  统内自费结算。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    第四十三条  乙方如发生医疗纠纷或医疗责任事故，应自发生之日起15日内以书面形式通
        </div>
        <div style="padding-top: 3px;" align="left">
                                   知甲方。在医疗事故鉴定委员会做出是否属于医疗事故之前，该纠纷涉及的费用，甲方暂不
        </div>
        <div style="padding-top: 3px;" align="left">
                                   予支付。经认定为医疗事故的，由于医疗事故及其后续治疗所产生的医疗费用甲方不予支付。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    第四十四条   解除定点服务协议的，乙方自收到《哈尔滨城镇职工（居民）基本医疗保险
        </div>
        <div style="padding-top: 3px;" align="left">
                                   清算告知单》之日起十个工作日内完成未申报和未结算费用的处理工作；超过十个工作日仍
        </div>
        <div style="padding-top: 3px;" align="left">
                                   未申报确认的费用，甲方将统一审核确认；仍在院未结算的相关费用数据，甲方将作为无效
        </div>
        <div style="padding-top: 3px;" align="left">
                                   数据予以处理。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    第四十五条  乙方对于15日内非急诊、急救的以同一疾病入同一所医院的患者所发生的费
        </div>
        <div style="padding-top: 3px;" align="left">
                                   用，按一次住院结算指标核算。参保人员住院发生的医疗费用不足定点医疗机构相应起付标
        </div>
        <div style="padding-top: 3px;" align="left">
                                   准的，不计算一个平均住院结算人次指标。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    第四十六条  乙方应采取有效措施减轻参保患者的个人负担。在其住院期间不得诱导参保患
        </div>
        <div style="padding-top: 3px;" align="left">
                                    者到院外购买药品、器械等方式增加患者个人负担。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    第四十七条  甲方根据医疗保险政策和本协议指标以及参保人员满意度等内容对乙方医疗保
        </div>
        <div style="padding-top: 3px;" align="left">
                                    险医疗服务进行年度考评。甲方可以委托第三方就参保人员满意度进行调查。
        </div>
   </div>
</div>

<!-- 第14页end -->


<!-- 第15页-->
<div class="protocol" align="center" style="position: absolute;display: none;width: 67%;">
   <div class="common" style="width:100%;margin-top: 10px;padding-left: 37%">
        <div style="padding-top: 3px;" align="left">
        	<span style="padding-left: 25%;font-size: 20px;">第五章  信息传输管理</span>
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	第四十八条  甲乙双方应满足对方的信息安全管理要求，保证双方信息系统的安全性
        </div>
        <div style="padding-top: 3px;" align="left">
                                  及可靠性。甲方应保障医疗保险信息系统中参保人员信息、政策参数等基础信息的准确
        </div>
        <div style="padding-top: 3px;" align="left">
                                  性。乙方必须具备规范的医院管理信息系统（以下简称：HIS系统），并积极推进HIS
        </div>
        <div style="padding-top: 3px;" align="left">
                                  系统接口建设工作，保证信息系统符合甲方的技术和接口标准，在规定时限内 实现与医
        </div>
        <div style="padding-top: 3px;" align="left">
                                 保信息系统有效对接。乙方应及时做好因医疗保险政策及业务流程调整带来的HIS系统
        </div>
        <div style="padding-top: 3px;" align="left">
                                  升级工作。
        </div>
       
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                乙方应将参保人员基本住院信息在入院24小时（节假日顺延）内及时上传。因医保卡
        </div>
        <div style="padding-top: 3px;" align="left">
                                 丢失、欠费补费等特殊情况急需住院治疗的，经医院医保办核实后可延长至七个工作日。
        </div>
        <div style="padding-top: 3px;" align="left">
                                 乙方应如实准确的录入参保患者入院及出院诊断信息，存在多个诊断的，应一并上传。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                第四十九条  甲乙双方应当严格遵守国家、省、市信息系统安全管理的相关规定。双方
        </div>
        <div style="padding-top: 3px;" align="left">
                                 应协调做好医保信息系统的安全工作，保障网络畅通、系统稳定运行，确保数据传输高效
        </div>
        <div style="padding-top: 3px;" align="left">
                                 、参保人员结算方便快捷，保证参保人员基本信息和结算信息的完整性、准确性和安全性。
        </div>
        <div style="padding-top: 3px;" align="left">
                                 乙方须及时准确录入、传送参保患者的数据，并确保传送数据与实际发生费用的一致性。
        </div>
        <div style="padding-top: 3px;" align="left">
                                 甲乙双方不得泄露参保人员参保就医等有关信息。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                第五十条  甲乙双方信息系统出现故障，应有应急对策，双方均有义务向参保人做好解
        </div>
        <div style="padding-top: 3px;" align="left">
                                 释工作，不得推诿、扯皮。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                第五十一条  甲方负责医疗保险计算机管理系统的软件开发、网络建设和对相关人员培训。
        </div>
        <div style="padding-top: 3px;" align="left">
                                 乙方应设置信息管理科室，明确专人负责信息系统管理及设备的保养和维护。信息管理科
        </div>
   </div>
</div>

<!-- 第15页end -->


<!-- 第16页-->
<div class="protocol" align="center" style="position: absolute;display: none;width: 67%;">
   <div class="common" style="width:100%;margin-top: 10px;padding-left: 37%">
        
        <div style="padding-top: 3px;" align="left">
                                 室应与医保科室相互配合，明确岗位职责，合理设置信息系统管理权限。通讯费、终端设备
        </div>
        <div style="padding-top: 3px;" align="left">
                                 及维修费用由乙方负担。
        </div>
        <div style="padding-top: 3px;" align="left">
        	<span style="padding-left: 30%;font-size: 20px;">第六章  违约责任</span>
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                第五十二条  甲方有下列情形之一的，乙方可要求甲方纠正，或提请人力资源和社会
        </div>
        <div style="padding-top: 3px;" align="left">
                                保障 行政部门督促甲方整改：
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           1、未及时告知乙方医疗保险政策和管理制度、操作流程变化情况的。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           2、未按本协议规定进行医疗费用结算的。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           3、工作人员违反《社会保险工作人员纪律规定》的。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           4、其他违反基本医疗保障法律、法规行为的。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               第五十三条  甲方可根据乙方违约情节的轻重，予以约谈乙方主要负责人、限期整改、
        </div>
        <div style="padding-top: 3px;" align="left">
                                 通报批评、暂缓拨付、拒付费用、扣除定额结算指标（指实行定额结算的定点医疗机
        </div>
        <div style="padding-top: 3px;" align="left">
                                 构）、暂停服务、解除协议、移交人力资源和社会保障行政部门等处理。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          1、过度检查、过度治疗，违反用药管理规定、超适应症用药，或违反物价政策、分解
        </div>
        <div style="padding-top: 3px;" align="left">
                                 收费的；
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          2、将基本医疗保险范围外的医疗费用纳入医保支付的,串换医保目录内外项目，申报
        </div>
        <div style="padding-top: 3px;" align="left">
                              与实际使用不符，虚构服务量的；
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          3、隐瞒事实或阻挠甲方监督、管理工作，不及时按甲方要求提供医疗服务相关资料的；
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          4、将甲方因乙方违规行为而拒付的费用，转嫁于参保患者的； 
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          5、挂床住院、分解住院，将不符合入院标准的参保人员收治入院，推诿符合入院标准的
        </div>
   </div>
</div>

<!-- 第16页end -->

<!-- 第17页-->
<div class="protocol" align="center" style="position: absolute;display: none;width: 67%;">
   <div class="common" style="width:100%;margin-top: 10px;padding-left: 37%">
        
        <div style="padding-top: 3px;" align="left">
                                 参保人员入院治疗，将不符合出院标准的患者催赶出院或令其自费住院 ，将住院期间需
        </div>
        <div style="padding-top: 3px;" align="left">
                                 院内转科治疗的参保人员，办理中途出院结算手续的；
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          6、以医保定点名义从事商业广告和促销活动，诱导不符合入院标准的参保人员就医；
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          7、通过冒名顶替就医、伪造医疗文书或凭证等手段，骗取医保基金的；
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          8、使用假、劣药品或医用材料的；
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          9、将科室或房屋承包、出租给个人或其他机构，并以本医疗机构名义开展诊疗活动，
        </div>
        <div style="padding-top: 3px;" align="left">
                             且发生医保费用结算的；
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          10、私自联网并申请结算有关医保费用、为未取得医保定点资格的医疗机构提供医保
        </div>
        <div style="padding-top: 3px;" align="left">
                              结算服务，或超出《医疗机构执业许可证》准许范围、执业地址提供医疗服务项目，并发生
        </div>
        <div style="padding-top: 3px;" align="left">
                              医保费用结算的；
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          11、其他违反医疗保险政策规定，造成医疗保险基金损失或造成严重社会影响的。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               第五十四条  甲方在监管过程中，发现乙方存在严重违规情况时，可委托第三方机构进
        </div>
        <div style="padding-top: 3px;" align="left">
                               行延伸检查。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               第五十五条  甲方可根据乙方医保医师违约情节的轻重，对乙方医保医师予以扣分、约
        </div>
        <div style="padding-top: 3px;" align="left">
                              谈、通报、暂停服务资格、取消申请资格等处理。甲方可将发生严重违规问题的乙方医保医
        </div>
        <div style="padding-top: 3px;" align="left">
                              师相应情况通报卫生计生部门。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               第五十六条  乙方停业、歇业或迁移经营地址时间超过3个月未发生医保费用结算的，解
        </div>
        <div style="padding-top: 3px;" align="left">
                               除服务协议。
        </div>
   </div>
</div>

<!-- 第17页end -->

<!-- 第18页-->
<div class="protocol" align="center" style="position: absolute;display: none;width: 67%;">
   <div class="common" style="width:100%;margin-top: 10px;padding-left: 37%">
        
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               第五十七条  收治参保患者住院的定点医疗机构连续12个月没有发生医保住院费用结算
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               ，甲方停止乙方收治参保患者住院服务。1年内不再受理住院申请。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               第五十八条  乙方发生以下情况，甲方解除服务协议，1年内不再受理定点申请。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          1、没有按时签订本年度服务协议的，并超过规定签署时间一个月以上仍未签署的。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          2、主动放弃医疗保险定点的。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          3、连续12个月无医疗保险业务的。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          4、未按规定向甲方申报随意变更经营地址的。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          5、违反协议管理有关规定被暂停服务2次的。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          6、暂停服务期间未进行及时、有效整改的。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          7、乙方被确定为定点医疗机构2个月内无法安装医保专线，未配备完善的软、硬件的。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                             第五十九条  乙方发生以下情况，甲方解除服务协议，2年内不再受理定点申请。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         1、因违反协议管理有关规定被解除服务协议重新申请定点后，再次被暂停服务的。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         2、提供虚假定点申请材料的。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         3、年度内发生三次及以上医疗事故并造成严重后果的。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         4、乙方受到卫生计生部门吊销《医疗机构执业许可证》处罚的。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         5、其他造成严重后果或重大影响的违规行为。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               第六十条  如因乙方涉及民事、行政诉讼或者刑事案件，甲方被相关司法部门列为被执行
        </div>
        <div style="padding-top: 3px;" align="left">
                              人或者协助执行人的，或者其他影响甲方正常工作的情形，甲方可单方决定暂停或终止本协
        </div>
        <div style="padding-top: 3px;" align="left">
                              议，因此所造成的损失由乙方承担。
        </div>
   </div>
</div>

<!-- 第18页end -->
<!-- 第19页-->
<div class="protocol" align="center" style="position: absolute;display: none;width: 67%;">
   <div class="common" style="width:100%;margin-top: 10px;padding-left: 37%">
        <div style="padding-top: 3px;" align="left">
        	<span style="padding-left: 30%;font-size: 20px;">第七章  附则</span>
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               第六十一条  协议执行期间，国家法律、法规和政策有调整的，应按新的规定执行。
        </div>
        <div style="padding-top: 3px;" align="left">
                               若新规定与本协议不一致时，经双方协商，可按照新规定对本协议进行修改和补充，
        </div>
        <div style="padding-top: 3px;" align="left">
                              其效力与 本协议同等。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               第六十二条  协议执行过程中发生的争议，应首先通过协商解决。双方协商不成的，
        </div>
        <div style="padding-top: 3px;" align="left">
                               由人力资源和社会保障行政部门提出处理意见或依法进行仲裁。对人力资源和社会保
        </div>
        <div style="padding-top: 3px;" align="left">
                               障行政部门提出的处理意见不服的，可以提起行政诉讼。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              第六十三条 
             <% 
        		if ("0".equals(valid)) {
        			%>
        			本协议有效期自<%=year%>年01月01日起至<%=year%>年12月31日止。
        			<%
        		}else {
        			%>
        			本协议有效期自<%=WQ_DATE%>起至<%=year %>年12月31日止。
        			<%
        		}
        	%> 
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               第六十四条  协议执行期间，国家法律、法规有调整的，甲乙双方按照新规定执行本
        </div>
        <div style="padding-top: 3px;" align="left">
                              协 议，如无法达成协议，双方可解除协议。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               第六十五条  协议期间，甲乙双方无论以何种理由解除协议，必须提前3个月通知对方；
        </div>
        <div style="padding-top: 3px;" align="left">
                               甲方可根据对乙方履行协议情况的考评结果，作出续签或缓签下年度协议的决定，并通
        </div>
        <div style="padding-top: 3px;" align="left">
                              知乙方。 
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              第六十六条  本协议未尽事宜，经甲乙双方同意，以换文形式进行补充，效力与本协议
        </div>
        <div style="padding-top: 3px;" align="left">
                             相同。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               第六十七条  本协议一式两份，甲乙双方各执一份，具有同等效力。
        </div>
        <div style="padding-top: 3px;" align="left">
        	附件：《哈尔滨市医疗、工伤、生育定点医疗机构服务质量考核办法》
        </div>
        
   </div>
</div>

<!-- 第19页end -->

<!-- 第20页-->
<div class="protocol" align="center" style="position: absolute;display: none;width: 45%;">
   <div class="common" style="width:100%;margin-top: 10%;padding-left: 70%">
        <div style="width: 600px;height:240px;margin-left:-40%;align: left;">
        	<div style="width:60%;height:100%;float: left;">
        		<div style="width:100%;height:20%;float: left;">
        		甲方：哈尔滨市医疗保险管理中心
        		</div>
        		<div style="width:100%;height:20%;float: left;">
        		（盖章）
        		</div>
        		<div style="width:100%;height:20%;float: left;">
        		法人代表：
        		</div>
        		<div style="width:100%;height:20%;float: left;">
        		<% if (flag == "1"){%>
                <%=protocol.getWQ_JNAME() %>
                <%} else {%>
                <%=jinfo.getCORPORATION() %>
                <%} %>
        		</div>
        		<div class="date" style="width:100%;height:20%;float: left;">
        		　<% if (flag == "1"){%>
                <%=protocol.getWQ_JDATE() %>
                <%} %>
        		</div>
        	</div>
        	<div style="width:40%;height:100%;float: right;">
        		<div style="width:100%;height:20%;float: left;">
        		乙方：
        		<% if (flag == "1"){%>
                <%=protocol.getAKB021() %>
                <%} else {%>
                <%=kb01.getAkb021() %>
                <%} %>
        		</div>
        		<div style="width:100%;height:20%;float: left;">
        		（盖章）
        		</div>
        		<div style="width:100%;height:20%;float: left;">
        		法人代表：
        		</div>
        		<div style="width:100%;height:20%;float: left;">
        		
        		<% if (flag == "1"){%>
                <%=protocol.getWQ_NAME()%>
                <%} else {%>
                <%=kb01.getAae004()%>
                <%} %>
        		</div>
        		<div class="date" style="width:100%;height:20%;float: left;">
        		<% if (flag == "1"){%>
                <%=protocol.getWQ_YDATE() %>
                <%} %>
                
        		</div>
        	</div>
        </div>
        <div style="padding-top: 0px;font-weight: bold;" align="left">
        	<input id="select" type="checkbox" name="isagree" checked="<%if(flag == "1"){%>checked<%} %>" value=""/>您是否为法人代表本人或法人代表授权的代理人并已经阅读完本协议
        </div>
        <div style="padding-top: 20px;padding-left: 50px;" align="left">
        	<div id="agree" style="width:120px;height: 40px;background-color: #00FF00;padding-top: 20px;cursor:pointer;" align="center">同意</div>
        	<div id="print" style="width:120px;height: 40px;background-color: #CCCCCC;margin-left: 150px;cursor:pointer;margin-top: -60px;padding-top: 20px;" align="center">打印</div>
        </div>
   </div>
</div>

<!-- 第20页end -->
<div id="prev" style="position: absolute;margin-left: 17%;margin-top: 20%;cursor:pointer;"><img src="<%=basePath %>images/prev.png" alt="上一页" /></div>
<div id="next" style="position: absolute;margin-left: 80%;margin-top: 20%;cursor:pointer;"><img src="<%=basePath %>images/next.png" alt="下一页" /></div>
<div class="hd" style="position: absolute;margin-left: 30%;margin-top: 38%;">
	<ul class="num">
		<li class="point" style="background:#f00;">1</li>
		<% for (int i = 2; i <= 20; i++) {
		    %>
		    <li class="point"><%=i %></li>
		    <%
		} %>
	</ul>
</div>
<div id="pageNum" style="position: absolute;margin-left: 50%;margin-top: 40%">1/20</div>
</body>
</html>
