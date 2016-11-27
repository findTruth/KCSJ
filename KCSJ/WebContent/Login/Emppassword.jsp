<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工找回密码</title>
<%@ include file="head.jsp"%>

    <link rel="stylesheet" href="<%=basePath %>Login/css/pintuer.css">
    <link rel="stylesheet" href="<%=basePath %>Login/css/admin.css">
	<link href="../css/bootstrap.min.css" type="text/css" rel="stylesheet">
    
    <script src="<%=basePath %>Login/js/jquery.js"></script>
    <script src="<%=basePath %>Login/js/pintuer.js"></script> 


</head>
<body>
<div class="bg"></div>
<div class="container">
    <div class="line bouncein">
        <div class="xs6 xm4 xs3-move xm4-move">
            
            <div class="media media-y margin-big-bottom">           
            </div>         
            <form action="<%=basePath %>Emp/password.do" method="post" onsubmit="return check(this)">
            <div class="panel loginbox">
                <div class="text-center margin-big padding-big-top"><h3>员工修改密码</h3></div>
                <div class="panel-body" style="padding:30px; padding-bottom:10px; padding-top:10px;">
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="text" class="input input-big" name="card" placeholder="请输入身份证" data-validate="required:请填写您身份证" />
                            <span class="icon icon-user margin-small"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="password" class="input input-big" name="password" placeholder="请输入密码" data-validate="required:请输入您的新密码" />
                            <span class="icon icon-key margin-small"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="password" class="input input-big" name="password2" placeholder="请输入密码" data-validate="required:请再次输入您的新密码" />
                            <span class="icon icon-key margin-small"></span>
                        </div>
                    </div>
                    
                     <%
								String msg=(String)request.getAttribute("msg");
					 %>
                    
								<span style="font-size:12px;color:red">
									<%=msg==null?"":msg%>
								</span>
                <div style="padding:30px;"><input type="submit" class="button button-block bg-main text-big input-big" value="确定修改"></div>
            </div>
            </form>          
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
		  if(form.card.value == "") {
			  alert("用户名不能为空!");
			  form.name.focus();
			  return false;
			  }
		  if(form.password.value == "") {
			  alert("密码不能为空!");
			  form.pwd.focus();
			  return false;
			  }
			  
			  if(form.password2.value == "") {
				  alert("验证码不能为空!");
				  form.code.focus();
				  return false;
			  }
			  return true;
	  }
	
	  
	      
	
	
	</script>
	
	  <script type="text/javascript" src="js/jquery-2.0.0.min.js" ></script>
	 <script type="text/javascript" src="js/bootstrap.js"></script>
	 

</body>
</html>