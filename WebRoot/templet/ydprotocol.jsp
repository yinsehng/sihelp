<%@page import="com.neusoft.bean.Protocol"%>
<%@page import="com.neusoft.util.TimeUtil"%>
<%@page import="com.neusoft.bean.Jinfo"%>
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
	} else {
		WQ_DATE = TimeUtil.getCurrentDate("yyyy年MM月dd日");
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
var LODOP; //声明为全局变量      
function PrintOneURL(url){
	CreatePage();
	var allUrl = "<%=basePath%>" + url;
	LODOP=getLodop();
	LODOP.ADD_PRINT_URL(30,20,746,"95%",allUrl);
	LODOP.SET_PREVIEW_WINDOW(0,0,0,1000,600,"");
	LODOP.SET_SHOW_MODE("SKIN_TYPE",14);	
	LODOP.PREVIEW();
};
function CreatePage(){
	LODOP=getLodop();  
	LODOP.PRINT_INITA(12,14,690,450,"按网址打印");
	LODOP.SET_PRINT_STYLEA(0,"FontSize",30);
	LODOP.SET_PRINT_STYLEA(1,"Horient",2);
};
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
		  //检查今年是否签订协议，没签署你打印个毛
		  $.ajax({
	      	    url:"<%=basePath%>servlet/CheckProtocolServlet?temptime="+Math.random(),
	      	    data:{},  
	      	    type:'GET',
	      	    cache:false, 
	      	    dataType:'text',
	      	    success:function(result) {
	      	    	if (result == "repeat") {
	      	    		//今年已经签署，可以打印
	      	    		SimplePop.confirm("您今年还未签署协议不能进行打印，请确认!",
								  {
							  		type: "error",
							  		title: "安装下载",
							  		opacity: 0.2,
							  		cancel: function(){
					                 }
	      	    		});
	      	    	} else {
	      	    		PrintOneURL(result);
	      	    	}
	      	    },
	      	    error : function() {
	      	    	
	      	    }
	      	});
	  });
	  $("#agree").click(function(){
		  //看是不是已经填写完签署单
		  $.ajax({
    		      	    url:"<%=basePath%>servlet/CheckPersonServlet?temptime="+Math.random(),
    		      	    data:{},  
    		      	    type:'GET',
    		      	    cache:false, 
    		      	    dataType:'text',
    		      	    success:function(result) {
    		      	    	if (result == "1") {
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
    		      		      	    	"TYPE":2, //表示药店
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
	$("#pageNum").text(p+"/8");
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
       <div style="width:100%;padding-left:0%;font-size: 25px;font-weight: bold;">定点零售药店服务</div>
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
        	根据《城镇职工基本医疗保险定点零售药店管理暂行办法》《哈尔滨市城镇基本医疗
        </div>
      	<div style="padding-top: 3px;" align="left">
        	保险暂行办法》及《哈尔滨市城镇基本医疗保险暂行办法》等有关规定，为保证定点零售
        </div>
      	<div style="padding-top: 3px;" align="left">
        	药店为我市参保人员（含离休干部）提供基本医疗保险范围内的服务，甲方确定乙方为城
        </div>
      	<div style="padding-top: 3px;" align="left">
        	镇基本医疗保险定点零售药店。 经双方协商，签订如下协议。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	<font style="font-weight: bold;">第一条</font>  甲乙双方应严格遵守《中华人民共和国药品管理法》、《哈尔滨市城镇基本医
        </div>
        <div style="padding-top: 3px;" align="left">
        	疗保险暂行办法》、《哈尔滨市城镇职工基本医疗保险定点零售药店管理暂行规定》及相关
        </div>
        <div style="padding-top: 3px;" align="left">
        	法律法规。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	<font style="font-weight: bold;">第二条</font>  甲乙双方应对参保人员和药店工作人员进行自觉遵守医疗保险各项规定的宣
        </div>
        <div style="padding-top: 3px;" align="left">
        	传教育；甲乙双方有权向对方提出合理化建议，有权检举和投诉对方工作人员的违规行为。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	<font style="font-weight: bold;">第三条</font> 乙方应达到国家实施《药品经营质量管理规范》(GSP)等规定的要求，有健全
        </div>
        <div style="padding-top: 3px;" align="left">
        	和完善的药品、医疗器械质量保证制度及管理制度，并依据本协议规定，为参保人员提供
        </div>
        <div style="padding-top: 3px;" align="left">
        	基本医疗保险服务。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	<font style="font-weight: bold;">第四条 </font>乙方要按照甲方要求积极推进参保人员基本医疗保险信息查询工作，单独设立
        </div>
        <div style="padding-top: 3px;" align="left">
        	查询区域为参保人员提供免费查询服务。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	<font style="font-weight: bold;">第五条</font>  甲方负责医疗保险计算机管理系统的软件开发、网络建设、人员培训和技术支
        </div>
        <div style="padding-top: 3px;" align="left">
        	持，乙方应根据医疗保险业务需要配置终端设备，与甲方联网实时上传数据。定点结算端应
        </div>
        <div style="padding-top: 3px;" align="left">
        	用过程中所产生的通讯费、终端设备及维修费用由乙方负担，医保信息系统操作员应经甲方
        </div>
        <div style="padding-top: 3px;" align="left">
        	培训上岗。系统操作人员如有变动，需自行做好工作交接。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	<font style="font-weight: bold;">第六条</font>  本协议签订后，乙方应在药店的显要位置悬挂哈尔滨市城镇基本医疗保险定点
        </div>
        <div style="padding-top: 3px;" align="left">
        	零售药店标识，以方便参保人员辨认。
        </div>
   </div>
</div>

<!-- 第三页 -->
<div class="protocol" align="center" style="position: absolute;display: none;width: 67%;">
   <div class="common" style="width:100%;margin-top: 10px;padding-left: 37%">
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	<font style="font-weight: bold;">第七条</font>  甲方应及时向乙方通报基本医疗保险政策规定和业务调整情况。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	<font style="font-weight: bold;">第八条</font>  乙方须使用符合财政等有关部门规定的药店票据，并单独保管、装订。严禁为
        </div>
        <div style="padding-top: 3px;" align="left">
        	参保人员开具虚假发票骗取医保基金。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	<font style="font-weight: bold;">第九条</font>  哈尔滨市城镇职工基本医疗保险个人账户资金在定点零售药店，可购买包括
        </div>
        <div style="padding-top: 3px;" align="left">
                                【健】 字号保健药品在内的所有药品，和血糖检测仪、血压计、频谱治疗仪等医疗保健器械
        </div>
        <div style="padding-top: 3px;" align="left">
                                。在规定范围内个人账户资金也可自愿为家庭成员（包括配偶、祖父母、外祖父母、父 母、
        </div>
        <div style="padding-top: 3px;" align="left">
                               兄弟姐妹、子女、孙子女、外孙子女）使用。乙方应为持卡购药者提供医疗保险药店结算凭 
        </div>
        <div style="padding-top: 3px;" align="left">
                           据。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	  离休人员个人账户资金只能在零售药店购买统筹范围内药品。
        </div>
         <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	<font style="font-weight: bold;">第十条</font>  乙方应为参保人员提供社会保障卡设置或修改密码服务，参保人员如需设置 或
        </div>
        <div style="padding-top: 3px;" align="left">
                                修改密码，即本人可持有效身份证及社会保障卡到药店设置或修改密码，如他人代办，必须
        </div>
        <div style="padding-top: 3px;" align="left">
                               出示社会保障卡所有人和代办人的有效身份证明，乙方不得以任何理由推诿 拒绝。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	<font style="font-weight: bold;">第十一条</font>  乙方所售的药品和医疗保健器械等应据实上传，不得串换商品名称录入医疗保
        </div>
        <div style="padding-top: 3px;" align="left">
        	险管理信息系统。对参保人员使用个人账户及现金同时支付结算费用时（个人账户余额不足）
        </div>
        <div style="padding-top: 3px;" align="left">
        	，应将参保人个人承担部分全额统计在医保结算单中。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	<font style="font-weight: bold;">第十二条</font>  乙方对所售药品要实行明码标价制度，并按药品分类管理规定设立处方药和非
        </div>
        <div style="padding-top: 3px;" align="left">
        	处方药专柜。所购药品为非处方药，不受品种、数量的限制。所购药品为处方药，按处方药量
        </div>
        <div style="padding-top: 3px;" align="left">
        	规定销售。参保人销售单据每日装订成册，保存2年，以备查验。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	<font style="font-weight: bold;">第十三条</font>  参保人员持外配处方到乙方调剂，乙方要严格按照国家处方调剂的规定认真调
        </div>
        <div style="padding-top: 3px;" align="left">
        	剂，严格把关，妥善交付，并给予用药指导。如因调剂不当出现药事责任，由乙方承担赔偿损
        </div>
   </div>
</div>
<!-- 第三页 end -->

<!-- 第四页 -->

<div class="protocol" align="center" style="position: absolute;display: none;width: 67%;">
   <div class="common" style="width:100%;margin-top: 10px;padding-left: 37%">
         <div style="padding-top: 3px;" align="left">
        	失，甲方按有关规定予以相应处理。乙方无正当理由，不得拒绝参保人员按外配处方调剂
        </div>
        <div style="padding-top: 3px;" align="left">
        	的请求，若认定外配处方配伍或剂量有疑义时，要告知参保人员，原开处方的医生修改后
        </div>
        <div style="padding-top: 3px;" align="left">
        	再给予调剂。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	<font style="font-weight: bold;">第十四条</font>  乙方出售的药品和医疗保健器械，必须保证进货渠道正规、进货票据合法、
        </div>
        <div style="padding-top: 3px;" align="left">
        	进货品种齐全，不得出售假药、劣药及不符合标准的医疗保健器械，对售出的药品及医疗
        </div>
        <div style="padding-top: 3px;" align="left">
        	保健器械应有质量保证信誉卡，信誉卡内容包括：品种名称、产地、批号、购买数量金额
        </div>
        <div style="padding-top: 3px;" align="left">
        	及日期等。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	<font style="font-weight: bold;">第十五条</font>  乙方不得擅自联接医保网络并结算费用，或将在非乙方发生的费用通过乙方
        </div>
        <div style="padding-top: 3px;" align="left">
        	上传结算。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	<font style="font-weight: bold;">第十六条</font>  乙方不得利用个人账户、肝肾肺心脏等移植术后抗排异治疗资金串换现金、
        </div>
        <div style="padding-top: 3px;" align="left">
        	销售政策范围外项目，与参保人员、医院合谋骗取医疗保险金等违规违法行为。
        </div>
        
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	<font style="font-weight: bold;">第十七条</font>  购药人持社会保障卡在乙方购药，  当日结算次数超过2次或单笔结算金额超
        </div>
        <div style="padding-top: 3px;" align="left">
        	 过200元的，需由乙方收银人员负责核对购药人有效身份证件（居民身份证、机动车驾驶
        </div>
        <div style="padding-top: 3px;" align="left">
        	 证、户口簿等法定有效证件），并按要求录入购药人身份证号码，  以保证参保人员的个人
        </div>
        <div style="padding-top: 3px;" align="left">
        	 账户资金安全。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	<font style="font-weight: bold;">第十八条</font>  甲方每月按乙方申报确认的医保支付金额的
        	<input type="text" class="options" currentPage="4" name="option1" order-name="1" value="<% if (flag == "1"){%><%=options[0] %><%}else{%><%=protocols[0] %><%}%>" size="12" style="border:0px;border-bottom:#000000 1px solid;width: 20px;"/>
        	％拨付，另
        	<input type="text" class="options" currentPage="4" name="option12" order-name="2" value="<% if (flag == "1"){%><%=options[1] %><%}else{%><%=protocols[1] %><%}%>" size="12" style="border:0px;border-bottom:#000000 1px solid;width: 20px;"/>
        	％部分年终
        </div>
        <div style="padding-top: 3px;" align="left">
        	经考核评分后一次拨付。乙方须于每月初前5个工作日（节假日顺延）核对上月发生的结算
        </div>
        <div style="padding-top: 3px;" align="left">
        	数据，无误后要及时进行网上申报确认。当月未发生业务的也需按要求进行网上申报确认。
        </div>
        <div style="padding-top: 3px;" align="left">
        	乙方需指定一名操作员专门负责医保网上申报结算确认工作，要 求 实 名 制录入相关信息。
        </div>
   </div>
</div>

<!-- 第四页end -->
<!-- 第五页 -->

<div class="protocol" align="center" style="position: absolute;display: none;width: 67%;">
   <div class="common" style="width:100%;margin-top: 10px;padding-left: 37%">
        
        <div style="padding-top: 3px;" align="left">
        	因乙方原因网上申报不及时的，甲方将暂停拨付相关费用，待乙方申报确认报告甲方后
        </div>
        <div style="padding-top: 3px;" align="left">
                                    ，年度终结清算前拨付；上年度申报数据次年2月份仍未申报的，  由系统按上传中心数据
        </div>
         <div style="padding-top: 3px;" align="left">
        	统一自动确认。  乙方应在1月前5个工作日（节假日顺延）报送上年度数据纸介结算报表，
        </div>
        <div style="padding-top: 3px;" align="left">
        	未及时报送的，  暂缓拨付月结算费用。甲方应为乙方提供本年度和上年度费用发生及拨付
        </div>
        <div style="padding-top: 3px;" align="left">
        	情况的查询服务。
        </div>
        <div style="padding-top: 3px;" align="left">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	<font style="font-weight: bold;">第十九条</font>乙方应积极配合甲方查询调用进出货清单、调剂记录、处方、账单、收据及
        </div>
        <div style="padding-top: 3px;" align="left">
                                    有关文件资料，不得拒绝；乙方拒绝提供资料或所提供的资料与事实不符的， 甲方有权停
        </div>
        <div style="padding-top: 3px;" align="left">
        	止其定点服务并暂  缓拨付相关费用。
        </div>
        <div style="padding-top: 3px;" align="left">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	<font style="font-weight: bold;">第二十条</font>协议履行期间，乙方变更地址、名称及法定代表人，  休业或停业等情况，
        </div>
        <div style="padding-top: 3px;" align="left">
                                   应当在获得有关行政部门批准变更登记后10个工作日内，通过网络（电子邮箱形式）向甲
        </div>
        <div style="padding-top: 3px;" align="left">
        	方申请变更，变更时需提供行政主管部门批准材料电子扫描图片等材料。
        </div>
        <div style="padding-top: 3px;" align="left">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	<font style="font-weight: bold;">第二十一条</font>  为保证月结算费用及时准确到账，新申请定点的零售药店应及时向甲方 提
        </div>
        <div style="padding-top: 3px;" align="left">
                                   供银行账户等财务相关手续。乙方因名称变更的，还应同时办理银行账户变更手续。
        </div>
        <div style="padding-top: 3px;" align="left">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	<font style="font-weight: bold;">第二十二条</font>   除一方严重违约外，任何一方须解除协议时，必须提前3个月通知对方。
        </div>
        <div style="padding-top: 3px;" align="left">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	<font style="font-weight: bold;">第二十三条</font>   乙方如发生违规行为或被参保人员举报、投诉，甲方有权在调查期间
        </div>
        <div style="padding-top: 3px;" align="left">
        	暂缓拨付乙方发生的相关费用。
        </div>
        <div style="padding-top: 3px;" align="left">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	<font style="font-weight: bold;">第二十四条</font>  甲方将根据《考核办法》等有关规定具体量化考核管理乙方的服务行为。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	<font style="font-weight: bold;">第二十五条</font>  乙方必须严格执行国家和省、市各项医保政策规定， 加强自律， 诚信服
        </div>
        <div style="padding-top: 3px;" align="left">
        	务。采取有效措施，积极配合甲方开展医疗保险政策宣传，为广大参保人员提供优质高效
        </div>
        <div style="padding-top: 3px;" align="left">
        	的医疗服务。
        </div>
   </div>
</div>

<!-- 第五页end -->

<!-- 第六页 -->
<div class="protocol" align="center" style="position: absolute;display: none;width: 67%;">
   <div class="common" style="width:100%;margin-top: 10px;padding-left: 37%">
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	<font style="font-weight: bold;">第二十六条</font>  乙方违反本协议有关规定，被甲方解除服务协议的，自解除之日起一年内，
        </div>
        <div style="padding-top: 3px;" align="left">
        	甲方不受理评估乙方定点资格申请。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	<font style="font-weight: bold;">第二十七条</font>  乙方发生以下情况，甲方可解除服务协议，1年内不再受理其定点服务申请。
        </div>
        <div style="padding-top: 3px;" align="left">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	1、没有按时签订本年度服务协议，并超过规定签署时间一个月以上仍未签署的。
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
        	4、随意变更经营地址，未按规定向甲方备案的。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	5、暂停服务期间未进行及时、有效整改的。
        </div>
        <div style="padding-top: 3px;" align="left">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	6、未通过市场监督管理部门年检的。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	7、违反协议管理有关规定，金额巨大、情节恶劣，在社会上造成不良影响的。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	<font style="font-weight: bold;"> 第二十八条</font>  乙方发生以下情况，甲方可解除服务协议，2年内不再受理其定点服务申  请。
        </div>
        <div style="padding-top: 3px;" align="left">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	1、因违反协议管理有关规定被解除服务协议重新申请定点后，再次被暂停服务资格的。
        </div>
        <div style="padding-top: 3px;" align="left">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	2、提供虚假申请材料的。
        </div>
        <div style="padding-top: 3px;" align="left">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	3、被吊销《药品经营许可证》、《营业执照》的。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	4、其他造成严重后果或重大影响的违规行为。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	<font style="font-weight: bold;">第二十九条</font>   因乙方网签协议用户名密码保管不善，导致协议内容泄露的，由乙方承担全
        </div>
        <div style="padding-top: 3px;" align="left">
        	部后果。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	<font style="font-weight: bold;">第三十条</font>  如因乙方涉及民事、行政诉讼或者刑事案件，甲方被相关司法部门列为被执行
        </div>
        <div style="padding-top: 3px;" align="left">
        	人或者协助执行人的，或者其他影响甲方正常工作的情形，甲方可单方决定暂停或终止本协议
        </div>
        <div style="padding-top: 3px;" align="left">
        	，因此所造成的损失由乙方承担。
        </div>
   </div>
</div>
<!-- 第六页 end-->
<!-- 第七页 -->

<div class="protocol" align="center" style="position: absolute;display: none;width: 67%;">
   <div class="common" style="width:100%;margin-top: 10px;padding-left: 37%">
        
        
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	<font style="font-weight: bold;">第三十一条</font>  本协议执行期间出现争议时，由争议双方协商解决；  协商不成的，由
        </div>
        <div style="padding-top: 3px;" align="left">
        	人力资源和社会保障行政部门提出处理意见或依法进行仲裁。  对人力资源和社会保障行
        </div>
        <div style="padding-top: 3px;" align="left">
        	政部门提出的处理意见不服的，可以提起行政诉讼。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	<font style="font-weight: bold;">第三十二条</font>  甲方每年应通过医疗保险计算机管理系统及时通知乙方《服务协议》具
        </div>
        <div style="padding-top: 3px;" align="left">
        	体签署时间，乙方要及时查看网上通知，做好协议签署前准备工作，并及时续签《服务协
        </div>
        <div style="padding-top: 3px;" align="left">
        	议》。规定期内乙方未按时签署服务协议的，甲方有权终止其定点服务。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	<font style="font-weight: bold;">第三十三条</font>  本协议未尽事宜，经甲乙双方同意，可用换文形式进行补充，效力与本
        </div>
         <div style="padding-top: 3px;" align="left">
        	协议相同。
        </div>
        <div style="padding-top: 3px;" align="left">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	<font style="font-weight: bold;">第三十四条</font> 
        	<% 
        		if ("0".equals(valid)) {
        			%>
        			本协议有效期自<%=year%>年01月01日起至<%=year %>年12月31日止。
        			<%
        		}else {
        			%>
        			本协议有效期自<%=WQ_DATE%>起至<%=year %>年12月31日止。
        			<%
        		}
        	%> 
        	
        	
        	本协议一
        </div>
        <div style="padding-top: 3px;" align="left">
        	式两份，甲乙双方各执一份，具有同等效力。
        </div>
        </br>
        <div style="padding-top: 3px;" align="left">
        	附件：哈尔滨市基本医疗保险定点零售药店服务质量考核办法
        </div>
   </div>
</div>

<!-- 第七页 end-->

<!-- 第8页-->
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

<!-- 第8页end -->
<div id="prev" style="position: absolute;margin-left: 17%;margin-top: 20%;cursor:pointer;"><img src="<%=basePath %>images/prev.png" alt="上一页" /></div>
<div id="next" style="position: absolute;margin-left: 80%;margin-top: 20%;cursor:pointer;"><img src="<%=basePath %>images/next.png" alt="下一页" /></div>
<div class="hd" style="position: absolute;margin-left: 40%;margin-top: 38%;">
	<ul class="num">
		<li class="point" style="background:#f00;">1</li>
		<% for (int i = 2; i <= 8; i++) {
		    %>
		    <li class="point"><%=i %></li>
		    <%
		} %>
	</ul>
</div>
<div id="pageNum" style="position: absolute;margin-left: 50%;margin-top: 40%">1/8</div>
</body>
</html>
