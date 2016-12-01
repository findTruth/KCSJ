<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员登录界面</title>
<%@ include file="head.jsp"%>

<link href="<%=basePath %>css/bootstrap.min.css" type="text/css"
	rel="stylesheet">



<div class="box" id="mymodal">
	<div class="login-box">
		<div class="login-title text-center">
			<h1>
				<small>管理员登录</small>
			</h1>
		</div>
		<div class="login-content ">
			<div class="form">
				<form action="<%=basePath %>Manager/login.do" method="post"
					onsubmit="return check(this)" ; id="loginFormId">
					<div class="form-group">
						<div class="col-xs-12  ">
							<div class="input-group">
								<span class="input-group-addon"><span
									class="glyphicon glyphicon-user"></span></span> <input type="text"
									id="username" name="name" class="form-control"
									placeholder="用户名">
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-xs-12  ">
							<div class="input-group">
								<span class="input-group-addon"><span
									class="glyphicon glyphicon-lock"></span></span> <input type="password"
									id="password" name="pwd" class="form-control" placeholder="密码">
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">
							验证码 </label>
						<div class="col-xs-10">
							<div>
								<img src="/KCSJ/check" id="i1" onclick="ff();" /><a
									href="javascript:;" onclick="ff();">&nbsp;&nbsp;看不清，换一张</a>
								&nbsp;&nbsp;<input type="text" name="code" style="width: 80px;"
									id="certCode" /> <span style="font-size: 12px; color: red"
									id="dialogs"> </span>
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
							<button type=button class="btn btn-sm btn-info" id="loginBtn"
								onclick="check();"
								style="width: 100px; height: 40px; position: absolute; left: 190px; top: 10px">
								<span class="glyphicon glyphicon-off"></span> 登录
							</button>
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
			
			var date=new Date();
			
			img.src="../check?time="+date.getMilliseconds();
		}
	  
	  
	  function dialog(){   
          $("#mymodal").modal("toggle");  
     };
	 
	  
	  function check(){
		  
		  
		   var name = document.getElementById("username").value;    
           var pwd = document.getElementById("password").value;    
           var code = document.getElementById("certCode").value; 
		  
		  
           var matchResult=true;    
           
           if(name==""){    
                 document.getElementById("dialogs").innerHTML="用户账号不能为空！";  
                 matchResult=false;    
           }else if(pwd==""){    
                 document.getElementById("dialogs").innerHTML="用户密码不能为空!";  
                 matchResult=false;    
           }else if(code==""){    
                 document.getElementById("dialogs").innerHTML="验证码不能为空！";  
                 matchResult=false;    
           }else if(name.length<2||name.length>6){    
                 document.getElementById("dialogs").innerHTML="用户名长度应在6到20个字符之间！";  
                 matchResult=false;    
           }else if(pwd.length<5||pwd.length>20){    
                 document.getElementById("dialogs").innerHTML="<密码或重复密码长度应在6到20个字符之间！";  
                 matchResult=false;    
           }    
           
           
           if(matchResult==true){
           
		    $.ajax({
               type:'POST',
               dataType: 'json',
               url:'<%=basePath%>Manager/login.do?name='+name+'&pwd='+pwd+'&code='+code,
               success:function(data,textStatus){
            	   
                   var objs = eval(data);
                   
                   if (objs.result==0) {
			
                	   $("#dialogs").html("密码错误");
                	   
                   }else if(objs.result==1){
                	   
                	   $("#dialogs").html("没有该用户");
                	   
				   }else if(objs.result==2){
					   
					   $("#dialogs").html("验证码错误");
					   ff();
				   }else{
					   window.location.href="<%= basePath%>ManagerJsp/ManagerHome.jsp?name="+ name;

							}
						}
					});

		}
		;
	}
</script>

<script type="text/javascript"
	src="<%=basePath%>js/jquery-2.0.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/bootstrap.js"></script>
</body>
</html>