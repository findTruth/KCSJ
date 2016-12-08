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
					<h3>员工查询界面</h3>
					<form class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<span>请输入要查询的姓名或编号：</span> <input class="form-control"
								type="text" placeholder="姓名或员工编号" id="sousuo" />
						</div>
						<button type="button" class="btn btn-default" onclick="query()">查询</button>
					</form>
					&nbsp;&nbsp;
					<button class="btn btn-mini btn-danger" onclick="add()">增加员工</button>

				</div>

				</nav>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<table class="table table-bordered table-hover" id="t_table">
					<thead>
						<tr class="success">
							<th>员工号</th>
							<th>姓名</th>
							<th>性别</th>
							<th>年龄</th>
							<th>工资</th>
							<th>身份证号</th>
							<th>操作</th>
						</tr>
					</thead>

					<tbody id="Emptbody">

						<c:forEach varStatus="i" var="list" items="${Emplist}">
							<tr class="warning">

								<td><c:out value="${list.empno}"></c:out></td>
								<td><c:out value="${list.ename}"></c:out></td>
								<td><c:out value="${list.esex}"></c:out></td>
								<td><c:out value="${list.eage}"></c:out></td>
								<td><c:out value="${list.esal}"></c:out></td>
								<td><c:out value="${list.ecard}"></c:out></td>

								<td><a class="btn btn-mini btn-danger"
									href="<%=basePath %>Manager/deleteEmp.do?empno=<c:out value="${list.empno}"></c:out>">移除</a>
									&nbsp;&nbsp; <a class="btn btn-mini btn-danger"
									onclick="xiugai('${list.empno }','${list.ename }','${list.esex }','${list.eage }','${list.esal }','${list.ecard}')">修改</a></td>
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


	<!-- bootstrap的修改界面 -->
	<div class="modal fade" id="update" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">员工修改</h4>
				</div>
				<div class="modal-body">

					<div class="form-group">
						<label for="txt_departmentname">员工编号</label> <input type="text"
							name="txt_departmentname" class="form-control" id="empno"
							placeholder="员工编号" readonly="readonly">
					</div>
					<div class="form-group">
						<label for="txt_parentdepartment">员工姓名</label> <input type="text"
							name="txt_parentdepartment" class="form-control" id="ename"
							placeholder="员工姓名">
					</div>
					<div class="form-group">
						<label for="txt_departmentlevel">员工性别</label> <input type="text"
							name="txt_departmentlevel" class="form-control" id="esex"
							placeholder="员工性别">
					</div>
					<div class="form-group">
						<label for="txt_statu">员工年龄</label> <input type="text"
							name="txt_statu" class="form-control" id="eage"
							placeholder="员工年龄">
					</div>
					<div class="form-group">
						<label for="txt_departmentlevel">员工工资</label> <input type="text"
							name="txt_departmentlevel" class="form-control" id="esal"
							placeholder="员工工资">
					</div>
					<div class="form-group">
						<label for="txt_departmentlevel">身份证号</label> <input type="text"
							name="txt_departmentlevel" class="form-control" id="ecard"
							placeholder="身份证号">
					</div>
					<span
						style="font-size: 15px; color: red; "
						id="dialogs"> </span>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
					</button>
					<button type="button" id="btn_submit" onclick="updateEmp()"
						class="btn btn-primary">
						<span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>确认修改
					</button>
				</div>
			</div>
		</div>
	</div>

	<!-- bootstrap的修改界面 -->
	
	
	
	<!-- bootstrap的增加界面 -->
	<div class="modal fade" id="addEmp" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">员工增加界面</h4>
				</div>
				<div class="modal-body">

					<div class="form-group">
						<label for="txt_parentdepartment">员工姓名</label> <input type="text"
							name="txt_parentdepartment" class="form-control" id="newename"
							placeholder="员工姓名">
					</div>
					<div class="form-group">
						<label for="txt_departmentlevel">员工性别</label> <input type="text"
							name="txt_departmentlevel" class="form-control" id="newesex"
							placeholder="员工性别">
					</div>
					<div class="form-group">
						<label for="txt_statu">员工年龄</label> <input type="text"
							name="txt_statu" class="form-control" id="neweage"
							placeholder="员工年龄">
					</div>
					<div class="form-group">
						<label for="txt_departmentlevel">员工工资</label> <input type="text"
							name="txt_departmentlevel" class="form-control" id="newesal"
							placeholder="员工工资">
					</div>
					<div class="form-group">
						<label for="txt_departmentlevel">身份证号</label> <input type="text"
							name="txt_departmentlevel" class="form-control" id="newecard"
							placeholder="身份证号">
					</div>
					<span
						style="font-size: 15px; color: red; "
						id="Empdialogs"> </span>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
					</button>
					<button type="button" id="btn_submit" onclick="addEmp()"
						class="btn btn-primary">
						<span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>确认增加
					</button>
				</div>
			</div>
		</div>
	</div>

	<!-- bootstrap的增加界面 -->




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
  

      //增加界面的弹出
      function add(){
    	  document.getElementById("Empdialogs").innerHTML="";
    	  $("#addEmp").modal();
		}
  
      //增加页面传到后台
      function addEmp(){
    	  
    	  var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/; 
    	  
			var ename = $('#newename').val();
		    var	esex = $('#newesex').val() ;
			var eage = $('#neweage').val()  ;
			var esal = $('#newesal').val() ;
			var card  = $('#newecard').val() ;
    	  
			if(ename==""){
				document.getElementById("Empdialogs").innerHTML="姓名不能为空";
			}else if(esex==""){
				document.getElementById("Empdialogs").innerHTML="性别不能为空";
			}else if(eage==""){
				document.getElementById("Empdialogs").innerHTML="年龄不能为空";
			}else if(esal==""){
				document.getElementById("Empdialogs").innerHTML="工资不能为空";
			}else if(card==""){
				document.getElementById("Empdialogs").innerHTML="身份证不能为空";
			}else if(esex!='男'&&esex!='女'){
				document.getElementById("Empdialogs").innerHTML="性别只能是男或女！！";  
			}else if(reg.test(card)==false){
				document.getElementById("Empdialogs").innerHTML="身份证格式有错";  
			}else{
				var comfirm  = confirm("确认增加？？");
				if(comfirm==true){
					$.ajax({
						  type:'post',
			            dataType: 'json',
			            url:'http://localhost:8080/KCSJ/Manager/addEmp.do?ename='+ename+"&esex="+esex+"&eage="+eage+"&esal="+esal+"&card="+card,
			            success:function(data){
		                     var obj = eval(data);
		                     if(obj.result==1){
		                    	 document.getElementById("Empdialogs").innerHTML="身份证有重复，请重新输入";  
		                     }else if(obj.result==2){
		                    	 document.getElementById("Empdialogs").innerHTML="出错";  
		                    	 
		                     }else{
		                    	 alert("增加成功");
		                    	 window.location = "http://localhost:8080/KCSJ/Manager/Emplist.do";
		                     }
			          }
					})		
				}
			}
      }
      
  
  //输入姓名或员工编号查询员工并刷新表格
  function query(){
	  
	 var sousuo = $('#sousuo').val();
	
		 $.ajax({
			  type:'post',
            dataType: 'json',
            url:'http://localhost:8080/KCSJ/Manager/queryEmp.do?str='+sousuo,
            success:function(data){
           	 flush(data);
          }
		})
  }
  
  
		//接受来自list的数据并放到修改页面中
		function xiugai(empno, name, sex, age, sal, card) {
			
			 document.getElementById("dialogs").innerHTML="";  
			
			document.getElementById("empno").value = empno;
			document.getElementById("ename").value = name;
			document.getElementById("esex").value = sex;
			document.getElementById("eage").value = age;
			document.getElementById("esal").value = sal;
			document.getElementById("ecard").value = card;
			$("#update").modal();
		}
  
		
		//修改员工并传到后台
		function updateEmp(){
			
			
			var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;  
			
			
			var empno = $('#empno').val() ;
			var ename = $('#ename').val();
		    var	esex = $('#esex').val() ;
			var eage = $('#eage').val()  ;
			var esal = $('#esal').val() ;
			var card  = $('#ecard').val() ;
			
			
			if(ename==""){
				document.getElementById("dialogs").innerHTML="姓名不能为空";
			}else if(esex==""){
				document.getElementById("dialogs").innerHTML="性别不能为空";
			}else if(eage==""){
				document.getElementById("dialogs").innerHTML="年龄不能为空";
			}else if(esal==""){
				document.getElementById("dialogs").innerHTML="工资不能为空";
			}else if(card==""){
				document.getElementById("dialogs").innerHTML="身份证不能为空";
			}else if(esex!='男'&&esex!='女'){
				document.getElementById("dialogs").innerHTML="性别只能是男或女！！";  
			}else if(reg.test(card)==false){
				document.getElementById("dialogs").innerHTML="身份证格式有错";  
			}else{
				var comfirm  = confirm("确认修改？？");
				if(comfirm==true){
					$.ajax({
						  type:'post',
			            dataType: 'json',
			            url:'http://localhost:8080/KCSJ/Manager/updateEmp.do?empno='+empno
			            		+"&ename="+ename+"&esex="+esex+"&eage="+eage+"&esal="+esal+"&card="+card,
			            success:function(data){
		                     var obj = eval(data);
		                     if(obj.result==1){
		                    	 document.getElementById("dialogs").innerHTML="身份证有重复，请重新输入";  
		                     }else if(obj.result==2){
		                    	 document.getElementById("dialogs").innerHTML="出错";  
		                    	 
		                     }else{
		                    	 alert("修改成功");
		                    	 window.location = "http://localhost:8080/KCSJ/Manager/Emplist.do";
		                     }
			          }
					})		
				}
			}
		}
		
