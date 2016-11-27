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
<title>员工增加界面</title>
 
    <link rel="stylesheet" href="<%=basePath %>css/bootstrap.min.css"> 
    <link rel="stylesheet" href="<%=basePath %>css/bootstrap-table.min.css">


</head>
<body>
	<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th><h3>员工增加页面</h3></th>
					    
					</tr>
				</thead>
				<tbody>
					<tr>
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
					
					<form action="<%=basePath%>Manager/addEmp.do" method="post">
					
					<tr class="active">
							<td>
							<input class="form-control"  type="text" placeholder="员工姓名"  name="name"/>
						
						</td>
						
						<td>
							<input class="form-control" type="text" placeholder="性别"  name="sex"/>
						
						</td>

						<td>
						
							<input class="form-control" type="text" placeholder="年龄"  name="age"/>
						
						</td>
						
						<td>
						
							<input class="form-control" type="text" placeholder="工资"  name="sal"/>
						
						</td>
						
						<td>
						
							<input class="form-control" type="text" placeholder="身份证号"  name="card"/>
						
						</td>
					
				</tr>
				  <td>
				     <button type="submit" class="btn btn-default">
					     确认增加
				     </button>
                        
                  </td>
				</form>
				
					
					
					
				</tbody>
			</table>
		</div>
	</div>
</div>
  
  <script type="text/javascript">
      $(":button").click(function(){
    	  
    	  
    	  
    	  
      });
  
  
  </script>
  
  
	  <script type="text/javascript" src="<%=basePath %>js/jquery-2.0.0.min.js" ></script>
	 <script type="text/javascript" src="<%=basePath %>js/bootstrap.min.js"></script>
	
</body>
</html>



