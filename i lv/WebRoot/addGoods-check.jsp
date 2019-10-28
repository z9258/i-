<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="goods" class="com.db.GoodsBean"></jsp:useBean>
<jsp:setProperty property="*" name="goods"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addGoods-check.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   	<%
   		try{
   			request.setCharacterEncoding("UTF-8");
   			response.setCharacterEncoding("UTF-8");
   			Class.forName("com.mysql.cj.jdbc.Driver");
	   		//加载数据库驱动
			String url = "jdbc:mysql://localhost:3306/goods?useSSL=false&serverTimezone=UTC";
			String username = "root";
			String password = "zc971126";
			Connection conn = DriverManager.getConnection(url,username,password);
			//添加景区的sql信息
			String sql = "insert into goods(goods_name,goods_type,goods_intro,goods_food,goods_img,goods_price,goods_stuPrice,goods_chPrice)values(?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,goods.getGoods_name());
			ps.setString(2,goods.getGoods_type());
			ps.setString(3,goods.getGoods_intro());
			ps.setString(4,goods.getGoods_food());
			ps.setString(5,goods.getGoods_img());
			ps.setDouble(6,goods.getGoods_price());
			ps.setDouble(7,goods.getGoods_stuPrice());
			ps.setDouble(8,goods.getGoods_chPrice());
			int row = ps.executeUpdate();
			if(row > 0 ){
				out.print("成功添加了" + row + "条数据.即将返回添加页面");
				response.setHeader("refresh", "3;URL=addGoods.jsp");
			}
			ps.close();
			conn.close();
   		}catch (Exception e){
   			out.print("景区信息添加失败");
   			e.printStackTrace();
   		}
   	 %>
  </body>
</html>
