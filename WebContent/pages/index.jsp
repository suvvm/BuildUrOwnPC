<%@page import="buildPc.util.DB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="buildPc.inf.UserInf"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>江泽民长寿</title>
		<link href="../css/webStyle.css" rel="stylesheet" type="text/css"/>
	</head>
	<body>
       <div class="home">
       		<%@include file="header.jsp" %>
       		<div class="content">
       			<div class="forFlow">
	            <%
					Cookie cookie[] = request.getCookies();
					int userInf = 0;
					boolean flag = false;
					for(Cookie i : cookie){
						if(i.getName().equals("userInf")){
							userInf = Integer.parseInt(i.getValue());
							ResultSet rSet = DB.executeQuery("SELECT * FROM user_inf WHERE uid = "+userInf+"");
							if(rSet.next()){						
								out.print("<script>document.title='欢迎"+rSet.getString("uName")+"同志';</script>");
	  							flag = true;
							}
							break;
						}
					}
					if(!flag){
						out.print("<script>document.title='你还没有登录';</script>");
					}
				%>
	            <div class='productItem' onclick="window.open('recommend.jsp')">
	            	<hr>
		            <div class='pImg'>
			        	<img src="../images/shock/9.jpg">
			        </div>
		            <div class='shockInf'>
		            	<h4>震惊！青岛一网友组装电脑为省钱竟干出这种操作。</h4>
		            	<p>近日，网上一网友分享了他的电脑配置及他的花销。网友纷纷表示如此低的价钱却买了如此高的配置，这是不可能的。我们通过ID找到了这位网友，得知我们的来意，他给我们分享了他的省钱妙招。</p>
		            </div>
	            </div>
	            <div class='productItem' onclick="window.open('partIntroduction.jsp')">
	            	<hr>
	            	<div class='pImg'>
			        	<img src="../images/shock/2.jpg">
			        </div>
		            <div class='shockInf'>
		            	<h4>原来电脑配件市场竟有如此暗语，网友直呼学到了！</h4>
		            	<p>很多网友说买电脑配件的时候总是被坑，有十年经营配件经历的老手告诉我们，市场竟有很多暗语，最后还分享给我们一个百试不厌的方法。</p>
		            </div>
	            </div>
	            <div class='productItem'  onclick="window.open('assemble.jsp?content=graphics.jsp')">
	            	<hr>
	            	<div class='pImg'>
			        	<img src="../images/shock/8.jpg">
			        </div>
		            <div class='shockInf'>
		            	<h4>买显卡的时候这样买，至少省500块！</h4>
		            	<p>很多人买显卡的时候，总是被内行人坑钱，今天我们推荐给您一个省钱的妙招，这样买显卡，物美价廉，至少省500块！</p>
		            </div>
	            </div>
	            <div class='productItem' onclick="window.open('recommend.jsp')">
	            	<hr>
	            	<div class='pImg'>
			        	<img src="../images/shock/7.jpg">
			        </div>
		            <div class='shockInf'>
		            	<h4>青岛网友花低价组装出顶级电脑，原因竟是因为...</h4>
		            	<p>一博主晒出自己的爱机配置，有细心的网友发现：明明各自的配置差不多，为什么价钱却天差地别。随后博主分享了他的购机心得，竟是因为...</p>
		            </div>
	            </div>
	            <div class='productItem' onclick="window.open('assemble.jsp?content=cpu.jsp')">
	            	<hr>
	            	<div class='pImg'>
			        	<img src="../images/shock/6.jpg">
			        </div>
		            <div class='shockInf'>
		            	<h4>买CPU这样问老板，网友：太聪明了！</h4>
		            	<p>买CPU时害怕被坑？害怕花了大价钱，买了假货？内行人教你这样做，网友直呼：太聪明了！</p>
		            </div>
	            </div>
	            <div class='productItem' onclick="window.open('recommend.jsp')">
	            	<hr>
	            	<div class='pImg'>
			        	<img src="../images/shock/4.jpg">
			        </div>
		            <div class='shockInf'>
		            	<h4>又一老板爆出电脑配件市场内幕！网友直呼不敢相信！</h4>
		            	<p>近日，又一退出电脑配件市场的商家爆出内幕，买电脑配件的时候竟有如此挑选技巧，网友都说不敢相信!</p>
		            </div>
	            </div>
	            <div class='productItem'  onclick="window.open('assemble.jsp?content=ssd.jsp')">
	            	<hr>
	            	<div class='pImg'>
			        	<img src="../images/shock/3.jpg">
			        </div>
		            <div class='shockInf'>
		            	<h4>老板含泪说出不卖机械硬盘原因，让人心疼！</h4>
		            	<p>究竟是什么原因，引得老板猛男落泪？机械硬盘的市场究竟有什么玄机？老板含泪说出原因，引得网友直呼心疼！</p>
		            </div>
	            </div>
	             <div class='productItem' onclick="window.open('assemble.jsp?content=graphics.jsp')">
	            	<hr>
	            	<div class='pImg'>
			        	<img src="../images/shock/11.jpg">
			        </div>
		            <div class='shockInf'>
		            	<h4>新款显卡问世：此物只应天上有！</h4>
		            	<p>英伟达爆出新款显卡，性能和价格让人动心，网友直呼：出了必买系列。更有业界人士称，该款显卡为近几年性能最优款。</p>
		            </div>
	            </div>  
	            </div>
            </div>
            <%@include file="side.jsp" %>	
            <%@include file="footer.jsp" %>
        </div>  
	</body>
</html>
<%@include file="webpets.jsp" %>