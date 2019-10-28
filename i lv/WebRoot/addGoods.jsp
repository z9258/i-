<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addGoods.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="http://libs.baidu.com/jquery/1.10.2/jquery.min.js"></script>
	<link rel="stylesheet" href="css/bootstrap/3.3.6/bootstrap.min.css">
	<script type="text/javascript" src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
	<style type="text/css">
		*{
			margin: 0;
			padding: 0;
			overflow-y: hidden;
		}
		.all{
			height:100%;
			width: 100%;
			position: relative;
		}
		.all .form{
			height: 500px;
			width: 600px;
			position: absolute;
			top:50%;
			left:50%;
			margin-top:-250px;
			margin-left:-300px;
			text-align: center;
		}
		
		.all .form .form-control{
			display:inline-block;
			width: 300px;
			margin-top:10px;
			background-color: transparent;
		}
		.all .form .btn-default{
			display: inline-block;
			margin-top:20px;
			background-color: transparent;
		}
	</style>
  </head>
  
  <body>
	    <div class="all">
	    	<form action="addGoods-check.jsp" method="post" onsubmit="return check(this)" class="form">
		    	<span>景区名称</span><input type="text" class="form-control" name="goods_name">
	    		<br>
	   			<span>景区类型</span><input type="text" class="form-control" name="goods_type">
	   			<br>
	   			<span>景区介绍</span>
				<textarea rows="2" cols="30" name="goods_intro" class="form-control"></textarea>
	   			<br>
	   			<span>特色美食</span><input type="text" class="form-control" name="goods_food">
	   			<br>
	   			<span>图片信息</span><input type="text" class="form-control" name="goods_img">
	   			<br>
	   			<span>景区价格</span><input type="text" class="form-control" name="goods_price">
	   			<br>
	   			<span>学生票价</span><input type="text" class="form-control" name="goods_stuPrice">
	   			<br>
	   			<span>儿童票价</span><input type="text" class="form-control" name="goods_chPrice">
	   			<br>
	   			<input type="submit" class="btn btn-default" value="添加">
	   			<input type="reset" class="btn btn-default" value="重置">
	   			<a href="login.jsp">
	   				<input type="button" class="btn btn-default" value="返回">
	   			</a>
	    	</form>
	    </div>
  </body>
</html>
