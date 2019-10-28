<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'register.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/register.css">
	<script type="text/javascript" src="http://libs.baidu.com/jquery/1.10.2/jquery.min.js"></script>
	<link rel="stylesheet" href="css/bootstrap/3.3.6/bootstrap.min.css">
	<script type="text/javascript" src="js/bootstrap/3.3.6/bootstrap.min.js"></script>

  </head>
  
  <body>
    <div class="all">
    	<div class="register-form">
    		<form action="register-check.jsp" method="post" id="registerForm">
    			<span>用户名</span><input type="text" class="form-control" name="username" id="username">
    			<br>
    			<span>密&nbsp;&nbsp;&nbsp;&nbsp;码</span><input type="password" class="form-control" name="password" id="password">
    			<br>
    			<span>手机号</span><input type="text" class="form-control" name="number" id="number">
    			<br>
    			<span>住&nbsp;&nbsp;&nbsp;&nbsp;址</span><input type="text" class="form-control" name="address" id="address">
    			<br>
    			<input type="reset" class="btn btn-default" value="重置">
    			<input type="submit" class="btn btn-default" value="注册">
    		</form>
    		
    		<script type="text/javascript">
    		
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
    			 
    			
    			function checkNumber(){
	    			//获取手机号的值
    						var number = $("#number").val();
    						//定义正则
    						var reg_number = /^1[3|4|5|7|8][0-9]{9}$/;
    						
    						var flag = reg_number.test(number);
	   						if(flag){
	    						
	    						$("#number").css("border","");
	    					}
	    					else{
	    						
	    						$("#number").css("border","1px solid red");
	    					}
    						return true;
    			}
    			
    			
    			function checkAddress(){
    				var address = $("#address").val();
    				if(address == ""){
    					$("#address").css("border","1px solid red");
    				}
    				else{
    					$("#address").css("border","");
    				}
    				return true;
    			}

	    			$(function(){
	    				$("#registerForm").submit(function(){
	    					return checkUsername() && checkPassword() && checkNumber() && checkAddress();
	    				});
	    				$("#username").blur(checkUsername);
	    				$("#password").blur(checkPassword);
	    				$("#number").blur(checkNumber);
	    				$("#address").blur(checkAddress);
	    			});
   				 });
    			
    		
    		</script>
    	</div>
    </div>
  </body>
</html>
