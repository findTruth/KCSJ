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

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>菜单增加页面</title>
</head>

<link rel="stylesheet" href="<%=basePath%>css/pintuer.css">
<link rel="stylesheet" href="<%=basePath%>css/admin.css">
<body>
	<div class="panel admin-panel">
		<div class="panel-head">
			<strong><span class="icon-pencil-square-o"></span>增加菜品</strong>
		</div>
		<div class="body-content">
			<form method="post" class="form-x" action=""
				enctype="multipart/form-data">
				<div class="form-group">
					<div class="label">
						<label>菜品名：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" id="mname"
							data-validate="required:请输入菜品名" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>图片：</label>
					</div>
					<div class="field">
						<input type="text" id="url1" name="img" class="input tips"
							style="width: 25%; float: left;" value="" data-toggle="hover"
							data-place="right"
							data-image="C:\Users\eason\Pictures\lovewallpaper\340941-106.jpg" />
						<input type="file" name="file" class="button bg-blue margin-left"
							id="image1" value="+ 浏览上传" style="float: left;"
							onchange="put(this)">
						<div class="tipss">
							<img id="Images" alt="" style="width: 100px; height: 80px;"
								src="你自己的透明图片" />
						</div>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>菜品类别：</label>
					</div>
					<div class="field">
						<select id="type" class="input w50">
							<option value="">请选择分类</option>
							<option>粤菜</option>
							<option>川菜</option>
							<option>饮料</option>
							<option>湘菜</option>
						</select>
						<div class="tips"></div>
					</div>
				</div>



				<div class="form-group">
					<div class="label">
						<label>菜品价格：</label>
					</div>
					<div class="field">
						<input type="text" class="input" id="price" value=""
							style="width: 200px;" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>会员价格：</label>
					</div>
					<div class="field">
						<input type="text" class="input" id="vprice" value=""
							style="width: 200px;" />
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label></label>
					</div>
				</div>
			</form>
			<div class="field" style="position: absolute;left: 20px;">
				<button class="button bg-main icon-check-square-o" type="buttom"
					onclick="submit()">提交</button>
			</div>
			&nbsp;&nbsp;
		<button type="button" class="button bg-main icon-check-square-o" onclick="back()" style="position: absolute;left: 200px;">返回上一层</button>
		</div>
	</div>
</body>

<script type="text/javascript">
	var picture;

	//把图片放入右边的img中
	function put(data) {

		picture = data;
		$("#url1").val(data.value);

		showImage(data);
	}

	
	//返回到菜单主页面
	function back(){
		
		var msg =  confirm("确认返回？？");
		if(msg==true){
			window.location = "http://localhost:8080/KCSJ/Manager/MenusList.do";
		}
		
	}
	
	
	function showImage(obj) {

		var newPreview = document.getElementById("Images");
		if (obj) {
			//ie
			if (window.navigator.userAgent.indexOf("MSIE") >= 1) {
				obj.select();
				newPreview.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);";
				newPreview.filters
						.item("DXImageTransform.Microsoft.AlphaImageLoader").src = document.selection
						.createRange().text;
				return;
			}
			//firefox
			else if (window.navigator.userAgent.indexOf("Firefox") >= 1) {
				if (obj.files) {
					newPreview.src = window.URL.createObjectURL(obj.files
							.item(0));
					return;
				}
				newPreview.src = obj.value;
				return;
			}
			newPreview.src = obj.value;
			return;
		}
	}

	function submit() {

		var mname = $("#mname").val();
		var image = $("#image1").val();
		var type = $("#type").val();
		var price = $("#price").val();
		var vprice = $("#vprice").val();

		$.ajaxFileUpload({
					type : 'post',
					dataType : 'text',
					fileElementId : 'image1',
					secureuri : false,
					url : 'http://localhost:8080/KCSJ/Manager/upload.do?mname='
							+ mname + '&type=' + type + '&price=' + price
							+ '&vprice=' + vprice,
					success : function(data, status) {
						if (data == "true") {
							alert("添加成功");
							var r1 = confirm("是否回到主页");
							if (r1 == true) {
								window.location = "http://localhost:8080/KCSJ/Manager/MenusList.do"
							}
						} else {
							alert("出错了");

						}
					}
				})

	}
</script>
<script src="<%=basePath%>js/jquery.js"></script>
<script src="<%=basePath%>ManagerJsp/js/ajaxfileupload.js"></script>
<script src="<%=basePath%>js/pintuer.js"></script>

</html>