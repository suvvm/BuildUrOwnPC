<%@page import="buildPc.inf.UserAssemble"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>支付</title>
<link href="../css/webStyle.css" rel="stylesheet" type="text/css"/>
</head>
<body>

 <div class="home">
 <%@include file="header.jsp" %>
	<div class="content">
   		<div class="forFlow">
   		  <div class='productItem'>
		       	<div class='pay'>
		            	<img src="../images/pay.jpg">
		            
	          
	            <%
	            	UserAssemble userAssemble = (UserAssemble)session.getAttribute("assemble");
	            	out.print("<p>人工费500CNY</p>");
	            	out.print("<p>快递费40CNY</p>");
	            	int fp = userAssemble.getPrice()+540;
	            	out.print("<h4>共计"+fp+"CNY</h4>");
	            	
	            	out.print("<a href='score.jsp'>进行评分</a>");
	            %>
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