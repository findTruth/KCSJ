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
<title>房间增加界面</title>
 
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
						<th><h3>房间增加页面</h3></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							房间类型
						</td>
						<td>
							房间价格
						</td>
						<td>
							会员价格
						</td>
					
					</tr>
					
					<form action="<%=basePath%>Manager/addRoom.do" method="post">
					
					<tr class="active">
							<td>
							<input class="form-control"  type="text" placeholder="房间类型"  name="type" id="type1"/>
						
						</td>
						
						<td>
							<input class="form-control" type="text" placeholder="房间价格"  name="price" id="price1"/>
						
						</td>

						<td>
						
							<input class="form-control" type="text" placeholder="会员价格"  name="vprice" id="vprice1"/>
						
						</td>
					
				</tr>
				  <td>
				     <input type="button" onclick="check()" class="btn btn-default" value=" 确认增加" >
						<span style="font-size:12px;color:red;" id="dialogs">
					            			
					    </span>
					    
                  </td>
                  
				</form>
				
				</tbody>
			</table>
		</div>
	</div>
</div>
  
  <script type="text/javascript">
  function check(){
	  
	  var type = $("#type1").get(0).value;
	  var price = $("#price1").get(0).value;
	  var vprice = $("#vprice1").get(0).value;
	  
	  var matchResult = true;
	  
	  if(type==""){    
          document.getElementById("dialogs").innerHTML="房间类型不能为空！";  
          matchResult=false;    
    }else if(price==""){    
          document.getElementById("dialogs").innerHTML="价格不能为空!";  
          matchResult=false;    
    }else if(vprice==""){    
          document.getElementById("dialogs").innerHTML="价格不能为空！";  
          matchResult=false;    
    }else if(type!="单人间"&type!="双人间"&type!="电脑房"){
    	document.getElementById("dialogs").innerHTML="房间类型只能为单人间，双人间，电脑房";  
    	matchResult=false;
    	
    }
	  
    
    if(matchResult==true){
	    $.ajax({
        type:'POST',
        dataType: 'json',
        url:'<%=basePath%>Manager/addRoom.do?type='+type+'&price='+price+'&vprice='+vprice,
        success:function(data,textStatus){
     	   
            var obj = eval(data);
            
            alert(obj.result);
            
            if(obj.result==0){
         	   
         	   $("#dialogs").html("修改成功");
				   window.location.href="<%=basePath%>Manager/Roomlist.do";
		  }else{
			  $("#dialogs").html("出现错误");
			  
		  }
        }
    });

}; 
	  
}
  
  
  </script>
  
  
	  <script type="text/javascript" src="<%=basePath %>js/jquery-2.0.0.min.js" ></script>
	 <script type="text/javascript" src="<%=basePath %>js/bootstrap.min.js"></script>
	
</body>
</html>



