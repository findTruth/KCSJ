<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>历史记录查询页面</title>
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
<link rel="stylesheet" href="<%=basePath%>css/bootstrap-table.min.css">

<link rel="stylesheet" href="<%=basePath%>css/pintuer.css">
<link rel="stylesheet" href="<%=basePath%>css/admin.css">

</head>
<body>
	<div class="container-fluid" id="listpanel">
		<div class="row"> 

			<div class="col-md-12">

				<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">

					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span><span
							class="icon-bar"></span><span class="icon-bar"></span><span
							class="icon-bar"></span>
					</button>
				</div>

				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<h3>客房记录查询中心</h3>
					<br> <br>

					<form class="navbar-form navbar-left" role="search"
						action="<%=basePath%>Manager/queryRoom.do">
						<div class="form-group">

							<select class="form-control" style="width: 120px;"
								onchange="change(this)">
								<option>全部房间</option>
								<option>单人间</option>
								<option>双人间</option>
								<option>电脑房</option>

							</select> <span>请选择查询的房间种类</span> <input type="text"
								placeholder="请输入要查询的房间号" id="SouSuo" class="input"
								style="width: 150px; line-height: 17px; display: inline-block" />
							&nbsp;&nbsp;&nbsp; <a href="javascript:void(0)"
								class="button border-main icon-search" onclick="Search()">
								搜索</a>

						</div>

					</form>

				</div>

				</nav>
			</div>

			<div class="row">
				<div class="col-md-12">
					<table class="table table-bordered table-hover" id="t_table">
						<thead>
							<tr class="success">
								<th>Id号</th>
								<th>姓名</th>
								<th>身份证号</th>
								<th>电话</th>
								<th>房间号</th>
								<th>房间类型</th>
								<th>预定时间</th>
								<th>退订时间</th>
								<th>入住时间</th>
								<th>退房时间</th>
								<th>总计消费</th>
								<th>事件</th>
							</tr>
						</thead>

						<tbody id="list">

							<c:forEach varStatus="i" var="list" items="${historyList}">
								<tr class="warning">
									<td><c:out value="${list.id}"></c:out></td>
									<td><c:out value="${list.hname}"></c:out></td>
									<td><c:out value="${list.hcard}"></c:out></td>
									<td><c:out value="${list.htel}"></c:out></td>
									<td><c:out value="${list.hrmno}"></c:out></td>
									<td><c:out value="${list.htype}"></c:out></td>
									<td><c:out value="${list.hydate}"></c:out></td>
									<td><c:out value="${list.hyedate}"></c:out></td>
									<td><c:out value="${list.hdate}"></c:out></td>
									<td><c:out value="${list.hedate}"></c:out></td>
									<td><c:out value="${list.hallfee}"></c:out></td>
									<td><c:out value="${list.hshijian}"></c:out></td>

								</tr>
							</c:forEach>
						</tbody>
					</table>

					<div class="gridItem"
						style="padding: 5px; width: 250px; float: left; text-align: left; height: 20px; font-size: 15px;">
						共有 <span id="spanTotalInfor"></span> 条记录 当前第<span id="spanPageNum"></span>页
						共<span id="spanTotalPage"></span>页
					</div>
					<div class="gridItem"
						style="margin-left: 50px; padding: 5px; width: 400px; float: left; text-align: center; height: 20px; vertical-align: middle; font-size: 15px;">
						<span id="spanFirst">首页</span> &nbsp;&nbsp;<span id="spanPre">上一页</span>
						<span id="spanInput"
							style="margin: 0px; padding: 0px 0px 4px 0px; height: 100%;">
							第<input id="Text1" type="text" class="TextBox"
							onkeyup="changepage()"
							style="height: 20px; text-align: center; width: 50px" />页
						</span> &nbsp;&nbsp;<span id="spanNext">下一页</span> &nbsp;&nbsp;<span
							id="spanLast">尾页</span>
					</div>
				</div>
			</div>
</body>

