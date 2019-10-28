<%@page import="java.sql.*"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login-check.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		*{
			margin: 0;
			padding: 0;
		}
		.all{
			width:100%;
			height:100%;
			overflow-y:hidden;
			background: url(images/bg1.png);
			background-repeat: no-repeat;
			background-size: 100%;
			color: white;
			font-size:20px;
		}
	</style>
  </head>
  
  <body>
   	<div class="all">
   		<%
   			try{
   				request.setCharacterEncoding("UTF-8");
   			
    			String u = request.getParameter("username");
    			request.getSession().setAttribute("username", u);
    		
   				//加载数据库驱动
   				Class.forName("com.mysql.cj.jdbc.Driver");
   				String url = "jdbc:mysql://localhost:3306/user?useSSL=false&serverTimezone=UTC";
				String userName = "root";
				String passWord = "zc971126";
				//获取用户名和密码
				String username = request.getParameter("username");
				String pwd = request.getParameter("password");
				//连接数据库
				Connection conn = DriverManager.getConnection(url,userName,passWord);
				//定义查询语句
				String str1 = "select * from users where username='"+username+"'";
				String str2 = "select * from users where password='"+pwd+"'";
				Statement stmt1 = conn.createStatement();
				Statement stmt2 = conn.createStatement();
				//加载结果集
				ResultSet rs1 = stmt1.executeQuery(str1);
				ResultSet rs2 = stmt2.executeQuery(str2);
					
				if(rs1.next() && rs2.next()){
				
					//跳到管理员页面
					if(rs1.getString("username").equals("admin") && rs2.getString("password").equals("admin")){
						response.sendRedirect("addGoods.jsp");
						
					}
					response.sendRedirect("login-success.jsp");
					
				}

				else if(rs1.next()){
					out.print("<script type='text/javascript'>alert('密码错误，请重新输入');</script>");
					response.setHeader("refresh", "3;URL=login.jsp");
				}
				else if(rs2.next()){
					out.print("<script type='text/javascript'>alert('用户名不存在，请重新输入');</script>");
					response.setHeader("refresh", "3;URL=login.jsp");
				}
   			} catch(Exception e){
    				out.print("登录失败,即将返回登录页面");
    				response.setHeader("refresh", "3;URL=login.jsp");
    				e.printStackTrace();
    		}
   		 %>
   	</div>
  </body>
</html>