//封装ajax的刷新表格方法
	function flush(data){
		 var $tbody = $("#Emptbody");
		 $tbody.empty();
      	            for (var j = 0; j < data.length; j++) { 
      	            	
      	              var table = "<tr><td>"
								+ data[j].empno
								+ "</td><td>"
								+ data[j].ename
								+ "</td><td>"
								+ data[j].esex
								+ "</td><td>"
								+ data[j].eage
								+ "</td><td>"
								+ data[j].esal
								+ "</td><td>"
								+ data[j].ecard
								+ "</td><td>"
								+"<input type='button' class='btn btn-mini btn-danger' name='delete' value='删除'/>&nbsp;&nbsp;"
								+"<input type='button' class='btn btn-mini btn-danger' name='xiugai' value='修改' />"
								+"</td></tr>"
      	            	$tbody.append(table);
      	            	
      	            }
      	            
      	            refreshFenYe();
      	            
      	             $("input[name='delete']").click(function(){
      	            
      	            	trObject = $(this).parent().parent();
  	            		var empno = trObject.children('td').eq(0).html();
      	            	 
      	            	window.location.href="<%=basePath%>Manager/deleteEmp.do?empno="+empno;
      	           });
      	            $("input[name='xiugai']").click(function(){
  	            		trObject = $(this).parent().parent();
  	            		var empno = trObject.children('td').eq(0).html();
  	            		
  	            		var ename = trObject.children('td').eq(1).html();
  	            		var esex = trObject.children('td').eq(2).html();
  	            		var eage = trObject.children('td').eq(3).html();
  	            		var esal = trObject.children('td').eq(4).html();
  	            		var ecard = trObject.children('td').eq(5).html();
  	            		var eage = trObject.children('td').eq(3).html();
  	            		xiugai(empno, ename, esex, eage, esal, ecard);
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
