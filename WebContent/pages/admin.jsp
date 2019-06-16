<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理</title>
<link href="../css/webStyle.css" rel="stylesheet" type="text/css"/>
</head>
<body>
 <div class="home">
        <%@include file="header.jsp"%>
        <div class = "content">
        <div class="forFlow">
        	<% 
				if(null != request.getParameter("content")){
					String cnt = request.getParameter("content");
				%> 
				<jsp:include page="<%=cnt %>"></jsp:include> 
				<%}else{ %>
				<div class='productItem'>
	            	<a href='add.jsp'>添加组件</a>
	            	<a href='dlt.jsp'>删除组件</a>
	            	<a href='examine.jsp'>审核评论</a>
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