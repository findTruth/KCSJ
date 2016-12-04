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
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
<link rel="stylesheet" href="<%=basePath%>css/bootstrap-table.min.css">
<link rel="stylesheet" href="<%=basePath%>css/pintuer.css">
<link rel="stylesheet" href="<%=basePath%>css/admin.css">

<title>Insert title here</title>
</head>
<body>
    	<div class="data-list">
    		<div class="data-list-Title"><p class="warning">酒店实时住房记录</p></div>
    		<form name="myForm" class="form-search" method="post" style="padding-bottom: 0px"
    				action="<%=basePath%>Manager/queryRoom.do">
				<span class="data_search">
					<select id="buildToSelect" name="buildToSelect" style="width: 110px;">
						<option value="">全部房间</option>
						<option>单人间</option>
						<option>双人间</option>
						<option>电脑房</option>
					</select>
					&nbsp;<input id="s_studentText" name="s_studentText" type="text"  style="width:120px;height: 30px;" 
						class="input-medium search-query">
					&nbsp;<button type="submit" class="btn btn-info" onkeydown="myForm.submit()">搜索</button>
				</span>
			</form>
    	</div>
    	
    	<div>
    		<table class="table table-bordered table-hover datatable table-striped">
    			<thead>
    			<tr class="warning">
					<th>房间号</th>
					<th>房间类型</th>
					<th>普通价格</th>
					<th>会员价格</th>
					<th>状态</th>
					<th>房间操作</th>
				</tr>
				</thead>
				<tbody>
					<c:forEach  varStatus="i" var="room" items="${room}">
				<tr>
						<td class="warning">11</td>
						<td>${room.rmno}</td>
						<td>${room.rmtype}</td>
						<td>${room.rmprice}</td>
						<td>${room.vprice}</td>
						<td>${room.rmno}</td>
						<td>
							<button class="btn btn-mini btn-info" type="button" onclick="">详细信息</button>&nbsp;
							<button class="btn btn-mini btn-danger" type="button" onclick="studentDelete(${student.studentId })">删除</button></td>
						</td>	
				</tr>
				</c:forEach>
					</tbody>
    		</table>
    	</div>
 	</body>
</html>