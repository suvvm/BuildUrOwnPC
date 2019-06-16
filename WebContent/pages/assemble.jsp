<%@page import="javax.persistence.Index"%>
<%@page import="java.util.List"%>
<%@page import="buildPc.inf.RadiatorInf"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/webStyle.css" type="text/css" />
<title>组装</title>
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
				<%}%>
			</div>
		
		</div>
		<%@include file="side.jsp" %>
		<%@include file="footer.jsp" %>
	</div>
</body>
</html>
<%@include file="webpets.jsp" %>