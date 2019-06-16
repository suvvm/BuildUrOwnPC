<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>组件介绍</title>
<link href="../css/webStyle.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<div class="home">
		<%@include file="header.jsp" %>
		<div class="content">
       		<div class="forFlow">
       		<%
				if(null != request.getParameter("content")){
					String cnt = request.getParameter("content");
			%>
			<jsp:include page="<%=cnt %>"></jsp:include>  
			<%}else{%>
			<div class='productItem'>
	            	<hr>
		            <div class='partInf'>
		            	<h4 onclick="window.open('partIntroduction.jsp?content=mainBoardIcd.jsp')">主板</h4>
		            </div>
	            </div>
	            <div class='productItem' >
	            	<hr>
		            <div class='partInf'>
		            	<h4 onclick="window.open('partIntroduction.jsp?content=cpuIcd.jsp')">cpu</h4>
		            </div>
	            </div>
	            <div class='productItem'>
	            	<hr>
		            <div class='partInf'>
		            	<h4 onclick="window.open('partIntroduction.jsp?content=graphicsIcd.jsp')">显卡</h4>
		            </div>
	            </div>
	            <div class='productItem'>
	            	<hr>
		            <div class='partInf'>
		            	<h4 onclick="window.open('partIntroduction.jsp?content=memorychipIcd.jsp')">内存</h4>
		            </div>
	            </div>
	            <div class='productItem'>
	            	<hr>
		            <div class='partInf'>
		            	<h4 onclick="window.open('partIntroduction.jsp?content=radiatorIcd.jsp')">散热器</h4>
		            </div>
	            </div>
	            <div class='productItem'>
	            	<hr>
		            <div class='partInf'>
		            	<h4 onclick="window.open('partIntroduction.jsp?content=mechanicsIcd.jsp')">机械硬盘</h4>
		            </div>
	            </div>
	            <div class='productItem'>
	            	<hr>
		            <div class='partInf'>
		            	<h4 onclick="window.open('partIntroduction.jsp?content=ssdIcd.jsp')">固态硬盘</h4>
		            </div>
	            </div>
			<%} %>
       		</div>
       	</div>
       	<%@include file="side.jsp" %>	
        <%@include file="footer.jsp" %>
	</div>
</body>
</html>
<%@include file="webpets.jsp" %>