<%@ page language="java" import="java.util.*,com.neusoft.util.*,com.neusoft.bean.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>

<body>
<p align="center"><strong>培训报名操作手册</strong><strong> </strong></p>
  <li>首先点击菜单列表中的培训报名菜单 </li>
<p><img src="<%=basePath%>online/readmeimg/clip_image002.jpg" alt="" width="554" height="364" /></p>
  <li>进入后系统将列出所有能参加的培训课程列表（可以根据培训地点和时间选择适合自己的培训课程）如下图 </li>
<p><img src="<%=basePath%>online/readmeimg/clip_image004.jpg" alt="" width="554" height="248" /></p>
  <li>点击课程名称和查看按钮可以查看课程详细信息如下图 </li>
<p><img src="<%=basePath%>online/readmeimg/clip_image006.jpg" alt="" width="554" height="352" /></p>
  <li>点击参加培训按钮进入该课程的报名操作界面该界面分两个部分，一部分为操作员培训报名列表，一部分为课程信息。如下图 </li>
<p><img src="<%=basePath%>online/readmeimg/clip_image008.jpg" alt="" width="554" height="251" /></p>
  <li>操作员培训报名列表中为查询操作界面和一些相关说明，选择培训状态和录入操作员姓名可以查询已经报名的人员信息。 </li>
<p>操作员的培训状态分为4类； <br />
  已报名：由定点刚录入系统（可以进行修改和删除）。 <br />
  报名确认：管理员已经确认并安排场地座位（不可以修改和删除）。 <br />
  已培训：操作员已参加完培训，（培训时签到）。 <br />
  无效报名：多次报名不参加培训、恶意添加报名信息或课程取消等。（人员列表中会有审核说明） <br />
  课程信息列表中列出课程的基本信息，以及登录定点已报名人员信息。 </p>
  <li>添加培训报名人员操作 </li>
<p>首先点击右上方的添加按钮进入添加界面如图 <br />
  <img src="<%=basePath%>online/readmeimg/clip_image010.jpg" alt="" width="554" height="254" /> <br />
  在系统中录入相应的操作员信息，点击提交记录按钮。如图 <br />
  <img src="<%=basePath%>online/readmeimg/clip_image012.jpg" alt="" width="554" height="428" /> <br />
  提交之后再列表中会显示已经报名的操作员信息，包括审核信息以及操作按钮，可以对没确认的人员进行信息修改和取消报名操作。如图 <br />
  <img src="<%=basePath%>online/readmeimg/clip_image014.jpg" alt="" width="554" height="260" /> <br />
  也可以选择多个人员进行批量取消操作，选择之后点击右上方批量取消按钮即可。 </p>
</body>
</html>
