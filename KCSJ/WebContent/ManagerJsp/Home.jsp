<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=basePath%>css/bootstrap.min.css" type="text/css"
	rel="stylesheet">

</head>
<body onload="startTime()">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-6">
				<div class="page-header">
					<h4>
						<div>
							登录成功，欢迎管理员：
							<%=session.getAttribute("mname")%>

						</div>
					</h4>
				</div>
			
				<h4>
			
			  现在时间： <label id="time"></label>
			
			</h4>
			</div>
			
		</div>
	</div>
</body>


<script type="text/javascript">

startTime();

</script>
<script type="text/javascript">


function startTime(){
    var today=new Date();
    var week=new Array("星期日","星期一","星期二","星期三","星期四","星期五","星期六");
    var year=today.getFullYear();
    var month=today.getMonth()+1;
    var date=today.getDate();
    var day=today.getDay();
    var h=today.getHours();
    var m=today.getMinutes();
    var s=today.getSeconds();
    // add a zero in front of numbers<10
    h=checkTime(h)
    m=checkTime(m)
    s=checkTime(s)
    document.getElementById("time").innerHTML=" "+year+"年"+month+"月"+date+"日  "+week[day]+"  "+h+":"+m+":"+s+" ";
    t=setTimeout('startTime()',500);
   }
   
   function checkTime(i){
   if (i<10)  
     {i="0" + i}
     return i
   }

</script>


</html>