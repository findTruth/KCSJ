<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工操作中心</title>
    <link rel="stylesheet" href="../css/pintuer.css">
    <link rel="stylesheet" href="../css/admin.css">
    <script src="../js/jquery.js"></script>   
</head>
<body style="background-color:#f2f9fd;">
<div class="header bg-main">
  <div class="logo
   margin-big-left fadein-top">
    <h1><img src="../images/y.jpg" class="radius-circle rotate-hover" height="50" alt="" />酒店服务中心</h1>
  </div>
  <div class="head-l"><a class="button button-little bg-green" href="" target="_blank"><span class="icon-home"></span> 前台首页</a> 
  &nbsp;&nbsp;<a href="##" class="button button-little bg-blue"><span class="icon-wrench"></span> 清除缓存</a> 
  &nbsp;&nbsp;<a class="button button-little bg-red" href="<%=basePath%>Login/EmpLogin.jsp"><span class="icon-power-off"></span> 退出登录</a> 
  
  &nbsp;&nbsp;<span style="font-size:14px;color:white">欢迎员工:<%=request.getParameter("name") %>登录</span>
  
  <%
			Date date=new Date();
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd E");
%>
			&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:14px;color:white"> 
			<%=sdf.format(date) %>
		    <br />
		</span>
  
  </div>
</div>
<div class="leftnav">
  <div class="leftnav-title"><strong><span class="icon-list"></span>操作列表</strong></div>
  <h2><span class="icon-user"></span>日常业务</h2>
  <ul style="display:block">
    <li><a href="<%=basePath%>Login/EmpLogin.jsp" target="right"><span class="icon-caret-right"></span>预定退订</a></li>
    <li><a href="<%=basePath%>RoomList/queryAllNullRoom.do" target="right"><span class="icon-caret-right"></span>顾客入住</a></li>
    <li><a href="column.html" target="right"><span class="icon-caret-right"></span>点餐业务</a></li>
    <li><a href="column.html" target="right"><span class="icon-caret-right"></span>顾客退房</a></li>
  </ul>   
  <h2><span class="icon-pencil-square-o"></span>基本操作</h2>
  <ul>
    <li><a href="EmpPwd.jsp" target="right"><span class="icon-caret-right"></span>密码修改</a></li>
    <li><a href="add.html" target="right"><span class="icon-caret-right"></span>会员管理</a></li>
    <li><a href="cate.html" target="right"><span class="icon-caret-right"></span>餐饮管理</a></li>        
  </ul>  
</div>
    <script type="text/javascript">
      $(function(){
         $(".leftnav h2").click(function(){
	     $(this).next().slideToggle(200);	
	     $(this).toggleClass("on"); 
       })
      $(".leftnav ul li a").click(function(){
	    $("#a_leader_txt").text($(this).text());
  		$(".leftnav ul li a").removeClass("on");
		$(this).addClass("on");
     })
    });
</script>
<ul class="bread">
  <li><a href="{:U('Index/info')}" target="right" class="icon-home"> 首页</a></li>
  <li><a href="##" id="a_leader_txt">网站信息</a></li>
  <li><b>当前语言：</b><span style="color:red;">中文</php></span>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;切换语言：<a href="##">中文</a> &nbsp;&nbsp;<a href="##">英文</a> </li>
</ul>
<div class="admin">
  <iframe scrolling="auto" rameborder="0" src="info.html" name="right" width="100%" height="100%"></iframe>
</div>
<div style="text-align:center;">
<p>来源:<a href="http://www.mycodes.net/" target="_blank">源码之家</a></p>
</div>
</body>
</html>