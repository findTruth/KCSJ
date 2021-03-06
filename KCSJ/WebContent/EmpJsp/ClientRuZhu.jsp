<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<title>客户入住</title>

<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.css">
<link rel="stylesheet" href="<%=basePath%>css/bootstrap-table.min.css">

</head>


<body>

	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<h3>客房入住中心</h3>


		<form class="navbar-form navbar-left" role="search"
			action="<%=basePath%>Manager/queryRoom.do">
			<div class="form-group">

				<select class="form-control" style="width: 90px;"
					onchange="change(this)">
					<option>单人间</option>
					<option>双人间</option>
					<option>电脑房</option>

				</select> <span>请选择客户的房间种类</span>
			</div>
		</form>

	</div>

	<div class="row">
		<div class="col-md-12">
			<table class="table table-bordered table-hover" id="t_table">
				<thead>
					<tr class="success">
						<th>房间号</th>
						<th>房间类型</th>
						<th>房间价格</th>
						<th>会员价格</th>
						<th>操作</th>
					</tr>
				</thead>

				<tbody id="list">

					<c:forEach varStatus="i" var="list" items="${Roomlist}">
						<tr class="warning">

							<td><c:out value="${list.rmno}"></c:out></td>
							<td><c:out value="${list.rmtype}"></c:out></td>
							<td><c:out value="${list.rmprice}"></c:out></td>
							<td><c:out value="${list.vprice}"></c:out></td>

							<td><button type="button" class="btn btn-info"
									onclick="ruzhu(${list.rmno},'${list.rmtype}')">入住</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<div class="gridItem"
				style="padding: 5px; width: 250px; float: left; text-align: left; height: 20px; font-size: 15px;">
				共有 <span id="spanTotalInfor"></span> 条记录 当前第<span id="spanPageNum"></span>页
				共<span id="spanTotalPage"></span>页
			</div>
			<div class="gridItem"
				style="margin-left: 50px; padding: 5px; width: 400px; float: left; text-align: center; height: 20px; vertical-align: middle; font-size: 15px;">
				<span id="spanFirst">首页</span> &nbsp;&nbsp;<span id="spanPre">上一页</span>
				<span id="spanInput"
					style="margin: 0px; padding: 0px 0px 4px 0px; height: 100%;">
					第<input id="Text1" type="text" class="TextBox"
					onkeyup="changepage()"
					style="height: 20px; text-align: center; width: 50px" />页
				</span> &nbsp;&nbsp;<span id="spanNext">下一页</span> &nbsp;&nbsp;<span
					id="spanLast">尾页</span>
			</div>


			<!--普通客户入住弹框界面 -->
			<div class="modal fade" id="ClientDiv" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">×</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">客户信息</h4>
						</div>
						<div class="modal-body">

							<div class="form-group">
								<label for="txt_departmentname">客户姓名</label> <input type="text"
									name="txt_departmentname" class="form-control" id="name"
									placeholder="客户姓名">
							</div>
							<div class="form-group">
								<label for="txt_parentdepartment">客户电话</label> <input
									type="text" name="txt_parentdepartment" class="form-control"
									id="tel" placeholder="客户电话">
							</div>
							<div class="form-group">
								<label for="txt_departmentlevel">客户身份证号</label> <input
									type="text" name="txt_departmentlevel" class="form-control"
									id="card" placeholder="客户身份证号">
							</div>
						</div>
						<span
							style="font-size: 15px; color: red; position: absolute; left: 30px; top: 320px;"
							id="dialogs"> </span>

						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">
								<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
							</button>
							<button type="button" class="btn btn-primary" onclick="check()">
								<span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>确认入住
							</button>
						</div>
					</div>
				</div>
			</div>

			<!-- 会员弹框界面 -->
			<div class="modal fade" id="vipDiv" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">×</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">会员信息</h4>
						</div>
						<div class="modal-body">

							<div class="form-group">
								<label for="txt_departmentname">会员编号</label> <input type="text"
									name="txt_departmentname" class="form-control" id="vno"
									placeholder="会员编号">
							</div>
							<div class="form-group">
								<label for="txt_parentdepartment">会员身份证</label> <input
									type="text" name="txt_parentdepartment" class="form-control"
									id="vcard" placeholder="会员身份证">
							</div>
						</div>

						<span
							style="font-size: 15px; color: red; position: absolute; left: 30px; top: 250px;"
							id="Vipdialogs"> 出现错误 </span>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">
								<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
							</button>
							<button type="button" id="btn_submit" class="btn btn-primary"
								onclick="checkVip()">
								<span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>确认入住
							</button>
						</div>
					</div>
				</div>
			</div>






			<script type="text/javascript">
	 
	      var rmno; 
	      var type;
	      var theTable = document.getElementById("t_table");
          var txtValue = document.getElementById("Text1").value;
          
        //获取分页对应的控件
          var totalPage = document.getElementById("spanTotalPage");//总页数

          var pageNum = document.getElementById("spanPageNum");//当前页
          var totalInfor = document.getElementById("spanTotalInfor");//记录总数
          var pageNum2 = document.getElementById("Text1");//当前页文本框

          var spanPre = document.getElementById("spanPre");//上一页
          var spanNext = document.getElementById("spanNext");//下一页
          var spanFirst = document.getElementById("spanFirst");//首页
          var spanLast = document.getElementById("spanLast");//尾页
          var pageSize = 5;//每页信息条数

          var numberRowsInTable = theTable.rows.length-1;//表格最大行数
          
          
          
          
        //封装分页刷新
      	function refreshFenYe(){
      		
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

                numberRowsInTable = theTable.rows.length-1;//表格最大行数
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
          
          //正则会员信息
          function checkVip(){
        	  var vno = $("#vno").get(0).value;
          	 var vcard = $("#vcard").get(0).value;
        	  
          	var matchResult = true;
          	 
        	 if(vno==""){
        		document.getElementById("Vipdialogs").innerHTML="会员号不能为空！";  
                matchResult=false;    
        	 }else if(vcard==""){
         		 document.getElementById("Vipdialogs").innerHTML="身份证不能为空！";  
                 matchResult=false;    
         	 }
        	 if(matchResult==true){
        		 var r=confirm("确认入住？？");
        		 if(r==true){
        			 $.ajax({
    	  				  type:'post',
    	                  dataType: 'json',
    	                  url:'http://localhost:8080/KCSJ/Emp/VipRuZhu.do?vno='+vno+'&vcard='+vcard+'&rmno='+rmno+'&type='+type,
    	                  success:function(data){

    	                    var objs = eval(data); 
    	                	if(objs.result==1){
    	                		alert("入住成功");
    	                		var r1=confirm("是否回到主页");
    	                		if(r1==true){
    	                			window.location = "http://localhost:8080/KCSJ/RoomList/queryAllNullRoom.do"
    	                		}
    	                	}else if(objs.result==0){
    	                		 document.getElementById("Vipdialogs").innerHTML="会员信息错误";  
    	                	}else if(objs.result==2){
    	                		
    	                		 document.getElementById("Vipdialogs").innerHTML="系统错误";  
    	                	}else{
    	                		 document.getElementById("Vipdialogs").innerHTML="无此会员";
    	                	}
    	                }
    	  			})
        		 }
        	 }  
          }
          
          //正则普通客户的信息
          function check(){
        	 var name = $("#name").get(0).value;
         	 var card = $("#card").get(0).value;
         	 var tel = $("#tel").get(0).value;
         	 
         	 var matchResult = true;
         	 
         	 var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;  
         	 var regTel = /^0?1[3|4|5|8][0-9]\d{8}$/;
         	 
         	 if(name==""){
         		 document.getElementById("dialogs").innerHTML="名字不能为空！";  
                 matchResult=false;    
         	 }else if(card==""){
         		document.getElementById("dialogs").innerHTML="身份证不能为空！";  
                matchResult=false;
         	 }else if(tel==""){
         		document.getElementById("dialogs").innerHTML="电话不能为空！";  
                matchResult=false;
         	 }else if(reg.test(card)==false){
         		document.getElementById("dialogs").innerHTML="身份证格式有误";  
                matchResult=false;
         	 }else if(regTel.test(tel)==false){
         		document.getElementById("dialogs").innerHTML="电话格式有误";  
                matchResult=false;
         	 }
         	 
         	 if(matchResult==true){
         		 
         		var r=confirm("确认入住？？");
         		if (r==true){
         	     $.ajax({
 	  				  type:'post',
 	                  dataType: 'json',
 	                  url:'http://localhost:8080/KCSJ/Emp/RuZhu.do?name='+name+'&card='+card+'&tel='+tel+'&rmno='+rmno+'&type='+type,
 	                  success:function(data){

 	                    var objs = eval(data); 
 	                	if(objs.result==0){
 	                		alert("入住成功");
 	                		var r1=confirm("是否回到主页");
 	                		if(r1==true){
 	                			window.location = "http://localhost:8080/KCSJ/RoomList/queryAllNullRoom.do"
 	                		}
 	                	}else{
 	                		alert("入住失败");
 	                	}
 	                }
 	  			})
         	 }
         	 }
          }
          
         function change(data){
        		$.ajax({
  	  				type:'GET',
  	                dataType: 'json',
  	                url:'http://localhost:8080/KCSJ/RoomList/GetroomlistBytype.do?type='+data.value,
  	                success:function(data){
  	                	var $tbody = $("#list");
  	                	$tbody.empty();  
  	                	            for (var j = 0; j < data.length; j++) { 
  	                	            	var table="<tr class='warning'><td>"+data[j].rmno+"</td><td>"+data[j].rmtype+"</td><td>"+data[j].rmprice +"</td><td>"+data[j].vprice +"</td>"+"<td><a onclick='ruzhu("+data[j].rmno+','+'"'+data[j].rmtype+'"'+")'>入住</a></td></tr>";
  	                	            	$tbody.append(table);
  	                	            }
  	                	          refreshFenYe();
  	                }
  	  			})

          } 	
	 
	 </script>


			<script type="text/javascript" src="<%=basePath%>EmpJsp/js/RuZhu.js"></script>
			<script type="text/javascript" src="<%=basePath%>EmpJsp/js/TableFenYe.js"></script>
			<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
			<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
</body>
</html>