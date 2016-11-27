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

<style type="text/css">
#xiugai{
 display:none;  
            border:2em solid #87CEEB;  
            height:40%;  
            width:60%;  
            position:absolute;
            top:24%; 
            left:24%;  
            background: #87CEEB;  
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>客房查询界面</title>
	
    <link rel="stylesheet" href="../css/bootstrap.min.css"> 
    <link rel="stylesheet" href="../css/bootstrap-table.min.css">


</head>


     
     <script type="text/javascript" src="<%=basePath %>ManagerJsp/js/jquery.js"></script>
     
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
					  <h3>客房查询中心</h3>
					<form class="navbar-form navbar-left" role="search" action="<%=basePath%>Manager/queryRoom.do">
						<div class="form-group">
						<span>请输入要查询的房间号或房间类型：</span>
							<input class="form-control" type="text" placeholder="房间号或类型"  name="name"/>
						</div> 
						<button type="submit" class="btn btn-default">
							搜索
						</button>
					</form>
					
					  &nbsp;&nbsp;<button  class="btn btn-mini btn-danger" onclick="add()">增加房间</button>
					
				</div>
				
			</nav>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<table class="table table-bordered table-hover" id = "t_table" >
				<thead>
					<tr class="success">
					<th>房间号</th>
					<th>房间类型</th>
					<th>房间价格</th>
					<th>会员价格</th>
					<th>操作</th>
					
				</tr>
				</thead>
				
				<tbody>
				
				<c:forEach  varStatus="i" var="list" items="${Roomlist}">
					<tr class="warning">
					
						<td><c:out value="${list.rmno}"></c:out></td>
						<td><c:out value="${list.rmtype}"></c:out></td>
						<td><c:out value="${list.rmprice}"></c:out></td>
						<td><c:out value="${list.vprice}"></c:out></td>
						
						<td><a href="<%=basePath %>Manager/deleteRoom.do?rmno=<c:out value="${list.rmno}"></c:out>">移除</a>
						<a   onclick="show('${list.rmno}','${list.rmtype}','${list.rmprice}','${list.vprice}')">修改</a></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			
			<div class="gridItem" style="padding: 5px; width: 250px; float: left; text-align: left; height: 20px; font-size: 15px;" > 
                               共有 <span id="spanTotalInfor"></span> 条记录     
                               当前第<span id="spanPageNum"></span>页     
                                共<span id="spanTotalPage"></span>页
            </div>
               <div class="gridItem" style="margin-left:50px;  padding: 5px; width: 400px; float: left; text-align: center; height: 20px; vertical-align: middle; font-size: 15px;">   
                  <span id="spanFirst" >首页</span> 
                      &nbsp;&nbsp;<span id="spanPre">上一页</span>
                  <span id="spanInput" style="margin: 0px; padding: 0px 0px 4px 0px; height:100%; "> 
                                                       第<input id="Text1" type="text" class="TextBox" onkeyup="changepage()"   style="height:20px; text-align: center;width:50px" />页 
                 </span>
                 &nbsp;&nbsp;<span id="spanNext">下一页</span> 
                 &nbsp;&nbsp;<span  id="spanLast">尾页</span> 
        </div>
		</div>
	</div>
	
	 
	 
	 
	    <div  id="xiugai">				
				    <!--修改页面的表单 -->
					
					
					    
							<small>房间号</small><input   type="text"  name="rmno" id="rmno1"  readonly/>&nbsp;&nbsp;&nbsp;
						
							<small>房间类型</small><input   type="text"   name="type" id = "type1"/><br><br><br>
						
							<small>房间价格</small><input  type="text"   name="price" id="price1"/>&nbsp;&nbsp;&nbsp;
						
							<small>会员价格</small><input  type="text"  name="vprice" id="vprice1"/><br><br>
					    <span style="font-size:12px;color:red;  position:absolute; left: 400px;top: 100px; " id="dialogs">
					          				
					    </span>
					  <br>
					    
				     <input  type="button" id="Btup" onclick="check()"  value="确认修改"/>
			        <input type="button" value="关闭" onclick="closeDiv()">
				
	</div>

  
  <script type="text/javascript">
  
          var theTable = document.getElementById("t_table");
          var txtValue = document.getElementById("Text1").value;
          
      function add(){
    	  
    	  window.location.href = "<%=basePath%>ManagerJsp/ManagerRoom/addRoom.jsp" ;
    	  
      }

      //修改页面的关闭
      function closeDiv(){
        	 document.getElementById("xiugai").style.display = "none";
          }
      //修改页面的弹出
    	  function show(rmno,type,price,vprice) {
    		  document.getElementById("xiugai").style.display = "block";
    		  $("#rmno1").get(0).value = rmno;
    		  $("#type1").get(0).value = type;
    		  $("#price1").get(0).value = price;
    		  $("#vprice1").get(0).value = vprice;
    	    }
      
          /*改变分页的值*/
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
          
          function check(){
        	  
        	  var rmno =  $("#rmno1").get(0).value;
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
                url:'<%=basePath%>Manager/updateRoom.do?rmno='+rmno+'&type='+type+'&price='+price+'&vprice='+vprice,
                success:function(data,textStatus){
             	   
                    var obj = eval(data);
                    
                    if(obj.result==1){
                 	   
                 	   $("#dialogs").html("修改成功");
  					   window.location.href="<%=basePath%>Manager/Roomlist.do";
                 	   
  				   }
                }
            });

       }; 
        	  
     }
      
  </script>
  
  
	 <script type="text/javascript" src="<%=basePath %>ManagerJsp/js/TableFenYe.js"></script>

</body>
</html>
