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

 <link rel="stylesheet" href="<%=basePath %>css/pintuer.css">
    <link rel="stylesheet" href="<%=basePath %>css/admin.css">
	<link href=".<%=basePath %>css/bootstrap.min.css" type="text/css" rel="stylesheet">


<title>修改密码</title>
</head>
<body>
<div class="bg"></div>
<div class="container">
    <div class="line bouncein">
        <div class="xs6 xm4 xs3-move xm4-move">
            
            <div class="media media-y margin-big-bottom">           
            </div>         
            <div class="panel loginbox">
                <div class="text-center margin-big padding-big-top"><h5>管理员修改密码</h5></div>
                <div class="panel-body" style="padding:30px; padding-bottom:10px; padding-top:10px;">
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="text" class="input input-big" name="oldpwd" id="Oldpwd"  placeholder="请输入您的旧密码" data-validate="required:请填写您的旧密码" />
                            <span class="icon icon-user margin-small"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="password" class="input input-big" name="newpwd" id="Newpwd" placeholder="请输入新密码" data-validate="required:请输入您的新密码" />
                            <span class="icon icon-key margin-small"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="password" class="input input-big" name="newpwd"  id="Newpwd1" placeholder="请再次输入密码" data-validate="required:请再次输入您的新密码" />
                            <span class="icon icon-key margin-small"></span>
                        </div>
                    </div>
                    
								<span style="font-size:12px;color:red" id="dialog">
									
								</span>
                <div style="padding:30px;"><input type="submit" class="button button-block bg-main text-big input-big" value="确定修改" onclick="check()"></div>
            </div>
        </div>
    </div>
</div>

   <script type="text/javascript">
   function check(){
 	  
 	      var oldpwd =  $("#Oldpwd").get(0).value;
		  var newpwd1 = $("#Newpwd").get(0).value;
		  var newpwd2 = $("#Newpwd1").get(0).value;
 	  
		  var matchResult = true;
		  
	if(oldpwd==""){    
           document.getElementById("dialog").innerHTML="密码不能为空！";  
           matchResult=false;    
     }else if(newpwd1==""){    
           document.getElementById("dialog").innerHTML="密码不能为空！";  
           matchResult=false;    
     }else if(newpwd2==""){    
           document.getElementById("dialog").innerHTML="密码不能为空！";  
           matchResult=false;    
     }else if(newpwd1!=newpwd2){
     	document.getElementById("dialog").innerHTML="两次输入的密码不一致";  
     	matchResult=false;
     }
		  
     
     if(matchResult==true){
	    $.ajax({
         type:'POST',
         dataType: 'json',
         url:'<%=basePath%>Manager/updatePwd.do?oldpwd='+oldpwd+'&newpwd='+newpwd1,
         success:function(data,textStatus){
      	   
             var obj = eval(data);
             
             if(obj.result==0){
          	   $("#dialog").html("您的旧密码有错");
			 }else if(obj.result==1){
				 $("#dialog").html("更新出错");				 
			 }else{
				 alert("修改成功");
				 window.location.href="<%=basePath%>ManagerJsp/info.html";
			 }
         }
     });

}; 
 	  
}
   
   
   
   </script>

     <script type="text/javascript" src="<%=basePath %>js/jquery-2.0.0.min.js" ></script>
	 <script type="text/javascript" src="<%=basePath %>js/bootstrap.js"></script>
</body>
</html>