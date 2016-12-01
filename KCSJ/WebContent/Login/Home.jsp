<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>


<html>
  <head>
    <title>主页</title>
    
 <%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>   
    
	 <link href="<%=basePath %>css/bootstrap.min.css" type="text/css" rel="stylesheet">
	 
	 <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	 
	</head>
	<body>
	
	<div style="position:absolute;z-index:-1;width:100%;height:100%;">
    	<img src="img/beijin.jpg" width="100%" height="100%" />
    </div>
	
	<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron well">
			    
			    <ul class="nav nav-pills">
				<li class="active">
					<a href="Home.jsp">主页</a>
				</li>
				<li>
					<a href="EmpLogin.jsp" >员工登录</a>
				</li>
				<li>
					<a href="ManagerLogin.jsp" >管理员登录</a>
				</li>
				<li>
					<a href="Register.jsp">管理员注册</a>
				</li>
				<li>
					 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					 今日天气状况
				</li>
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               
               <iframe name="sinaWeatherTool"   src="http://weather.news.sina.com.cn/chajian/iframe/weatherStyle41.html?city=%E9%95%BF%E6%B2%99" width="270" height="113" marginwidth="0" marginheight="0" hspace="0" vspace="0" frameborder="0" scrolling="no"></iframe>
				<li class="dropdown pull-right">
					
					<ul class="dropdown-menu">
						<li>
							<a href="#">Action</a>
						</li>
						<li>
							<a href="#">Another action</a>
						</li>
						<li>
							<a href="#">Something else here</a>
						</li>
						<li class="divider">
						</li>
						<li>
							<a href="#">Separated link</a>
						</li>
					</ul>
				</li>
			</ul>
			
				<h2>
					酒店管理系统!
				</h2>
			</div>
			
		</div>
	</div>
				
			</div>
			<div class="carousel slide" id="carousel-250090">
				<ol class="carousel-indicators">
					<li class="active" data-slide-to="0" data-target="#carousel-250090">
					</li>
					<li data-slide-to="1" data-target="#carousel-250090">
					</li>
					<li data-slide-to="2" data-target="#carousel-250090">
					</li>
				</ol>
				<div class="carousel-inner">
					<div class="item active">
						<img alt="Carousel Bootstrap First" src="../img/1.png" />
						<div class="carousel-caption">
							<h4>
								First Thumbnail label
							</h4>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
						</div>
					</div>
					<div class="item">
						<img alt="Carousel Bootstrap Second" src="../img/2.png" />
						<div class="carousel-caption">
							<h4>
								Second Thumbnail label
							</h4>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
						</div>
					</div>
					<div class="item">
						<img alt="Carousel Bootstrap Third" src="../img/3.png" />
						<div class="carousel-caption">
							<h4>
								Third Thumbnail label
							</h4>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
						</div>
					</div>
				</div> <a class="left carousel-control" href="#carousel-250090" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-250090" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
		</div>
	</div>
</div>
	


	  <script type="text/javascript" src="<%=basePath %>js/jquery-2.0.0.min.js" ></script>
	 <script type="text/javascript" src="<%=basePath %>js/bootstrap.js"></script>
	 
	 <script type="text/javascript">
	     function show(){
	    	 
	    	 document.getElementById("form").style.display='block';
	    	 
	    	 document.getElementById("h2").style.display='block';
	    	 
	     }
	     
	     
	     function ff(){
	  			var img=document.getElementById("i1");
	  			//控制变量达到Url不重复，避免浏览器缓存:随机数,时间
	  			var date=new Date();
	  			img.src="check?time="+date.getMilliseconds();
	  		}
	 
	 </script>
	 
</body>
</html>
