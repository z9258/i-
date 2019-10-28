<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/login.css">
	<script type="text/javascript" src="http://libs.baidu.com/jquery/1.10.2/jquery.min.js"></script>
	<link rel="stylesheet" href="css/bootstrap/3.3.6/bootstrap.min.css">
	<script type="text/javascript" src="js/bootstrap/3.3.6/bootstrap.min.js"></script>

  </head>
  
  <body>
    <div class="all">
    	<div class="login-form">
    		<form action="login-check.jsp" method="post">
    			<div class="form-info">
    				<span>会员登录</span>
    			</div>
    			<div class="form-input">
    				<input type="text" id="username" class="form-control" placeholder="请输入用户名" name="username">
    				<br/>
    				<input type="password" id="password" class="form-control" placeholder="请输入密码" name="password">
    				<input type="submit" class="btn" value="登录">
    				<a href="register.jsp">没有账号?立即注册</a>
    			</div>
    		</form>
    		
    		
    	</div>
    	
    	<!-- 判断用户名密码不能为空 -->
    	<script>
    		$(document).ready(function(){
    			function checkUsername(){
    				var username = $("#username").val();
    				if(username == ""){
    					$("#username").css("border","1px solid red");
    				}
    				else{
    					$("#username").css("border","");
    				}
    				return true;
    			}
    			
    			
    			function checkPassword(){
	    			var password = $("#password").val();
    				if(password == ""){
    					$("#password").css("border","1px solid red");
    				}
    				else{
    					$("#password").css("border","");
    				}
    				return true;
    			}
    			
    			$(function(){
	    				$("#registerForm").submit(function(){
	    					return checkUsername() && checkPassword();
	    				});
	    				$("#username").blur(checkUsername);
	    				$("#password").blur(checkPassword);
	    				
	    			});
    		});
    	</script>
    </div>
  </body>
</html>
