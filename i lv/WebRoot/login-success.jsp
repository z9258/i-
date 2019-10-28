<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="dao.GoodsDao" %>
<%@ page import="com.db.GoodsBean" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	String username = request.getSession().getAttribute("username").toString();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login-success.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="css/index.css">
	<script type="text/javascript" src="http://libs.baidu.com/jquery/1.10.2/jquery.min.js"></script>
	<link rel="stylesheet" href="css/bootstrap/3.3.6/bootstrap.min.css">
	<script type="text/javascript" src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
  </head>
  
  <body>
    <div class="all">
    	<!-- 头部 -->
    		<div class="t-wrap">
    			<div class="index-header">
    				<span class="pull-left">欢迎来到  I 驴网</span>
    				<div class="pull-right">
    					<span>
    						<a href="#">
    							欢迎您:
    							<%= username%>
    						</a>
    					</span>
    					
    					<span>
    						<a href="user.jsp">个人中心</a>
    					</span>
    					<span>
    						<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=954487831&site=qq&menu=yes" style="color:#337ab7;">
    							客服中心
    						</a>
    					</span>
    					<span>
    						<a href="exit.jsp">退出</a>
    					</span>
    				</div>
    			</div>
    		</div>
    		<div class="search">
    			<div class="search-inner">
    				<div class="pull-left">
    					<img alt="I驴网" src="images/logo.png" width="170px">
    				</div>
    				<div class="pull-left">
    					<div class="location">
    						<button type="button" class="btn btn-default" >
    							福州
    							<span class="caret"></span>
    						</button>
    					</div>
    				</div>
    				<!-- 搜素框 -->
    				<div class="input-group ">
    					<input type="text" class="form-control searchBox" placeholder="搜索你想要的内容">
    					<button type="button" class="searchBtn">搜索</button>
    				</div>
    			</div>
    		</div>
    		
    		<!-- 导航栏 -->
    		<div class="guide-inner">
    			<div class="guide-con">
    				<ul class="nav nav-pills">
						  <li role="presentation"><a href="index.jsp">首页</a></li>
						  <li role="presentation"><a href="#">文化古迹</a></li>
						  <li role="presentation"><a href="#">自然风光</a></li>
						  <li role="presentation"><a href="#">公园游乐场</a></li>
						  <li role="presentation"><a href="#">动植物园</a></li>
						  <li role="presentation"><a href="#">休闲娱乐</a></li>
						  <li role="presentation"><a href="#">成人票</a></li>
						  <li role="presentation"><a href="#">学生票</a></li>
						  <li role="presentation"><a href="#">儿童票</a></li>
						 
					</ul>
    			</div>
    		</div>
    		
    		<!-- 页面主体内容 -->
    		<div class="index-main">
    			<div class="index-main-c">
    				<div class="pull-left sort">
    					<div class="list-group ">
    						<span class="list-group-item" style="text-align: center;color:#2dbb55;font-size:15px;font-weight: bold;">热度排行榜</span>
    						<a href="#" class="list-group-item">
    							<span>1</span>
    							三坊七巷
    						</a>
    						<a href="#" class="list-group-item">
	    						<span>2</span>
	    						贵安水世界
    						</a>
    						<a href="#" class="list-group-item">
    							<span>3</span>
    							花海公园
    						</a>
    						<a href="#" class="list-group-item">
    							福道
    						</a>
    						<a href="#" class="list-group-item">
    							三坊七巷
    						</a>
    						<a href="#" class="list-group-item">
	    						贵安水世界
    						</a>
    						<a href="#" class="list-group-item">
    							花海公园
    						</a>
    						<a href="#" class="list-group-item">
    							福道
    						</a>
    						<a href="#" class="list-group-item">
    							三坊七巷
    						</a>
    						<a href="#" class="list-group-item">

	    						贵安水世界
    						</a>
    					</div>
    				</div>
    				<div class="pull-right index-swiper">
    					<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
							  <!-- Indicators -->
							  <ol class="carousel-indicators">
							    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
							    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
							    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
							    <li data-target="#carousel-example-generic" data-slide-to="3"></li>
							  </ol>
							 
							  <!-- Wrapper for slides -->
							  <div class="carousel-inner" role="listbox">
							    	<div class="item active">
							     		 <img src="images/swiper1.png" >
							    	</div>
							    <div class="item">
							            <img src="images/swiper2.png" >
							    </div>
							    <div class="item">
							            <img src="http://how2j.cn/img/site/step/3493.png" >
							    </div>
							 
							    <div class="item">
							            <img src="http://how2j.cn/img/site/step/3494.png" >
							    </div>
							 
							  </div>
							 
							  <!-- Controls -->
							  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
							    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
							 
							  </a>
							  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
							    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
							  </a> 
							</div>
    				</div>
    			</div>
    		</div>
    		
    		<!--  详情信息-->
    		<div class="index-info">
    			<div class="index-info-top">
    				<h3>当季热门景点</h3>
    			</div>
    			
    			
    			<div class="index-info-main">
	    			<table width="1200" height="100" cellpadding="0" cellspacing="0" border="0">
	    				<tr>
	    					<td>
	    						<%
						 			GoodsDao goodsdao = new GoodsDao();
						 			ArrayList<GoodsBean> list = goodsdao.getAllGoods();
						 			if(list != null && list.size()>0){
						      			for(int i=0;i<list.size();i++){
						              		 GoodsBean goods = list.get(i);
	   							 %>
	    						<div class="goods-content">
	    							<dl>
	    								<dt>
	    									<a href="order-info.jsp?id=<%=goods.getGoods_id() %>">
	    										<img src="images/<%=goods.getGoods_img() %>" width="227px" height="160px">
	    									</a>
	    								</dt>
	    								
	    								<div>
		    								<dd class="goods-name">
		    									<%= goods.getGoods_name() %>
		    								</dd>
		    								
		    								<dd class="goods-price">
		    									￥<%= goods.getGoods_price() %>
		    								</dd>
		    							</div>
	    							</dl>
	    						</div>
	    						
	    						<%
	    							}
	    						}
	    						 %>
	    					</td>
	    				</tr>
	    				
	    			</table>
    			</div>
   				
   				
    		</div>
    	
    		<div class="toTop">
    		
	    		<div class="cart">
		    			<a href="#">
		    				<span class="glyphicon glyphicon-shopping-cart"></span>
		    			</a>
	    		</div>
    			<div class="up">
	    			<a href="#top">
	    				<span class="glyphicon glyphicon-arrow-up"></span>
	    			</a>
    			</div>
    			
    			
    		</div>
    		
    	</div>
  </body>
</html>