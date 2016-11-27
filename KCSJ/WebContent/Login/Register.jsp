<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员注册界面</title>
	
	 <link href="css/bootstrap.min.css" type="text/css" rel="stylesheet">

<%@ include file="head.jsp"%>

<div class="box">
		<div class="login-box">
			<div class="login-title text-center">
				<h3><small>管理员注册</small></h3>
			</div>
			<div class="login-content ">
			<div class="form">
			<form action="<%=basePath %>Manager/register.do" method="post" onsubmit="return check(this)";>
				<div class="form-group">
					<div class="col-xs-6  ">
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
							<input type="text" id="username" name="name" class="form-control" placeholder="用户名">
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-xs-6  ">
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
							<input type="password" id="password" name="pwd" class="form-control" placeholder="密码">
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-xs-12  ">
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
							<input type="text" id="card" name="card" class="form-control" placeholder="身份证">
						</div>
					</div>
				</div>
				
				
				
				<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">
							验证码
						</label>
						<div class="col-xs-10">
						   <div>
						       <img src="/KeChengSheJi/check" id="i1" onclick="ff();"/><a href="javascript:;" onclick="ff();">&nbsp;&nbsp;看不清，换一张</a>
				               &nbsp;&nbsp;<input type="text" name="code" style="width:80px;"/>	 
						   		<%
									String code_msg=(String)request.getAttribute("code_msg");
								%>
							<span style="font-size:14px;color:red">
								<%=code_msg==null?"":code_msg%>
							</span> 
							
							<%
								    String login_msg=(String)request.getAttribute("login_msg");
							%>
								<span style="font-size:12px;color:red">
									<%=login_msg==null?"":login_msg%>
								</span>
							
						   
						   </div>
							  
							</div>
						</div>
				<div class="form-group form-actions">
					<div class="col-xs-4 col-xs-offset-4 ">
					<br>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-6 link">
						<button type="submit" class="btn btn-sm btn-info" style="width: 150px;height: 40px;position: absolute;left:180px;top: 20px"><span class="glyphicon glyphicon-off"></span>注册</button>
						</p>
					</div>
				</div>
			</form>
			</div>
		</div>
	</div>
</div>

	<script type="text/javascript">
	
	  function ff(){
			var img=document.getElementById("i1");
			//控制变量达到Url不重复，避免浏览器缓存:随机数,时间
			var date=new Date();
			img.src="../check?time="+date.getMilliseconds();
		}
	  
	  
	  function check(form){
		  if(form.name.value == "") {
			  alert("用户名不能为空!");
			  form.name.focus();
			  return false;
			  }
			  if(form.pwd.value == "") {
			  alert("密码不能为空!");
			  form.pwd.focus();
			  return false;
			  }
			  return true;
	  }
	
	
	
	
	</script>
	
	  <script type="text/javascript" src="js/jquery-2.0.0.min.js" ></script>
	 <script type="text/javascript" src="js/bootstrap.js"></script>




</body>
</html>