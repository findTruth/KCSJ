<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工修改密码界面</title>

   <link href="<%=basePath %>css/bootstrap.min.css" type="text/css" rel="stylesheet">

</head>

  
       <div>
                           员工姓名： <%=session.getAttribute("ename") %>
       
       </div>
      
        <br><br>
      <div class="container-fluid">
	<div class="row">
		<div class="col-md-6">
				<div class="form-group">
					 
					<label for="inputEmail3" class="col-sm-2 control-label">
						原来密码：
					</label>
					<div class="col-sm-10">
						<input class="form-control" id="oldpwd" type="password"  style="width: 150px"/>
					</div>
				</div>
				
				<br><br>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label">
						您的新密码：
					</label>
					<div class="col-sm-10">
						<input class="form-control" id="newpwd" type="password"  style="width: 150px" />
					</div>
				</div>
	
				<br><br>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label" style="height: 300px">
						再次输入新密码：
					</label>
					<div class="col-sm-10">
						<input class="form-control" id="newpwd1" type="password" id="newPwd1" style="width: 150px"/>
					</div>
				</div>
				
				<br><br>
				<div class="form-group">
						<button onclick="check()" class="btn btn-default">
							修改
						</button>
						&nbsp;&nbsp;&nbsp;
			<span style="font-size:12px;color:red;" id="dialog">
                                        
            </span>
				</div>
				
		</div>
	</div>
</div>

    <script src="<%=basePath %>js/jquery.js"></script>
    <script src="<%=basePath %>js/pintuer.js"></script>
    
    <script type="text/javascript">
        function check(){
        	
        	var oldpwd = $("#oldpwd").get(0).value;
        	var newpwd = $("#newpwd").get(0).value;
        	var newpwd1 = $("#newpwd1").get(0).value;
        	
        	
        	var matchResult = true;
  		  
        	if(oldpwd==""){    
                   document.getElementById("dialog").innerHTML="密码不能为空！";  
                   matchResult=false;    
             }else if(newpwd==""){    
                   document.getElementById("dialog").innerHTML="密码不能为空！";  
                   matchResult=false;    
             }else if(newpwd1==""){    
                   document.getElementById("dialog").innerHTML="密码不能为空！";  
                   matchResult=false;    
             }else if(newpwd!=newpwd1){
             	document.getElementById("dialog").innerHTML="两次输入的密码不一致";  
             	matchResult=false;
             }
        		  
             
             if(matchResult==true){
        	    $.ajax({
                 type:'POST',
                 dataType: 'json',
                 url:'<%=basePath%>Emp/updatePwd.do?oldpwd='+oldpwd+'&newpwd='+newpwd1,
                 success:function(data,textStatus){
              	   
                     var obj = eval(data);
                     
                     if(obj.result==0){
                  	   $("#dialog").html("您的旧密码有错");
        			 }else if(obj.result==1){
        				 alert("修改成功");
        				 window.location.href="<%=basePath%>EmpJsp/info.html";
        				 
        			 }else{
        				 $("#dialog").html("修改出错");				 
        			 }
                 }
             });

        }; 
         	  
        	
        	
        }
    
    </script>
    
    <script type="text/javascript" src="<%=basePath %>/js/jquery.js"></script>
    <script type="text/javascript" src="<%=basePath %>js/jquery-2.0.0.min.js" ></script>
	 <script type="text/javascript" src="<%=basePath %>js/bootstrap.js"></script>
    
    
</body>

</html>