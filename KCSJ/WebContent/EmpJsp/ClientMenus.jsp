<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>顾客点餐</title>
<link rel="stylesheet" href="<%=basePath%>css/pintuer.css">
<link rel="stylesheet" href="<%=basePath%>css/admin.css">
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.css">
<link rel="stylesheet" href="<%=basePath%>css/bootstrap-table.min.css">




</head>
<body>

	<div class="panel admin-panel">
		<div class="panel-head">
			<strong class="icon-reorder"> 内容列表</strong> <a href=""
				style="float: right; display: none;">添加字段</a>
		</div>
		<div class="padding border-bottom">
			<ul class="search" style="padding-left: 10px;">
				<li><a class="button border-main icon-plus-square-o"
					onclick="look()">查看点餐情况</a></li>

				<if condition="$iscid eq 1">
				<li><select name="cid" class="input"
					style="width: 200px; line-height: 17px;" onchange="changesearch()">
						<option value="">请选择菜系类别</option>
						<option value="">粤菜</option>
						<option value="">川菜</option>
						<option value="">果汁</option>
						<option value="">湘菜</option>
				</select></li>
				</if>
				<li><input type="text" placeholder="请输入搜索关键字" name="keywords"
					class="input"
					style="width: 250px; line-height: 17px; display: inline-block" />
					<a href="javascript:void(0)" class="button border-main icon-search"
					onclick="changesearch()"> 搜索</a></li>
			</ul>
		</div>
		<table class="table table-hover text-center">
			<thead>
				<tr>
					<th width="100" style="text-align: left; padding-left: 20px;">ID</th>
					<th width="10%">菜系</th>
					<th width="10%">名称</th>
					<th>图片</th>
					<th>价格（元/份）</th>
					<th>会员价（元/份）</th>
					<th>数量(份)</th>
					<th>月售（份）</th>
					<th width="210">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach varStatus="i" var="list" items="${list}">
					<tr>
						<td><c:out value="${list.mno}"></c:out></td>
						<td><c:out value="${list.mtype}"></c:out></td>
						<td><c:out value="${list.msname}"></c:out></td>
						<td width="10%"><img src="<%=basePath %>EmpJsp/${list.mimg}"
							alt="" width="70" height="50" /></td>
						<td><c:out value="${list.msfee}"></c:out></td>
						<td><c:out value="${list.mvfee}"></c:out></td>
						<td><select id="qutity">
								<option>0</option>
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>

						</select></td>
						<td><c:out value="${list.msale}"></c:out></td>
						<td>
							<div class="button-group">
								<a class="button border-main"
									onclick="addMenus('${list.msname}',${list.msfee},${list.mvfee},this);"><span
									class="icon-edit">+</span></a>
							</div>
						</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>


	<!-- 顾客已点菜界面 -->
	<div class="modal fade" id="MenusDiv" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close"></button>
					<h4 class="modal-title" id="myModalLabel">客户点餐信息</h4>
				</div>
				<div class="modal-body">
					<input type="text" placeholder="请输入顾客居住的房间号" name="keywords"
						class="input"
						style="width: 180px; line-height: 17px; display: inline-block" />
					<table class="table table-hover text-center">
						<thead>
							<tr>
								<th>菜名</th>
								<th>价格（元/份）</th>
								<th>会员价（元/份）</th>
								<th>数量(份)</th>
								<th width="210">操作</th>
							</tr>
						</thead>
						<tbody id="lookMenus">


						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
					</button>
					<button type="button" id="btn_submit" class="btn btn-primary"
						onclick="check()">
						<span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>马上送达
					</button>
				</div>
			</div>
		</div>
	</div>






	<script type="text/javascript">
	
	var arr=[];
	
	var $tbody ;
	
	//顾客点菜的购物车
	function addMenus(msname,mfee,vfee,data){
		
		//获得tr对象
		var trObject = $(data).parent().parent().parent();
		
		//获得顾客点的份数
		var qutity = trObject.children('td').children('select').get(0).value;
		

	  //用Dictionary进行键值对的储存
	    var d = new Dictionary();
	    d.put("mfee", mfee);
	    d.put("vfee", vfee);
	    d.put("qutity",qutity);
	    d.put("msname",msname);
		
	    arr.push(d);
	    
	    alert("添加成功");
	    
	   
	    trObject.children('td').children('select').get(0).value = 0;
	}
	
	
	//查看顾客已点的菜(MenusDiv的弹出)
	function look(){

		$('#MenusDiv').modal();
		
		$tbody= $("#lookMenus");
		
      	$tbody.empty();  
      	            for (var i = 0; i < arr.length; i++) { 
      	            	var table="<tr class='warning'><td>"+arr[i].get('msname')+"</td><td>"+arr[i].get('mfee')+"</td><td>"+arr[i].get('vfee')+"</td><td>"+arr[i].get('qutity')+"</td>"+"<td><a onclick='deleteMenus("+'"'+arr[i].get('msname')+'"'+")'>删除</a></td></tr>";
      	            	$tbody.append(table);
      	            }
		
		
	}
	
	//确认点餐
	function deleteMenus(msname){
		
		$tbody= $("#lookMenus");
		
		for(var i = 0;i<arr.length;i++){
			if(msname==arr[i].get('msname')){
				arr.splice(i,1);
				
			}
		}
		
		$tbody.empty();  
          for (var i = 0; i < arr.length; i++) { 
          	var table="<tr class='warning'><td>"+arr[i].get('msname')+"</td><td>"+arr[i].get('mfee')+"</td><td>"+arr[i].get('vfee')+"</td><td>"+arr[i].get('qutity')+"</td>"+"<td><a onclick='deleteMenus("+'"'+arr[i].get('msname')+'"'+")'>放弃</a></td></tr>";
          	$tbody.append(table);
          }
	}
	
	
	function check(){
		
		
	}
	
	//搜索
	function changesearch() {
		alert("aaa");
	}
	
	//自定义字典对象
	function Dictionary(){
	 this.data = new Array();
	 
	 this.put = function(key,value){
	  this.data[key] = value;
	 };

	 this.get = function(key){
	  return this.data[key];
	 };

	 this.remove = function(key){
	  this.data[key] = null;
	 };
	 
	 this.isEmpty = function(){
	  return this.data.length == 0;
	 };

	 this.size = function(){
	  return this.data.length;
	 };
	}
	
	</script>
</body>




<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>js/pintuer.js"></script>
<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>



</html>