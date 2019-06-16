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
				<div class="productItem">
					<form action="../DltServlet" method="post">
			            <div class="formgroup">
			                <label for="id">删除商品id:</label>
			                <input type="text" name="id" id="id" required>
			            </div>
			            <div class="formgroup">
			                <input type="submit" value=" 提 交  ">
			            </div>
		       		</form>
				 </div>
			</div>
	    </div>
	    <%@include file="side.jsp" %>	
	    <%@include file="footer.jsp" %>
</div>
</body>
</html>
<%@include file="webpets.jsp" %>