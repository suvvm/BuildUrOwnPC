<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加</title>
<link rel="stylesheet" href="../css/webStyle.css" type="text/css" />
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
				<div class="productItem">
					<div class='pInf'>
					<a href='add.jsp?content=addmainboard.jsp'>添加主板</a>
					</div>
	            	<div class='pInf'>
	            	<a href='add.jsp?content=addcpu.jsp'>添加cpu</a>
	            	</div>
	            	<div class='pInf'>
	            	<a href='add.jsp?content=addmemory.jsp'>添加内存</a>
	            	</div>
	            	<div class='pInf'>
	            	<a href='add.jsp?content=addssd.jsp'>添加SSD</a>
	            	</div>
	            	<div class='pInf'>
	            	<a href='add.jsp?content=addgraphics.jsp'>添加显卡</a>
	            	</div>
	            	<div class='pInf'>
	            	<a href='add.jsp?content=addmechanics.jsp'>添加机械</a>
	            	</div>
	            	<div class='pInf'>
	            	<a href='add.jsp?content=addradiator.jsp'>添加散热器</a>
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