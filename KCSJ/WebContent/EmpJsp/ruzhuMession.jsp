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
    		<table class="table table-bordered table-hover datatable table-striped" id="t_table">
    			<thead>
    			<tr class="warning">
					<th>房间号</th>
					<th>房间类型</th>
					<th>普通价格</th>
					<th>会员价格</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
				</thead>
				<tbody>
					<c:forEach  varStatus="i" var="room" items="${Roomlist}">
				<tr>
						<td>${room.rmno}</td>
						<td>${room.rmtype}</td>
						<td>${room.rmprice}</td>
						<td>${room.vprice}</td>
						<td>${room.rmbuff},${room.rmbook}</td>
						<td>
							<button class="btn btn-mini btn-info" type="button" onclick="">详细信息</button>&nbsp;
						</td>
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
		<span id="spanFirst">首页</span> <span id="spanPre">上一页</span> <span
			id="spanInput"
			style="margin: 0px; padding: 0px 0px 4px 0px; height: 100%;">
			第<input id="Text1" type="text" class="TextBox" onkeyup="changepage()"
			style="height: 20px; text-align: center; width: 50px" />页
		</span> <span id="spanNext">下一页</span> <span id="spanLast">尾页</span>
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
	//分页
	function changepage() {
		var txtValue2 = document.getElementById("Text1").value;
		if (txtValue != txtValue2) {
			if (txtValue2 > pageCount()) {
			} else if (txtValue2 <= 0) {
			} else if (txtValue2 == 1) {
				first();
			} else if (txtValue2 == pageCount()) {
				last();
			} else {
				hideTable();
				page = txtValue2;
				pageNum2.value = page;
				currentRow = pageSize * page;
				maxRow = currentRow - pageSize;
				if (currentRow > numberRowsInTable)
					currentRow = numberRowsInTable;
				for (var i = maxRow; i < currentRow; i++) {
					theTable.rows[i].style.display = '';
				}
				if (maxRow == 0) {
					preText();
					firstText();
				}
				showPage();
				nextLink();
				lastLink();
				preLink();
				firstLink();
			}
			txtValue = txtValue2;
		}
	}
</script>
 	
<script type="text/javascript" src="<%=basePath%>/EmpJsp/js/TableFenYe.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/jquery.js"></script>
</html>