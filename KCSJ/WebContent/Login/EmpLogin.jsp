<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工登录</title>  
<%@ include file="head.jsp"%>

    <link type="text/css"  rel="stylesheet" href="<%=basePath %>css/pintuer.css">
    <link type="text/css" rel="stylesheet" href="<%=basePath %>css/admin.css">
     <link href="<%=basePath %>css/bootstrap.min.css" type="text/css" rel="stylesheet">
    
    <script src="<%=basePath %>js/jquery.js"></script>
    <script src="<%=basePath %>js/pintuer.js"></script>  
    
</head>
<body>
<div class="bg"></div>
<div class="container">
    <div class="line bouncein">
        <div class="xs6 xm4 xs3-move xm4-move">
            
            <div class="media media-y margin-big-bottom">           
            </div>         
            <form action="<%=basePath %>Emp/login.do" method="post">
            <div class="panel loginbox">
                <div class="text-center margin-big padding-big-top"><h3>员工登录中心</h3></div>
                <div class="panel-body" style="padding:30px; padding-bottom:10px; padding-top:10px;">
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="text" class="input input-big" name="name"  id="username" placeholder="登录账号" data-validate="required:请填写账号" />
                            <span class="icon icon-user margin-small"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="password" class="input input-big" name="pwd" id="password" placeholder="登录密码" data-validate="required:请填写密码" />
                            <span class="icon icon-key margin-small"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="field">
                            
                            <input type="text" class="input input-big" name="code" id="certCode" placeholder="填写右侧的验证码"/>
                            
                            <img src="/KCSJ/check" id="i1"  width="100" height="40" class="passcode" onclick="ff();" style="height:43px;cursor:pointer;"/>
                                                   
                        </div>
                        
                           <a href="javascript:;" onclick="ff();" style="position: absolute; left:190px;top: 320px" >&nbsp;&nbsp;看不清，换一张</a>
                           <%
									String code_msg=(String)request.getAttribute("code_msg");
								%>
							<span style="font-size:14px;color:red" id="dialogs">
								
							</span> 
							
 	                       <p ><small style="position: absolute; left:20px;top: 325px;">忘记密码？</small> <a href="<%=basePath %>Login/Emppassword.jsp" ><small style="position: absolute; left:85px;top: 325px">找回</small></a>
                    </div>
                </div>
                <div style="padding:30px;"><input type="button" class="button button-block bg-main text-big input-big" value="登录" onclick="check()"></div>
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
              url:'<%=basePath%>Emp/login.do?name='+name+'&pwd='+pwd+'&code='+code,
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
					   window.location.href="<%=basePath%>EmpJsp/EmpHome.jsp?name="+name;

				   }
              }
          });

     };   
	  }
	
	
	
	
	</script>
	
	  <script type="text/javascript" src="../js/jquery-2.0.0.min.js" ></script>
	 <script type="text/javascript" src="../js/bootstrap.js"></script>
	 

</body>
</html>

	


