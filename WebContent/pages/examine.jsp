<%@page import="buildPc.util.DB"%>
<%@page import="java.sql.ResultSet"%>
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
					ResultSet rSet = DB.executeQuery("SELECT * FROM usercomment WHERE isshow=0");
					while(rSet.next()){
						out.print("<div class='productItem'>");
				 		out.print("<hr>");
				 		out.print("<div class='pOut'>");
				 		out.print("<div class='pInf'>");
				 		out.print("<br>uid：" + rSet.getInt("uid"));
				 		out.print("<br>pid：" + rSet.getInt("pid"));
				 		out.print("<br>内容：" + rSet.getString("content"));
				 		out.print("</div>");
				 		
				 		out.print("<div class='pform'>");
					    out.print("<form action='../ExamineServlet' method='post'>");
				        out.print("<input type='hidden' name='uid' value='"+rSet.getInt("uid")+"'>");
				        out.print("<input type='hidden' name='pid' value='"+rSet.getInt("pid")+"'>");
				        out.print("<div class='formgroup'>");
				        out.print("<input type='submit' value='批准显示'> ");
				        out.print("</div>");
				        out.print("</form>");
				        out.print("</div>");
				        
				 		out.print("</div>");
				 		out.print("</div>");
					}
				%>
			</div>
		</div>
		<%@include file="side.jsp" %>
		<%@include file="footer.jsp" %>
	</div>
</body>
</html>
<%@include file="webpets.jsp" %>