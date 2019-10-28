<%@page import="java.sql.Statement"%>
<%@page import="java.sql.*"%>
<%@page import="com.db.GoodsBean"%>
<%@page import="dao.GoodsDao"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'order-info.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/order-info.css">
	<link href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
	
	<script type="text/javascript" src="http://libs.baidu.com/jquery/1.10.2/jquery.min.js"></script>
	<link rel="stylesheet" href="css/bootstrap/3.3.6/bootstrap.min.css">
	<script type="text/javascript" src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
	<script src="js/moment-with-locales.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
  </head>
  
  <body>
  
  <%
  		GoodsDao goodsdao = new GoodsDao();
  		GoodsBean goods = goodsdao.getGoodsById(Integer.valueOf(request.getParameter("id")));
  		if(goods != null){
  		
   %>
  
  
    <div class="all">
    	<!-- 头部logo -->
    	<div class="top">
    		<img alt="" src="images/logo.png" width="170px">
    	</div>
    	
    	<!-- 景区描述区 -->
    	<div class="wrap">
    		<div class="intro">
    			<div class="pull-left image">
    				<img alt="" src="images/pic1.png" id="lunbo">
    			</div>
    			
    			<!-- 轮播图的实现 -->
    			<script type="text/javascript">
    				window.onload = function(){
	    				var num = 0;
	    				var img = document.getElementById("lunbo");
	    				function swiperImg(){
	    					num ++;
	    					num = num % 3;
	    					img.src = "images/pic" + num + ".png";
	    				}
	    				var timer = setInterval(swiperImg, 3000);
    				};
    			</script>
    			
    			<div class="pull-right info">	
    				<p>
    					<%= goods.getGoods_intro() %>
    				</p>
    				<div class="info-words">
    					<span class="info-intro">
    						<span class="glyphicon glyphicon-star"></span>
    						【缤纷景点】
    						 
    					</span>
    					<span class="info-content">
    						<%= goods.getGoods_name() %>
    					</span>
    				</div>
    				
    				<div class="info-words">
    					<span class="info-intro">
    						<span class="glyphicon glyphicon-star"></span>
    						【丰富玩乐】
    					</span>
    					<span class="info-content">
    						配备无线耳麦接收器、导游全程陪同讲解
    					</span>
    				</div>
    				
    				<div class="info-words">
    					<span class="info-intro">
    						<span class="glyphicon glyphicon-star"></span>
    						【特色美食】
    						
    					</span>
    					<span class="info-content">
    						<%= goods.getGoods_food() %>
    					</span>
    				</div>
    				
    				<div class="info-words">
    					<span class="info-intro">
    						<span class="glyphicon glyphicon-star"></span>
    						【优良资质】
    					</span>
    					<span class="info-content">
    						真纯玩+享受旅游本质、无任何隐形消费
    					</span>
    				</div>
    				
   					
    				<div class="info-price">
    					<div class="info-price-top">
    						<span class="min-price">￥<%= goods.getGoods_price() %></span>
    						<span>起/人</span>
    					</div>
    					<div class="info-price-bot">
    						<span class="ticket-info">活动信息</span>
    						<a href="#">
    							<span class="ticket">券</span>
    						</a>
    					</div>
    				</div>
    				
    				<div class="history-info">
    					<span>历史成交</span>
    					&nbsp;
    					<span>47</span>
    					<a href="#">评论</a>
    				</div>
    				
    			</div>
    			
    			
    			
    		</div>
    		<form action="AddCartServlet" method="post">
	    		<div class="gobuy">
	    			<div class="row">
	    				<div class='col-sm-6'>
					        <div class="form-group pull-left">
					            <!--指定 date标记-->
					            <label>选择您的出行时间</label>
					            <div class='input-group date' id='datetimepicker'>
					            	
					                <input type='text' class="form-control" value="2019-10-15" name="datetime"/>
					                <span class="input-group-addon">
					                    <span class="glyphicon glyphicon-calendar"></span>
					                </span>
					            </div>
					        </div>
					        
					        
	   					 </div>
	
						<script type="text/javascript">
							$(function () {
							    $('#datetimepicker').datetimepicker({
							        format: 'YYYY-MM-DD',
							        locale: moment.locale('zh-cn')
							    });
							});
						</script>
	    			</div>
	    			
	    			<div class="price">
	    				<div class="adult-price" id="adult-price">
	    					<span class="type">成人票</span>
	    					<span class="max-price">
	    						<%= goods.getGoods_price() %>
							</span>
	    					
	    					<a href="#">
	    						<input type="submit" class="btn btn-info" value="购买"></input>
	    					</a>
	    				</div>
	    				<div class="student-price" id="student-price">
	    					<span class="type">学生票</span>
	    					<span class="max-price">
	    						<%= goods.getGoods_stuPrice() %>
	    					</span>
	    					
	    					<a href="#">
	    						<input type="submit" class="btn btn-info" value="购买"></input>
	    					</a>
	    				</div>
	    				<div class="children-price" id="children-price">
	    					<span class="type">儿童票</span>
	    					<span class="max-price">
	    						<%= goods.getGoods_chPrice() %>
	    					</span>
	    					
	    					<a href="#">
	    						<input type="submit" class="btn btn-info" value="购买"></input>
	    					</a>
	    				</div>
	    				<%
	    					}
	    				 %>
	    			</div>
	    			<!--
		    			<script>
		    				/* 添加成人票价 */
		    				$("#adult-price input").on('change',function(){
		    					var value = parseInt($("#adult-price input").val());
		    					var value2 = $("#adult-price .max-price").text();
		    					var result = value * value2;
		    					$("#adult-price .max-price").text(result);
		    				});
		    				/* 添加学生票价 */
		    				$("#student-price input").on('change',function(){
		    					var value = parseInt($("#student-price input").val());
		    					var value2 = $("#student-price .max-price").text();
		    					var result = value * value2;
		    					$("#student-price .max-price").text(result);
		    				});
		    				/* 添加儿童票价 */
		    				$("#children-price input").on('change',function(){
		    					var value = parseInt($("#children-price input").val());
		    					var value2 = $("#children-price .max-price").text();
		    					var result = value * value2;
		    					$("#children-price .max-price").text(result);
		    				});
		    			</script>
	    			 -->
	    		</div>
    		</form>
    		<div class="blank"></div>
    	</div>
    </div>
  </body>
</html>