<script type="text/javascript">
	var rmno;
	var theTable = document.getElementById("t_table");
	var txtValue = document.getElementById("Text1").value;

	//获取分页对应的控件
	var totalPage = document.getElementById("spanTotalPage");//总页数

	var pageNum = document.getElementById("spanPageNum");//当前页
	var totalInfor = document.getElementById("spanTotalInfor");//记录总数
	var pageNum2 = document.getElementById("Text1");//当前页文本框

	var spanPre = document.getElementById("spanPre");//上一页
	var spanNext = document.getElementById("spanNext");//下一页
	var spanFirst = document.getElementById("spanFirst");//首页
	var spanLast = document.getElementById("spanLast");//尾页
	var pageSize = 5;//每页信息条数

	var numberRowsInTable = theTable.rows.length - 1;//表格最大行数

	function change(data) {
		$.ajax({
				    type : 'GET',
					dataType : 'json',
					url : 'http://localhost:8080/KCSJ/RoomList/HistoryListBytype.do?type='
							+ data.value,
					success : function(data) {
						var $tbody = $("#list");
						$tbody.empty();
						for (var j = 0; j < data.length; j++) {
							var table = "<tr class='warning'><td>"
									+ data[j].id + "</td><td>"
									+ data[j].hname + "</td><td>"
									+ data[j].hcard + "</td><td>"
									+ data[j].htel + "</td><td>"
									+ data[j].hrmno + "</td><td>"
									+ data[j].htype + "</td><td>"
									+ data[j].hydate + "</td><td>"
									+ data[j].hyedate + "</td><td>"
									+ data[j].hdate + "</td><td>"
									+ data[j].hedate + "</td><td>"
									+ data[j].hallfee + "</td><td>"
									+ data[j].hshijian + "</td>"
									+ "</tr>";
							$tbody.append(table);
						}

						theTable = document.getElementById("t_table");
						txtValue = document.getElementById("Text1").value;

						//重新获取对应控件
						totalPage = document.getElementById("spanTotalPage");//总页数
						pageNum = document.getElementById("spanPageNum");//当前页
						totalInfor = document.getElementById("spanTotalInfor");//记录总数
						pageNum2 = document.getElementById("Text1");//当前页文本框

						spanPre = document.getElementById("spanPre");//上一页
						spanNext = document.getElementById("spanNext");//下一页
						spanFirst = document.getElementById("spanFirst");//首页
						spanLast = document.getElementById("spanLast");//尾页
						pageSize = 5;//每页信息条数

						numberRowsInTable = theTable.rows.length - 1;//表格最大行数
						hide();
					}
				})

	}
	
	function Search(){
		
		var sousuo = $("#SouSuo").get(0).value;  
		
		var numberreg = /^[1-9]\d{0,2}$/;
		
		if(numberreg.test(sousuo)){
			$.ajax({
			    type : 'GET',
				dataType : 'json',
				url : 'http://localhost:8080/KCSJ/RoomList/HistoryListByRmno.do?sousuo='
						+ sousuo,
				success : function(data) {
					var $tbody = $("#list");
					$tbody.empty();
					for (var j = 0; j < data.length; j++) {
						var table = "<tr class='warning'><td>"
								+ data[j].id + "</td><td>"
								+ data[j].hname + "</td><td>"
								+ data[j].hcard + "</td><td>"
								+ data[j].htel + "</td><td>"
								+ data[j].hrmno + "</td><td>"
								+ data[j].htype + "</td><td>"
								+ data[j].hydate + "</td><td>"
								+ data[j].hyedate + "</td><td>"
								+ data[j].hdate + "</td><td>"
								+ data[j].hedate + "</td><td>"
								+ data[j].hallfee + "</td><td>"
								+ data[j].hshijian + "</td>"
								+ "</tr>";
						$tbody.append(table);
					}

					theTable = document.getElementById("t_table");
					txtValue = document.getElementById("Text1").value;

					//重新获取对应控件
					totalPage = document.getElementById("spanTotalPage");//总页数
					pageNum = document.getElementById("spanPageNum");//当前页
					totalInfor = document.getElementById("spanTotalInfor");//记录总数
					pageNum2 = document.getElementById("Text1");//当前页文本框

					spanPre = document.getElementById("spanPre");//上一页
					spanNext = document.getElementById("spanNext");//下一页
					spanFirst = document.getElementById("spanFirst");//首页
					spanLast = document.getElementById("spanLast");//尾页
					pageSize = 5;//每页信息条数

					numberRowsInTable = theTable.rows.length - 1;//表格最大行数
					hide();
				}
			})
			
			
		}else{
			alert("输入的房间号有错");
		}
		
	}
	
	
</script>


<script type="text/javascript"
	src="<%=basePath%>EmpJsp/js/TableFenYe.js"></script>

<script type="text/javascript" src="<%=basePath%>/js/jquery.js"></script>



</html>