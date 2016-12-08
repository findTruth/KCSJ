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
	
    <link rel="stylesheet" href="<%=basePath %>css/bootstrap.min.css"> 
    <link rel="stylesheet" href="<%=basePath %>css/bootstrap-table.min.css">


</head>


     
     <script type="text/javascript" src="<%=basePath %>ManagerJsp/js/jquery.js"></script>
     
<body>
 <div class="container-fluid" id="listpanel">
	<div class="row">
		
		<div class="col-md-12">
		
			<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					 
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						 <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
					</button> 
				</div>
				
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					  <h3>客房查询中心</h3>
					<form class="navbar-form navbar-left">
						<div class="form-group">
						<span>请输入要查询的房间号或房间类型：</span>
							<input class="form-control" type="text" placeholder="房间号或类型" id="sousuo"  name="name"/>
						</div> 
						<button type="button" class="btn btn-default" onclick="search()">
							搜索
						</button>
					</form>
						&nbsp;&nbsp;<button  class="btn btn-mini btn-danger" onclick="addDiv();">增加房间</button>
					
					
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
				
				<tbody id="Roomtable">
				
				<c:forEach  varStatus="i" var="list" items="${Roomlist}">
					<tr class="warning">
					
						<td><c:out value="${list.rmno}"></c:out></td>
						<td><c:out value="${list.rmtype}"></c:out></td>
						<td><c:out value="${list.rmprice}"></c:out></td>
						<td><c:out value="${list.vprice}"></c:out></td>
						
						<td><a class="btn btn-mini btn-danger" href="<%=basePath %>Manager/deleteRoom.do?rmno=<c:out value="${list.rmno}"></c:out>">移除</a>
						<a class="btn btn-mini btn-danger"  onclick="xiugai('${list.rmno}','${list.rmtype}','${list.rmprice}','${list.vprice}')">修改</a></td>
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
	
	
	
	
	
	 <!-- bootstrap的修改界面 -->
	<div class="modal fade" id="update" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">房间修改</h4>
				</div>
				<div class="modal-body">

					<div class="form-group">
						<label for="txt_departmentname">房间编号</label> <input type="text"
							name="txt_departmentname" class="form-control" id="rmno"
							placeholder="房间编号" readonly="readonly">
					</div>
					<div class="form-group">
						 <select id="type" name="usertype" class="selectpicker show-tick form-control" >
                                        <option value="单人间">单人间</option>
                                        <option value="双人间">双人间</option>
                                        <option value="电脑房">电脑房</option>
                                </select>
					</div>
					<div class="form-group">
						<label for="txt_departmentlevel">房间价格</label> <input type="text"
							name="txt_departmentlevel" class="form-control" id="price"
							placeholder="房间价格">
					</div>
					<div class="form-group">
						<label for="txt_statu">会员价格</label> <input type="text"
							name="txt_statu" class="form-control" id="vprice"
							placeholder="会员价格">
					</div>
					
					<span style="font-size: 15px; color: red; " id="dialogs"> </span>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
					</button>
					<button type="button" id="btn_submit" onclick="updateRoom()"
						class="btn btn-primary">
						<span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>确认修改
					</button>
				</div>
			</div>
		</div>
	</div>

	<!-- bootstrap的修改界面 -->


    <!-- bootstrap的增加房间界面 -->
    
    
	<div class="modal fade" id="addDiv" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">添加房间界面</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						 <select id="newtype" name="usertype" class="selectpicker show-tick form-control" >
                                        <option value="单人间">单人间</option>
                                        <option value="双人间">双人间</option>
                                        <option value="电脑房">电脑房</option>
                                </select>
					</div>
					<div class="form-group">
						<label for="txt_departmentlevel">房间价格</label> <input type="text"
							name="txt_departmentlevel" class="form-control" id="newprice"
							placeholder="房间价格">
					</div>
					<div class="form-group">
						<label for="txt_statu">会员价格</label> <input type="text"
							name="txt_statu" class="form-control" id="newvprice"
							placeholder="会员价格">
					</div>
					
					<span style="font-size: 15px; color: red; " id="adddialogs"> </span>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
					</button>
					<button type="button" id="btn_submit" onclick="addRoom()"
						class="btn btn-primary">
						<span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>确认增加
					</button>
				</div>
			</div>
		</div>
	</div>

	<!-- bootstrap的增加界面弹框 -->

  
  <script type="text/javascript">
  
          var theTable = document.getElementById("t_table");
          var txtValue = document.getElementById("Text1").value;
          
          var totalPage = document.getElementById("spanTotalPage");
          //总页数
          var pageNum = document.getElementById("spanPageNum");//当前页 
          var totalInfor = document.getElementById("spanTotalInfor");//记录总数
          var pageNum2 = document.getElementById("Text1");//当前页文本框
          
          var spanPre = document.getElementById("spanPre");//上一页 
          var spanNext = document.getElementById("spanNext");//下一页 
          var spanFirst = document.getElementById("spanFirst");//首页
          var spanLast = document.getElementById("spanLast");//尾页 
          var pageSize = 5;
          //每页信息条数
          
           var numberRowsInTable = theTable.rows.length-1;//表格最大行数
         
           
           
       //增加房间方法(弹框)
      function addDiv(){
        	   
    	  $("#adddialogs").html("");  
    	  $('#newprice').get(0).value="";
		  $('#newvprice').get(0).value="";
    	  $("#addDiv").modal();
      }
           
           
      //与后台交互的增加房间   
       function addRoom(){
    	  
    	  
    		   var type = $('#newtype').val();
    		   var price = $('#newprice').val();
    		   var vprice = $('#newvprice').val();
    	  
    		   if(type==""){
    			   $("#adddialogs").html("种类不能为空");
    			   
    		   }else if(price==""){
    			   $("#adddialogs").html("价格不能为空");
    			   
    		   }else if(vprice==""){
    			   $("#adddialogs").html("价格不能为空");
    			   
    		   }else{
    			   var msg  = confirm("确认增加？？");
    	    	   if(msg==true){
    	    		   
    	    			   $.ajax({
    							  type:'post',
    				            dataType: 'json',
    				            url:'http://localhost:8080/KCSJ/Manager/addRoom.do?type='+type
    				            		+"&price="+price+"&vprice="+vprice,
    				            success:function(data){
    			                     var obj = eval(data);
    			                     if(obj.result==0){
    			                    	 alert("增加成功");
    			                    	 window.location = "http://localhost:8080/KCSJ/Manager/Roomlist.do";
    			                    	 
    			                     }else{
    			                    	 $("#adddialogs").html("出错"); 
    			                     }
    				          }
    						})	
    	    		   
    	    	   }
    		   }
       }
           
           
           
        //搜索房间号或房间类型查询房间   
        function search(){
        	 
        	var reg = /^\d{3}/;
        	
        	var sousuo = $('#sousuo').val();
        	
        	
			if(reg.test(sousuo)==true||sousuo==("单人间")||sousuo==("双人间")||sousuo==("电脑房")){
				 $.ajax({
					  type:'post',
		            dataType: 'json',
		            url:'http://localhost:8080/KCSJ/Manager/queryRoom.do?str='+sousuo,
		            success:function(data){
		           	 flush(data);
		          }
				})
				
			}else{
				
				alert("输入有误");
				
			}        	   
         }
           
           
           
           
           
           
    //接受来自list的数据并放到修改页面中
		function xiugai(rmno,type,price,vprice) {
			
			document.getElementById("dialogs").innerHTML="";  
			
			document.getElementById("rmno").value = rmno;
			document.getElementById("type").value = type;
			document.getElementById("price").value = price;
			document.getElementById("vprice").value =vprice;
			$("#update").modal();
		}

    //修改房间并传到后台
		function updateRoom(){
			
			var rmno = $('#rmno').val() ;
			var type = $('#type').val();
		    var	price = $('#price').val() ;
			var vprice = $('#vprice').val()  ;
			
			if(rmno==""){
				document.getElementById("dialogs").innerHTML="房间号不能为空";
			}else if(price==""){
				document.getElementById("dialogs").innerHTML="价格不能为空";
			}else if(vprice==""){
				document.getElementById("dialogs").innerHTML="价格不能为空";
			}else{
				var comfirm  = confirm("确认修改？？");
				if(comfirm==true){
					$.ajax({
						  type:'post',
			            dataType: 'json',
			            url:'http://localhost:8080/KCSJ/Manager/updateRoom.do?rmno='+rmno
			            		+"&type="+type+"&price="+price+"&vprice="+vprice,
			            success:function(data){
		                     var obj = eval(data);
		                     if(obj.result==1){
		                    	 alert("修改成功");
		                    	 window.location = "http://localhost:8080/KCSJ/Manager/Roomlist.do";
		                    	 
		                     }else{
		                    	 document.getElementById("dialogs").innerHTML="出错";  
		                     }
			          }
					})		
				}
			}
		}

    
		//封装ajax的刷新表格方法
		function flush(data){
			 var $tbody = $("#Roomtable");
			 $tbody.empty();
	      	            for (var j = 0; j < data.length; j++) { 
	      	              var table = "<tr><td>"
									+ data[j].rmno
									+ "</td><td>"
									+ data[j].rmtype
									+ "</td><td>"
									+ data[j].rmprice
									+ "</td><td>"
									+ data[j].vprice
									+ "</td><td>"
									+"<input type='button' class='btn btn-mini btn-danger' name='delete' value='删除'/>&nbsp;&nbsp;"
									+"<input type='button' class='btn btn-mini btn-danger' name='xiugai' value='修改' />"
									+"</td></tr>"
	      	            	$tbody.append(table);
	      	            	
	      	            }
	      	            
	      	            refreshFenYe();
	      	            
	      	             $("input[name='delete']").click(function(){
	      	            
	      	            	trObject = $(this).parent().parent();
	  	            		var rmno = trObject.children('td').eq(0).html();
	  	            		
	  	            		var msg =  confirm("确认删除？？");
	  	            		if(msg==true){
	  	            			alert("删除成功");
 	      	            	window.location.href="<%=basePath%>Manager/deleteRoom.do?rmno="+rmno;
	  	            			
	  	            		}
	      	            	
	      	           });
	      	            $("input[name='xiugai']").click(function(){
	  	            		trObject = $(this).parent().parent();
	  	            		
	  	            		var rmno = trObject.children('td').eq(0).html();
	  	            		var type = trObject.children('td').eq(1).html();
	  	            		var price = trObject.children('td').eq(2).html();
	  	            		var vprice = trObject.children('td').eq(3).html();
	  	            		xiugai(rmno,type,price,vprice);
	  	            	});
			
		}
    
    
    
		
		//封装分页刷新
		function refreshFenYe() {
			//重新获取对应控件
			totalPage = document.getElementById("spanTotalPage");//总页数
			pageNum = document.getElementById("spanPageNum");//当前页
			totalInfor = document.getElementById("spanTotalInfor");//记录总数
			pageNum2 = document.getElementById("Text1");//当前页文本框

			spanPre = document.getElementById("spanPre");//上一页
			spanNext = document.getElementById("spanNext");//下一页
			spanFirst = document.getElementById("spanFirst");//首页
			spanLast = document.getElementById("spanLast");//尾页
			pageSize = 5;//每页信息条数

			numberRowsInTable = theTable.rows.length - 1;//表格最大行数
			hide();
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
          
          
      
  </script>
  
    <script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
  	<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>ManagerJsp/js/TableFenYe.js"></script>

</body>
</html>
