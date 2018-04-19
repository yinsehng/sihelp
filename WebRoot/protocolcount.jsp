<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ include file="../../plugin/plugin.jsp"%>
<%
    Integer TOTALNUM = (Integer)request.getAttribute("TOTALNUM");
    Integer VALIDNUM = (Integer)request.getAttribute("VALIDNUM");
    Integer NOVALIDNUM = TOTALNUM - VALIDNUM;
    String series = (String)request.getAttribute("series");
    String xAxis = (String)request.getAttribute("xAxis");
    String WQ_YEAR = (String)request.getAttribute("WQ_YEAR");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>定点医药机构服务协议网签系统</title>
<script type="text/javascript" src="<%=basePath %>plugin/echarts/echarts-all.js"></script>			
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
.text{width: 200px;padding: 2px;}
</style>
</head>

<body>
<form action="<%=basePath %>servlet/ProtocolCountServlet" method="post" id="sform">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="24" bgcolor="#C3D7DA"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="3%" height="19" valign="bottom"><div align="center"><img src="<%=basePath %>images/tb.gif" width="14" height="14" /></div></td>
                <td width="94%" valign="bottom"><span class="STYLE1"><a href="<%=basePath%>right.jsp"><strong>系统首页</strong></a>--><font style="font-weight: normal;">网签协议统计</font></span></td>
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
		网签协议统计列表
 		</td>
      </tr>
     
    </table></td>
  </tr>
  <tr>
	 <td height="40" bgcolor="#FFFFFF" class="STYLE6"  style="text-align: left;" colspan="2">
          <div style="width: 95%;height:40%;float: left;padding:0px 0px 10px 30px;"> 
			 <div style="width:20%;height:100%;float: left;"></div>
			 <div style="width:20%;height:100%;float: left;margin-left: 5px;"></div>
			 <div style="width:20%;height:100%;float: left;margin-left: 5px;">
			 	网签年份：<input placeholder="请输入用查询年份" type="text" class="text" style="width: 150px;" name="WQ_YEAR" value="<%=WQ_YEAR %>"/>
			 </div>
			 <div style="width:20%;height:100%;float: left;margin-left: 5px;">
			 	<input type="submit" value="查询"/><p/>
			 </div>
			 <div style="width:15%;height:100%;float: left;margin-left: 5px;"></div>
		  </div>
		</td>
  </tr>
  <tr>
  </tr>
</table>
	<div style="width: 100%;height: 70%;">
    	<div style="width: 50%;height: 100%;float:left;">
    		<div id="main" style="height:100%;border:1px solid #ccc;"></div>
    	</div>
    	<div style="width: 45%;height: 100%;float:left;">
    		<div id="main2" style="height:100%;border:1px solid #ccc;"></div>
    	</div>
    	
	</div>
</form>
<script type="text/javascript">
//图表实例化------------------
//srcipt标签式引入
var myChart = echarts.init(document.getElementById('main'));

//过渡---------------------
myChart.showLoading({
 text: '正在努力的读取数据中...',    //loading话术
});


myChart.hideLoading();

//图表使用-------------------
var option = {
    title : {
        text: '哈尔滨医疗机构网签占比统计',
        subtext: '<%=WQ_YEAR%>',
        x:'center'
    },
    tooltip : {
        trigger: 'item',
        formatter: "{a} <br/>{b} : {c} ({d}%)"
    },
    legend: {
        orient : 'vertical',
        x : 'left',
        data:['已签订','未签订']
    },
    toolbox: {
        show : true,
        x:450,
        feature : {
            mark : {show: false},
            dataView : {show: true, readOnly: false},
            magicType : {
                show: true, 
                type: ['pie', 'funnel'],
                option: {
                    funnel: {
                        x: '25%',
                        width: '50%',
                        funnelAlign: 'left',
                        max: 1548
                    }
                }
            },
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    calculable : true,
    series : [
        {
            name:'占比统计',
            type:'pie',
            radius : '55%',
            center: ['50%', '60%'],
            data:[
                {value:<%=VALIDNUM%>, name:'已签订'},
                {value:<%=NOVALIDNUM%>, name:'未签订'}
            ]
        }
    ]
};
myChart.setOption(option);
//srcipt标签式引入
var myChart2 = echarts.init(document.getElementById('main2'));

//过渡---------------------
myChart2.showLoading({
 text: '正在努力的读取数据中...',    //loading话术
});


myChart2.hideLoading();

//图表使用-------------------
var option2 = {
		title : {
	        text: '哈尔滨医疗机构网签趋势统计',
	        subtext: '<%=WQ_YEAR%>',
	        x:'center'
	    },
	    toolbox: {
	        show : true,
	        x:390,
	        feature : {
	            mark : {show: false},
	            dataView : {show: true, readOnly: false},
	            magicType : {show: true, type: ['line', 'bar']},
	            restore : {show: true},
	            saveAsImage : {show: true}
	        }
	    },
 tooltip: {                                  // 气泡提示配置
     trigger: 'item',                        // 触发类型，默认数据触发，可选为：'axis'
 },
 xAxis: [                                    // 直角坐标系中横轴数组
     {
         type: 'category', 
         name:'时间',// 坐标轴类型，横轴默认为类目轴，数值轴则参考yAxis说明
         data: [<%=xAxis%>]
     }
 ],
 yAxis: [                                    // 直角坐标系中纵轴数组
     {
         type: 'value', 
         name:'个',// 坐标轴类型，纵轴默认为数值轴，类目轴则参考xAxis说明
         boundaryGap: [1, 1],            // 坐标轴两端空白策略，数组内数值代表百分比
         splitNumber: 4,                      // 数值轴用，分割段数，默认为5
         min:0
     }
 ],
 series: [
     {
         name: '签订数',                        // 系列名称
         type: 'line',                       // 图表类型，折线图line、散点图scatter、柱状图bar、饼图pie、雷达图radar
         data: [<%=series%>]
     }
 ]
};
myChart2.setOption(option2);
    </script>

</body>
</html>

