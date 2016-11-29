<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>

<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>结账界面</title>
<link rel="stylesheet" href="<%=basePath %>css/pintuer.css">
<link rel="stylesheet" href="<%=basePath %>css/admin.css">

 <link href="<%=basePath %>css/bootstrap.css" rel="stylesheet" />
      <script src="<%=basePath %>js/jquery-2.0.0.min.js"></script>
      <script src="<%=basePath %>js/bootstrap.min.js"></script>



<script src="<%=basePath %>js/pintuer.js"></script>


<style type="text/css">


</style>




</head>
<body>
<form method="post" action="" id="listform">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder" style="font-size: 20px;">顾客退房中心</strong> </div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:100px;">
       
        
        <li>
          <input type="text" placeholder="请输入要退房的房间号" id="SouSuo" class="input" style="width:300px; line-height:17px;display:inline-block" />
          &nbsp;&nbsp;&nbsp;<a href="javascript:void(0)" class="button border-main icon-search" onclick="changesearch()" > 搜索</a></li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <thead>
      <tr>
        <th width="100" style="text-align:left; padding-left:20px">姓名</th>
        <th width="10%">身份证号</th>
        <th>房间号</th>
        <th>订餐费用</th>
        <th>电话</th>
        <th>入住时间</th>
        <th>操作</th>
      </tr>
      </thead>
      <tbody  id="List">
         
      </tbody>
    </table>
  </div>
</form>


<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
   <div class="modal-content">
    <div class="modal-header">
     <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
     <h4 class="modal-title" id="myModalLabel">客户信息</h4>
    </div>
    
	<span style="font-size: 15px;">客户姓名：</span><span style="font-size: 15px;">庞攀</span>
					    
    <span style="font-size: 15px;position: absolute;left: 200px;">入住时间：</span><span style="font-size: 15px;position: absolute;left: 300px;">2016-11-08</span>
					    
	<span style="font-size: 15px;position: absolute;left: 400px;">入住时长：</span><span style="font-size: 15px;position: absolute;left: 480px;">40</span><span style="font-size:15px;position: absolute;left: 500px;">(天)</span><br /><br />
					
	<span style="font-size: 15px;">是否是会员：</span><span style="font-size: 15px;">是</span>
    
    <span style="font-size: 15px;position: absolute;left: 200px;">退房时间：</span><span style="font-size: 15px;position: absolute;left: 300px;">2016-11-10</span>
							
							<span style="font-size: 15px;position: absolute;left: 400px;">房价:</span><span style="font-size:15px;position: absolute;left: 450px;">100</span><span style="font-size:15px;position: absolute;left: 480px;">(元/天)</span><br /><br />
							
							<span style="font-size: 15px;">身份证号：</span><span style="font-size: 15px;">431202199611300017</span>
							
							<span style="font-size: 15px;position: absolute;left: 300px;">房间费用：</span><span style="font-size: 15px;position: absolute;left: 380px;">200</span>
							
							<span style="font-size: 15px;position: absolute;left: 410px;">元</span>
							
								<span style="font-size: 15px;position: absolute;left: 450px;">点餐费用：</span><span style="font-size: 15px;position: absolute;left: 520px;">200</span>
								
								<span style="font-size: 15px;position: absolute;left: 550px;">元</span><br /><br />
						
						<span style="font-size: 15px;">房间号：  </span><span style="font-size: 18px;">101</span>
						
					    <span style="font-size: 15px;position: absolute;left: 380px;">总计：</span><span style="font-size: 15px;position: absolute;left: 450px;">400</span>
					    
					    <span style="font-size: 15px;position: absolute;left: 500px;">元</span>
    
    <div class="modal-footer">
     <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
     <button type="button" id="btn_submit" class="btn btn-primary" data-dismiss="modal"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>结账</button>
    </div>
    
    
    
   </div>
  </div>
 </div>



<script type="text/javascript">

//搜索（通过房间号或身份证号查询）
function changesearch(){	
	var sousuo = $("#SouSuo").get(0).value;	 
	
	var name;
	var card;
	var rmno;
	var mfee;
	var tel;
	var time;
	var vno = 0;
	
	
	var numberreg = /^[1-9]\d{0,2}$/; 
	
	if(numberreg.test(sousuo)==true){
		$.ajax({
			type:'post',
            dataType: 'json',
            url:'http://localhost:8080/KCSJ/Emp/ClientLeave.do?sousuo='+sousuo,
            success:function(data){
            	if(data!=null){
            		if(data[0].XinXi=="client"){
            			alert("Client");
            			
            			
              	 name = data[0].client.cname;
              	 card = data[0].client.ccard;
              	 rmno = data[0].room.rmno;
              	 mfee = data[0].client.cmfee;
              	 tel = data[0].client.ctel;
              	 time = data[0].client.cdate;
            			
            			
            		}else if(data[0].XinXi=="vip"){
            			alert(data[0].vip.vfee);
            			
            			vno = data[0].vip.vno;
            			name = data[0].vip.vname;
                     	 card = data[0].vip.vcard;
                     	 rmno = data[0].room.rmno;
                     	 mfee = data[0].vip.vfee;
                     	 tel = data[0].vip.vtel;
                     	 time = data[0].vip.vdate;
            			
            		}
            		
            	}else{
            		
            		alert("此房间无人居住，请重新输入");
            		
            	}
            	
            	alert(name);
            	
              	var $tbody = $("#List");
              	$tbody.empty();
              	var table;
        	    for (var j = 0; j < data.length; j++) { 
        	         table="<tr><td><span id='name'>"+name+"</span></td><td><span id='card'>"+card+"</span></td><td><span id='rmno'>"+rmno+
        	            	"</td><td><span id='cmfee'>"+mfee+"</span></td><td><span id='tel'>"+tel+"</span></td><td><span id='time'>"+time+"</span></td>"+
        	            	"<td><div class='button-group' onclick='Tuifang("+vno+","+'"'+name+'"'+");'><a class='button border-main' >退房</td></tr>";
        	    }
        	   // alert("01:"+table)
        	   	$tbody.append(table);

            }
		
		});
	}else{
		alert("您的输入有误");
	}
}


function closeDiv(){
	
	$("#JieZhang").get(0).style.display = "none";
	
}

function Tuifang(vno,name){
	alert(vno);
	alert(name);
	
	
	$('#myModal').modal();
	//$("#JieZhang").get(0).style.display = "block";
	
	
}

</script>
</body>
