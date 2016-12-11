<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="entity.Emp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 1.导入c标签库 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工查询界面</title>

<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
<link rel="stylesheet" href="<%=basePath%>css/bootstrap-table.min.css">


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
					<h3>菜单查询界面</h3>
					<form class="navbar-form navbar-left" role="search">
						<div class="form-group">
				   <select name="cid" class="selectpicker show-tick form-control"  style="width: 200px; line-height: 17px;" onchange="change(this)">
						  <option>请选择菜系类别</option>
						  <option>粤菜</option>
						  <option>川菜</option>
						  <option>饮料</option>
						  <option>湘菜</option>
				      </select>
							<span>请输入要查询的菜名或菜系：</span> <input class="form-control"
								type="text" placeholder="请搜索菜名" id="sousuo" />
						</div>
						<button type="button" class="btn btn-default" onclick="query()">查询</button>
					</form>
					&nbsp;&nbsp;
					<button class="btn btn-mini btn-danger" onclick="add()">增加菜单</button>

				</div>

				</nav>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<table class="table table-bordered table-hover" id="t_table">
					<thead>
						<tr class="success">
							<th>id</th>
							<th>菜名</th>
							<th>图片</th>
							<th>所属菜系</th>
							<th>价格</th>
							<th>会员价</th>
							<th>操作</th>
						</tr>
					</thead>

					<tbody id="Menus">

						<c:forEach varStatus="i" var="list" items="${Menuslist}">
							<tr class="warning">

								<td><c:out value="${list.mno}"></c:out></td>
								<td><c:out value="${list.msname}"></c:out></td>
								<td><img src="<%=basePath %>EmpJsp/Image/<c:out value="${list.mimg}"></c:out>"
							alt="" width="60" height="40" /></td>
								<td><c:out value="${list.mtype}"></c:out></td>
								<td><c:out value="${list.msfee}"></c:out></td>
								<td><c:out value="${list.mvfee}"></c:out></td>

								<td><a class="btn btn-mini btn-danger" onclick="deletemenus(${list.mno})">移除</a>
									&nbsp;&nbsp; <a class="btn btn-mini btn-danger"
									onclick="xiugai(${list.mno})">修改</a></td>
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
					第<input id="Text1" type="text" class="TextBox"
					onkeyup="changepage()"
					style="height: 20px; text-align: center; width: 50px" />页
				</span> <span id="spanNext">下一页</span> <span id="spanLast">尾页</span>
			</div>


		</div>
	</div>




	<script type="text/javascript">
  
  
  var theTable = document.getElementById("t_table");
  var txtValue = document.getElementById("Text1").value;
  
  
  var totalPage = document.getElementById("spanTotalPage");
  //总页数
  var pageNum = document.getElementById("spanPageNum");//当前页 
  var totalInfor = document.getElementById("spanTotalInfor");//记录总数
  var pageNum2 = document.getElementById("Text1");//当前页文本框
  
  var spanPre = document.getElementById("spanPre");//上一页 
  var spanNext = document.getElementById("spanNext");//下一页 
  var spanFirst = document.getElementById("spanFirst");//首页
  var spanLast = document.getElementById("spanLast");//尾页 
  var pageSize = 5;
  //每页信息条数
 
  var numberRowsInTable = theTable.rows.length-1;//表格最大行数
  

  //删除按钮响应
   function deletemenus(mno){
	  
	  var msg = confirm("确认删除？？");
	  if(msg==true){
		  alert("删除成功");
		  window.location.href="<%=basePath%>Manager/deleteMenus.do?mno="+mno;
		  
	  }
	  
  } 
  
  
 //根据用户的下拉框刷新表格
	function change(data){
	 
	 //alert(data.value=="请选择菜系类别");
		if(data.value=="请选择菜系类别"){
			alert("请选择");
		}else{
			 $.ajax({
				 type:'post',
                dataType: 'json',
                url:'http://localhost:8080/KCSJ/Manager/ChangeMenusByType.do?type='+data.value,
                success:function(data){
               	 flush(data);
              }
			})
		}
	}
  
  
      //增加界面
      function add(){
    	  window.location.href="<%=basePath%>ManagerJsp/ManagerMenus/addMenus.jsp";
		}
     
      //修改界面
      function xiugai(mno){
    	  window.location.href="<%=basePath%>Manager/queryMenus_update.do?mno="+mno;
		}
      
      
  
  //输入菜名或空白查询所有并刷新表格
  function query(){
	 var sousuo = $('#sousuo').val();
		 $.ajax({
			  type:'post',
            dataType: 'json',
            url:'http://localhost:8080/KCSJ/Manager/queryMenusByString.do?str='+sousuo,
            success:function(data){
           	 flush(data);
          }
		})
  }
  
		
	//封装ajax的刷新表格方法
	function flush(data){
		 var $tbody
		 = $("#Menus");
		 $tbody.empty();
        	            for (var j = 0; j < data.length; j++) { 
        	            	
        	              var table = "<tr><td>"
								+ data[j].mno
								+ "</td><td>"
								+ data[j].msname
								+ "</td><td>"+"<img width ='60' height='40' src=http://localhost:8080/KCSJ/EmpJsp/Image/"+ data[j].mimg
								+ ">"
								+ "</td><td>"
								+ data[j].mtype
								+ "</td><td>"
								+ data[j].msfee
								+ "</td><td>"
								+ data[j].mvfee
								+ "</td><td>"
								+"<a class='btn btn-mini btn-danger' name='test'>移除</a>"+
								"&nbsp;&nbsp;<a class='btn btn-mini btn-danger' onclick='xiugai(data[j].mno)'>修改</a></td></tr>";
        	            	
        	            	$tbody.append(table);
        	            	
        	            }
        	            
        	            refreshFenYe();
        	            
        	            $("a[name='test']").click(function(){
    	            		trObject = $(this).parent().parent();
    	            		var mno = trObject.children('td').eq(0).html();
    	            		deletemenus(mno);
    	            	});
		
	}
  
      
      

		//封装分页刷新
		function refreshFenYe() {
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

		//改变页数
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

	<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
	<script type="text/javascript" src="<%=basePath%>ManagerJsp/js/TableFenYe.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>

</body>
</html>
