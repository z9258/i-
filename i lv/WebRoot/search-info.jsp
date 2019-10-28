<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page import="dao.GoodsDao"%>
<%@ page import="com.db.GoodsBean"%>
<%@ page import="servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'search-info.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript"src="http://libs.baidu.com/jquery/1.10.2/jquery.min.js"></script>
<link rel="stylesheet" href="css/bootstrap/3.3.6/bootstrap.min.css">
<script type="text/javascript" src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

.all {
	width: 100%;
	height: 100%;
}
/* 头部 */

/*搜索部分*/
.all .search {
	height: 130px;
	width: 100%;
	margin-top: 10px;
	/* 防止margin塌陷 */
	overflow: hidden;
}

.all .search .search-inner {
	height: 130px;
	width: 1200px;
	margin: 0 auto;
}

.all .search .search-inner img {
	display: inline-block;
	line-height: 130px;
}

.all .search .search-inner .searchBox {
	width: 350px;
	height: 35px;
	margin-top: 37px;
	margin-left: 130px;
	border: 2px solid #f80;
}

.all .search .search-inner .searchBtn {
	display: block;
	height: 35px;
	width: 70px;
	margin-top: 37px;
	margin-left: 480px;
	background-color: #f80;
	line-height: 35px;
	text-align: center;
	outline: none;
	border: none;
}
.all .result{
	height: 30px;
	width: 1200px;
	margin: 0 auto;
}
.all .result span{
	color: #bbb;
	line-height: 30px;
	
}
.all .display {
	width: 1200px;
	height: 400px;
	margin: 0 auto;
}
.goods-content{
	height: 220px;
	width: 227px;
	float: left;
	overflow: hidden;
	margin-right:13px;
	border:1px solid #eee;
	margin-bottom: 10px;
}
.all .display .goods-content:hover{
	border:1px solid #00d0d4;
}
.all .display .goods-content div{
	margin:10px 10px 0 10px;
}
.all .display .goods-content .goods-name{
	display:inline-block;
	font-weight: bold;
    font-size: 20px;
    font-family: arial;
    float: left;
    
}
.all .display .goods-content .goods-price{
	display:inline-block;
	color:#f60;
	font-weight: bold;
    font-size: 20px;
    font-family: arial;
    float: right;
}
.all .display .goods-content .goods-intro{
	display:inline-block;
	margin-top:10px;
	padding:0 10px;
	color: #333;
	font-size: 14px;
	font-weight: 600;
}
</style>
</head>

<body>
	<div class="all">
		<!-- 搜索部分 -->
		<div class="search">
			<div class="search-inner">
				<div class="pull-left">
					<img alt="I驴网" src="images/logo.png" width="170px">
				</div>
				<div class="pull-left"></div>
				<!-- 搜素框 -->
				<form action="SearchServlet" method="post">
					<div class="input-group ">

						<input type="text" class="form-control searchBox"
							placeholder="搜索你想要的内容" name="search" id="search">
						<input type="submit" class="searchBtn" value="搜索"></input>
				</div>
				</form>
			</div>

		</div>
		
		<c:forEach items="${requestScope.goods}" var="good">
			<div class="result">
				<span>共搜索到${fn:length(requestScope.goods)}条结果</span>
			</div>
			<div class="display">
				<table width="1200" height="100" cellpadding="0" cellspacing="0"
					border="0">
					<tr>
						<td>
							<div class="goods-content">
								<dl>
									<dt>
										<a href="order-info.jsp?id=${good.goods_id}"> <img
											src="images/${good.goods_img}" width="227px"
											height="160px">
										</a>
									</dt>
	
									<div>
										<dd class="goods-name">
											${good.goods_name}
										</dd>
	
										<dd class="goods-price">
											${good.goods_price}
										</dd>
									</div>
								</dl>
							</div> 
	
						</td>
					</tr>
	
				</table>
			<div class="display">
		</c:forEach>
	</div>
</body>
</html>
