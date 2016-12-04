<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  errorPage="404.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title><link rel="stylesheet" type="text/css" href="<%=basePath %>css/bootstrap.css">
    
    <link rel="stylesheet" type="text/css" href="<%=basePath %>ErroJsp/stylesheets/theme.css">
    <link rel="stylesheet" href="<%=basePath %>ErroJsp/lib/font-awesome/css/font-awesome.css">

    <script src="<%=basePath %>ErroJsp/lib/jquery-1.7.2.min.js" type="text/javascript"></script>

    <!-- Demo page code -->

    <style type="text/css">ssss
        #line-chart {
            height:300px;
            width:800px;
            margin: 0px auto;
            margin-top: 1em;
        }
        .brand { font-family: georgia, serif; }
        .brand .first {
            color: #ccc;
            font-style: italic;
        }
        .brand .second {
            color: #fff;
            font-weight: bold;
        }
    </style>


  </head>
  <body class="http-error"> 
  <!--<![endif]-->
    


    

    
        <div class="row-fluid">
    <div class="http-error">
        <h1>Oops!</h1>
        <p class="info">This page doesn't exist.</p>
        <p><i class="icon-home"></i></p>
        <p><a href="<%=basePath %>Login/Home.jsp">Back to the home page</a></p>
    </div>
</div>


    


    <script src="<%=basePath %>js/bootstrap.js"></script>
    <script type="text/javascript">
        $("[rel=tooltip]").tooltip();
        $(function() {
            $('.demo-cancel-click').click(function(){return false;});
        });
    </script>
    
  </body>
</html>


