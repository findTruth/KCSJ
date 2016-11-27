<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="entity.Emp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 1.导入c标签库 -->
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工查询界面</title>
	
    <link rel="stylesheet" href="../css/bootstrap.min.css"> 
    <link rel="stylesheet" href="../css/bootstrap-table.min.css">


</head>

<body>
 <div class="container-fluid" id="listpanel">
	<div class="row">
		
		<div class="col-md-6">
		
			<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					 
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						 <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
					</button> 
				</div>
				
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					  <h3>员工查询界面</h3>
					<form class="navbar-form navbar-left" role="search" action="<%=basePath%>Manager/queryEmp.do">
						<div class="form-group">
						<span>请输入要查询的姓名或编号：</span>
							<input class="form-control" type="text" placeholder="姓名或员工编号"  name="name"/>
						</div> 
						<button type="submit" class="btn btn-default">
							查询
						</button>
					</form>
		    &nbsp;&nbsp;<button  class="btn btn-mini btn-danger" onclick="add()">增加员工</button>
					
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
				
				<tbody>
				
				<c:forEach  varStatus="i" var="list" items="${Emplist}">
					<tr class="warning">
					
						<td><c:out value="${list.empno}"></c:out></td>
						<td><c:out value="${list.ename}"></c:out></td>
						<td><c:out value="${list.esex}"></c:out></td>
						<td><c:out value="${list.eage}"></c:out></td>
						<td><c:out value="${list.esal}"></c:out></td>
						<td><c:out value="${list.ecard}"></c:out></td>
						
						<td><a href="<%=basePath %>Manager/deleteEmp.do?empno=<c:out value="${list.empno}"></c:out>">移除</a>
						<a onclick="xiugai('${list.empno }','${list.ename }','${list.esex }','${list.eage }','${list.esal }','${list.ecard}')">修改</a></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		
			<div class="gridItem" style="padding: 5px; width: 250px; float: left; text-align: left; height: 20px; font-size: 15px;" > 
                               共有 <span id="spanTotalInfor"></span> 条记录     
                               当前第<span id="spanPageNum"></span>页     
                                共<span id="spanTotalPage"></span>页
            </div>
            <div class="gridItem" style="margin-left:50px;  padding: 5px; width: 400px; float: left; text-align: center; height: 20px; vertical-align: middle; font-size: 15px;">   
               <span id="spanFirst" >首页</span> 
               <span id="spanPre">上一页</span>
               <span id="spanInput" style="margin: 0px; padding: 0px 0px 4px 0px; height:100%; "> 
                                     第<input id="Text1" type="text" class="TextBox" onkeyup="changepage()"   style="height:20px; text-align: center;width:50px" />页 
            </span>
            <span id="spanNext">下一页</span> 
            <span  id="spanLast">尾页</span> 
        </div>
		
		
	</div>
</div>





    <table class="table table-striped table-hover" style="visibility: hidden" id="updatepanel">
				<thead>
					<tr>
						<th><h3>员工修改</h3></th>
					    
					</tr>
				</thead>
				<tbody>
					<tr>
					    <td>
							员工编号
						</td>
						<td>
							姓名
						</td>
						<td>
							性别
						</td>
						<td>
							年龄
						</td>
						<td>
							工资
						</td>
						<td>
						    身份证号
						</td>
					</tr>
					
				    <!--修改页面的表单 -->
					<form action="<%=basePath%>Manager/updateEmp.do" method="post" >
					
					<tr class="active">
					
					    <td>
							<input class="form-control"  type="text" placeholder="员工编号"  name="empno" id = "empno1"  readonly/>
						
						</td>
						<td>
							<input class="form-control"  type="text" placeholder="员工姓名"  name="name" id = "name1"/>
						
						</td>
						
						<td>
							<input class="form-control" type="text" placeholder="性别"  name="sex" id="sex1"/>
						
						</td>

						<td>
						
							<input class="form-control" type="text" placeholder="年龄"  name="age" id="age1"/>
						
						</td>
						
						<td>
						
							<input class="form-control" type="text" placeholder="工资"  name="sal" id="sal1"/>
						
						</td>
						
						<td>
						
							<input class="form-control" type="text" placeholder="身份证号"  name="card" id="card1"/>
						
						</td>
					
				</tr>
				  <td>
				     <button type="submit" class="btn btn-default">
					     确认修改
				     </button>
                        
                  </td>
				</form>
				
					
					
					
				</tbody>
			</table>


  
  <script type="text/javascript">
  
  
  var theTable = document.getElementById("t_table");
  var txtValue = document.getElementById("Text1").value;
      
      function add(){
    	  
    	  window.location.href = "<%=basePath%>ManagerJsp/ManagerEmp/addEmp.jsp" ;
    	  
      }
      
      
      //接受来自list的数据并放到修改页面中
      function xiugai(empno,name,sex,age,sal,card){
    	  
    	  var panel = document.getElementById("listpanel");
    	  
    	  var showpanel = document.getElementById("updatepanel");
    	  
    	  
    	  document.getElementById("empno1").value = empno;
    	  
    	  document.getElementById("name1").value = name;
    	  
    	  document.getElementById("sex1").value = sex;
    	  
    	  document.getElementById("age1").value = age;
    	  
    	  document.getElementById("sal1").value = sal;
    	  
    	  document.getElementById("card1").value = card;
    	  
    	
    	  
    	  showpanel.style.visibility = "visible";
    	  
    	  panel.style.visibility = "hidden";
    	  
      }
      
      
      function changepage() {
    	  
          var txtValue2 = document.getElementById("Text1").value;
          if (txtValue != txtValue2) {
              if (txtValue2 > pageCount()) {

              }
              else if (txtValue2 <= 0) {

              }
              else if (txtValue2 == 1) {
                  first();
              }
              else if (txtValue2 == pageCount()) {
                  last();
              }
              else {
                  hideTable();
                  page = txtValue2;
                  pageNum2.value = page;

                  currentRow = pageSize * page;
                  maxRow = currentRow - pageSize;
                  if (currentRow > numberRowsInTable) currentRow = numberRowsInTable;
                  for (var i = maxRow; i < currentRow; i++) {
                      theTable.rows[i].style.display = '';
                  }
                  if (maxRow == 0) { preText(); firstText(); }
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
  
     <script type="text/javascript" src="<%=basePath %>ManagerJsp/js/TableFenYe.js"></script>

</body>
</html>
