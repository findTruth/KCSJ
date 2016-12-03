<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<title>客房预订</title>

   <link rel="stylesheet" href="<%=basePath %>css/bootstrap.min.css" />

<style>
#yuding {
	display: none; 
	border: 2em solid #87CEEB;
	height: 70%;
	width: 25%;
	position: absolute;
	top: 15%;
	left: 45%;
	background: #C09853;
}
#delyuding {
	display: none; 
	border: 2em solid #87CEEB;
	height: 40%;
	width: 60%;
	position: absolute;
	top: 24%;
	left: 24%;
	background: #87CEEB;
}
#VipYuDing {
	display: none;
	border: 2em solid #87CEEB;
	height: 40%;
	width: 60%;
	position: absolute;
	top: 24%;
	left: 24%;
	background: #87CEEB;
}
</style>
</head>


<body>
	<div class="data-list">
		<div class="data-list-Title"><h3>酒店预订</h3></div>
		<form name="myForm" class="form-search" method="post"
			action="predetermineUrl?action=yuding" style="padding-bottom: 0px">
			<button class="btn btn-success" type="button"
				style="margin-right: 50px;" onclick="change2()">查看预定</button>
			<button class="btn btn-success" type="button"
				style="margin-right: 50px;" onclick="change3()">预定入住</button>
			<span class="data_search"> <select id="buildToSelect"
				name="buildToSelect" style="width: 110px;" onchange="change(this)">
					<option>单人间</option>
					<option>双人间</option>
					<option>电脑房</option>
			</select>
			</span>
		</form>
	</div>
	<div>
	<br><br>
		<table class="table table-bordered table-hover datatable table-striped" id="t_table">
			<thead>
				<tr class="success">
					<th>房间号</th>
					<th>房间类型</th>
					<th>房间价格</th>
					<th>会员价格</th>
					<th>操作</th>
			</thead>
			<tbody id="list">
				<c:forEach varStatus="i" var="list" items="${Roomlist}">
					<tr class="active">
						<td>${list.rmno}</td>
						<td>${list.rmtype}</td>
						<td>${list.rmprice}</td>
						<td>${list.vprice}</td>
						<td><button class="btn btn-mini btn-info" type="button" onclick="MyYuDing('${list.rmno}','${list.rmtype}')">预定</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>


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


	<!-- 会员信息的输入框 -->
	<div id="VipYuDing">
		<!--修改页面的表单 -->
		<span>会员的信息</span><br>
		<br> <small>会员号：</small><input type="text" id="vno" />&nbsp;&nbsp;&nbsp;
		<small>身份证号：</small><input type="text" id="vcard" /><br>
		<br>
		<br> <span
			style="font-size: 12px; color: red; position: absolute; left: 350px; top: 100px;"
			id="Vipdialogs"> </span> <input type="button" id="Btup"
			onclick="checkVip()" value="确认入住" /> <input type="button" value="关闭"
			onclick="closeVipDiv()">

	</div>

	<script type="text/javascript">
		//普通客户修改页面的关闭
		function closeDiv() {
			$("#yuding").get(0).style.display = "none";
		}
		//VIP客户修改页面的关闭
		function closeVipDiv() {
			$("#VipYuDing").get(0).style.display = "none";
		}
		//检查是否是会员
		function checkVip() {
			var rmno = $("#croomid").get(0).value;
			var vno = $("#vno").get(0).value;
			var vcard = $("#vcard").get(0).value;
			var matchResult = true;
			if (vno == "") {
				document.getElementById("Vipdialogs").innerHTML = "会员号不能为空！";
				matchResult = false;
			} else if (vcard == "") {
				document.getElementById("dialogs").innerHTML = "身份证不能为空！";
				matchResult = false;
			}
			if (matchResult == true) {
				var r = confirm("确认预定？？");
				if (r == true) {
					$.ajax({
								type : 'post',
								dataType : 'json',
								url : 'http://localhost:8080/KCSJ/Emp/VipYuDing.do?vno='
										+ vno
										+ '&vcard='
										+ vcard
										+ '&rmno='
										+ rmno,
								success : function(data) {
									var objs = eval(data);
									if (objs.result == 0) {
										alert("客房预定成功");
										var r1 = confirm("是否回到主页");
										if (r1 == true) {
											window.location = "http://localhost:8080/KCSJ/RoomList/queryAllNullRoom.do"
										}
									} else {
										document.getElementById("Vipdialogs").innerHTML = "会员信息输入有误！";
										alert("客房预定失败");
									}
								}
							})
				}
			}
		}
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



	<script type="text/javascript">
		function MyYuDing(rmno, rtype) {
			$("#croomid").get(0).value = rmno;
			$("#idtype").get(0).value = rtype;
			var r = confirm("该客户是否是会员");
			if (r == true) {
				//弹出输入会员号的界面
				$("#VipYuDing").get(0).style.display = "block";
			} else {
				$("#yuding").get(0).style.display = "block";
			}
		}
		//检查输入状态
		function check() {
			var type = $("#idtype").get(0).value;
			var rmno = $("#croomid").get(0).value;
			var name = $("#cname").get(0).value;
			var idcard = $("#cidcard").get(0).value;
			var tel = $("#ctel").get(0).value;
			var matchResult = true;
			var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
			var regTel = /^0?1[3|4|5|8][0-9]\d{8}$/;
			if (name == "") {
				document.getElementById("dialogs").innerHTML = "姓名不能为空！";
				matchResult = false;
			} else if (idcard == "") {
				document.getElementById("dialogs").innerHTML = "证件输入不能为空!";
				matchResult = false;
			} else if (tel == "") {
				document.getElementById("dialogs").innerHTML = "联系方式不能为空";
				matchResult = false;
			} else if (reg.test(idcard) == false) {
				document.getElementById("dialogs").innerHTML = "身份证格式有误";
				matchResult = false;
			} else if (regTel.test(tel) == false) {
				document.getElementById("dialogs").innerHTML = "电话格式有误";
				matchResult = false;
			}
			if (matchResult == true) {
				var r = confirm("确认预定？？");
				if (r == true) {
					$.ajax({
								type : 'post',
								dataType : 'json',
								url : 'http://localhost:8080/KCSJ/Emp/yuding.do?name='
										+ name
										+ '&idcard='
										+ idcard
										+ '&tel='
										+ tel + '&rmno=' + rmno,
								success : function(data) {
									var objs = eval(data);
									if (objs.result == 0) {
										alert("预定成功");
										var r1 = confirm("是否回到预定主页");
										if (r1 == true) {
											window.location = "http://localhost:8080/KCSJ/RoomList/queryAllRoom.do"
										}
									} else {
										alert("入住失败");
									}
								}
							})
				}
			}
		}
	</script>




	<div id="yuding" class="form-group">
		<label class="" for="inputSuccess1">预定房间号 </label> <input type="text"
			name="roomid" id="croomid" readonly /> <label class="control-label"
			for="inputSuccess1">房间类型 </label> <input type="text" name="type"
			id="idtype" readonly /> <label class="control-label"
			for="inputSuccess1">客户姓名 </label> <input type="text" name="name"
			id="cname" /> <label class="control-label" for="inputSuccess1">客户证件号</label>
		<input type="text" name="idcard" id="cidcard" /> <label
			class="control-label" for="inputSuccess1">联系方式</label> <input
			type="text" name="tel" id="ctel" /> <span
			style="font-size: 12px; color: red; position: absolute; left: 400px; top: 100px;"
			id="dialogs"> </span> <br> <input type="button"
			class="btn btn-primary btn-warning" onclick="check()" value="确认预定" />
		<input type="button" class="btn btn-primary btn-danger" value="关闭"
			onclick="closeDiv()">
	</div>




	<script type="text/javascript">
		//选择下拉框中的值做出对应的操作
		function change(data) {
			alert(data.value);
			$.ajax({
	  				type:'GET',
	                dataType: 'json',
	                url:'http://localhost:8080/KCSJ/RoomList/GetroomlistBytype.do?type='+data.value,
					success : function(data) {
							var $tbody = $("#list");
							$tbody.empty();
							for (var j = 0; j < data.length; j++) {
								var table = "<tr class='warning'><td>"
										+ data[j].rmno + "</td><td>"
										+ data[j].rmtype + "</td><td>"
										+ data[j].rmprice + "</td><td>"
										+ data[j].vprice + "</td>"
										+ "<td><a onclick='MyYuDing("
										+ data[j].rmno + ")'>预定</a></td></tr>";
								$tbody.append(table);
							}
							theTable = document.getElementById("t_table");
							txtValue = document.getElementById("Text1").value;
							//重新获取对应控件
							totalPage = document
									.getElementById("spanTotalPage");//总页数
							pageNum = document.getElementById("spanPageNum");//当前页
							totalInfor = document
									.getElementById("spanTotalInfor");//记录总数
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
		function change2() {
			$.ajax({
				type : 'GET',
				dataType : 'json',
				url : 'http://localhost:8080/KCSJ/RoomList/queryYuDing.do',
				success : function(data) {
					var $tbody = $("#list");
					$tbody.empty();
					for (var j = 0; j < data.length; j++) {
						var table = "<tr class='warning'><td>" + data[j].rmno
								+ "</td><td>" + data[j].rmtype + "</td><td>"
								+ data[j].rmprice + "</td><td>"
								+ data[j].vprice + "</td>"
								+ "<td><a onclick='tuiding(" + data[j].rmno
								+ ")'>退定</a></td></tr>";
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
		function tuiding(rmno) {
			var r = confirm("确认退订？？");
			if (r == true) {
				$.ajax({
							type : 'post',
							dataType : 'json',
							url : 'http://localhost:8080/KCSJ/Emp/tuiding.do?rmno='
									+ rmno,
							success : function(data) {
								var objs = eval(data);
								if (objs.result == 0) {
									alert("退订成功");
									var r1 = confirm("是否回到退订主页");
									if (r1 == true) {
										window.location = "http://localhost:8080/KCSJ/RoomList/queryAllRoom.do"
									}
								} else {
									alert("退订失败");
								}
							}
						})
			}
		}
		//预定入住
		function change3() {
			$.ajax({
				type : 'GET',
				dataType : 'json',
				url : 'http://localhost:8080/KCSJ/RoomList/queryYuDing.do',
				success : function(data) {
					var $tbody = $("#list");
					$tbody.empty();
					for (var j = 0; j < data.length; j++) {
						var table = "<tr class='warning'><td>" + data[j].rmno
								+ "</td><td>" + data[j].rmtype + "</td><td>"
								+ data[j].rmprice + "</td><td>"
								+ data[j].vprice + "</td>"
								+ "<td><a onclick='yudingruzhu(" + data[j].rmno
								+ ")'>预定入住</a></td></tr>";
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
		function yudingruzhu(rmno) {
			var r = confirm("确认入住？？");
			if (r == true) {
				$.ajax({
							type : 'post',
							dataType : 'json',
							url : 'http://localhost:8080/KCSJ/Emp/yudingruzhu.do?rmno='
									+ rmno,
							success : function(data) {
								var objs = eval(data);
								if (objs.result == 0) {
									alert("成功入住");
									var r1 = confirm("是否回到主页");
									if (r1 == true) {
										window.location = "http://localhost:8080/KCSJ/RoomList/queryAllRoom.do"
									}
								} else {
									alert("入住失败");
								}
							}
						})
			}
		}
	</script>
    <script type="text/javascript" src="<%=basePath %>js/jquery.js"></script>
	<script type="text/javascript" src="<%=basePath%>EmpJsp/js/TableFenYe.js"></script>
</body>
</html>