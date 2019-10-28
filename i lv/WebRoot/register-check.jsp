<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	request.setCharacterEncoding("UTF-8");
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'register-suc.jsp' starting page</title>
    
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
  		<jsp:useBean id="user" class="com.db.UserBean"></jsp:useBean>
  		<jsp:setProperty property="*" name="user"/>
    	<%
    		try{
    			request.setCharacterEncoding("UTF-8");
    			//加载数据库驱动
    			Class.forName("com.mysql.cj.jdbc.Driver");
    			String url = "jdbc:mysql://localhost:3306/user?useSSL=false&serverTimezone=UTC";
				String username = "root";
				String password = "zc971126";
				//创建数据库连接
				Connection conn = DriverManager.getConnection(url,username,password);
				//添加用户信息的sql语句
				String sql = "insert into users(username,password,number,address)values(?,?,?,?)";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1,user.getUsername());
				ps.setString(2,user.getPassword());
				ps.setString(3,user.getNumber());
				ps.setString(4,user.getAddress());
				int row = ps.executeUpdate();
				if(row > 0){
					out.print("注册成功,即将跳转到登陆界面");
					response.setHeader("refresh", "3;URL=login.jsp");
				}
				ps.close();
				conn.close();
    		} catch(Exception e){
    				out.print("注册失败,即将返回注册页面");
    				response.setHeader("refresh", "3;URL=register.jsp");
    				e.printStackTrace();
    		}
    	 %>
    	 </div>
  </body>
</html>
