<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>结账界面</title>
<link rel="stylesheet" href="<%=basePath%>css/pintuer.css">
<link rel="stylesheet" href="<%=basePath%>css/admin.css">

<link href="<%=basePath%>css/bootstrap.css" rel="stylesheet" />
<script src="<%=basePath%>js/jquery-2.0.0.min.js"></script>
<script src="<%=basePath%>js/bootstrap.min.js"></script>

<script src="<%=basePath%>js/pintuer.js"></script>
<script src="<%=basePath%>EmpJsp/js/Leave.js"></script>

</head>
<body>
	<form method="post" action="" id="listform">
		<div class="panel admin-panel">
			<div class="panel-head">
				<strong class="icon-reorder" style="font-size: 20px;">顾客退房中心</strong>
			</div>
			<div class="padding border-bottom">
				<ul class="search" style="padding-left: 100px;">


					<li><input type="text" placeholder="请输入要退房的房间号" id="SouSuo"
						class="input"
						style="width: 300px; line-height: 17px; display: inline-block" />
						&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)"
						class="button border-main icon-search" onclick="changesearch()">
							搜索</a></li>
				</ul>
			</div>
			<table class="table table-hover text-center">
				<thead>
					<tr>
						<th style="font-size: 15px" width="100"
							style="text-align:left; padding-left:20px">姓名</th>
						<th style="font-size: 15px">身份证号</th>
						<th style="font-size: 15px">房间号</th>
						<th style="font-size: 15px">订餐费用</th>
						<th style="font-size: 15px">电话</th>
						<th style="font-size: 15px">入住时间</th>
						<th style="font-size: 15px">操作</th>
					</tr>
				</thead>
				<tbody id="List">

				</tbody>
			</table>
		</div>
	</form>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close"></button>
					<h4 class="modal-title" id="myModalLabel">客户信息</h4>
				</div>

				<span style="font-size: 15px;">客户姓名：</span><span
					style="font-size: 15px;" id="Name"></span> <span
					style="font-size: 15px; position: absolute; left: 150px;">入住时间：</span><span
					style="font-size: 15px; position: absolute; left: 250px;" id="Date"></span>

				<span style="font-size: 15px; position: absolute; left: 400px;">入住时长：</span><span
					style="font-size: 15px; position: absolute; left: 480px;" id="Time"></span><span
					style="font-size: 15px; position: absolute; left: 500px;">(天)</span><br />
				<br /> <span style="font-size: 15px;">是否是会员：</span><span
					style="font-size: 15px;" id="Vip"></span> <span
					style="font-size: 15px; position: absolute; left: 150px;">退房时间：</span><span
					style="font-size: 15px; position: absolute; left: 250px;"
					id="outdate">2016-11-10</span> <span
					style="font-size: 15px; position: absolute; left: 400px;">房价:</span><span
					style="font-size: 15px; position: absolute; left: 450px;"
					id="price"></span><span
					style="font-size: 15px; position: absolute; left: 480px;">(元/天)</span><br />
				<br /> <span style="font-size: 15px;">身份证号：</span><span
					style="font-size: 15px;" id="Card"></span> <span
					style="font-size: 15px; position: absolute; left: 300px;">房间费用：</span><span
					style="font-size: 15px; position: absolute; left: 380px;"
					id="roomfee"></span> <span
					style="font-size: 15px; position: absolute; left: 410px;">元</span>

				<span style="font-size: 15px; position: absolute; left: 450px;">点餐费用：</span><span
					style="font-size: 15px; position: absolute; left: 520px;" id="mfee"></span>

				<span style="font-size: 15px; position: absolute; left: 550px;">元</span><br />
				<br /> <span style="font-size: 15px;">房间号： </span><span
					style="font-size: 15px;" id="Rmno"></span> <span
					style="font-size: 15px; position: absolute; left: 380px;">总计：</span><span
					style="font-size: 15px; position: absolute; left: 450px;"
					id="allfee"></span> <span
					style="font-size: 15px; position: absolute; left: 500px;">元</span>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
					</button>
					<button type="button" id="btn_submit" class="btn btn-primary"
						data-dismiss="modal">
						<span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>结账
					</button>
				</div>
			</div>
		</div>
	</div>
</body>