<%@page import="buildPc.inf.UserInf"%>
<%@page import="buildPc.util.DB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.sun.xml.wss.impl.callback.UsernameCallback"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注销</title>
<link rel="stylesheet" href="../css/webStyle.css" type="text/css" />
</head>
<body>
	<div class="home">
		<%@include file="header.jsp" %>
		<div class="content">
			<%
				Cookie cookie[] = request.getCookies();
				int userInf = 0;
				UserInf user = new UserInf();
				for(Cookie i : cookie){
					if(i.getName().equals("userInf")){
						userInf = Integer.parseInt(i.getValue());
						ResultSet rSet = DB.executeQuery("SELECT * FROM user_inf WHERE uid = "+userInf+"");
						if(rSet.next()){
							user.setuId(rSet.getInt("uid"));
							user.setrName(rSet.getString("uName"));
							user.setEmail(rSet.getString("uEmail"));
							user.setUsername(rSet.getString("uUserName"));
							user.setpNum(rSet.getString("uPNum"));
							user.setAdmin(rSet.getBoolean("isAdministrator"));
  						}
						break;
					}
				}
			%>
			<div class="formgroup">
				<label>userid</label>
				<label><%out.print(user.getuId()); %></label>
			</div>
			<div class="formgroup">
				<label>rName</label>
				<label><%out.print(user.getrName()); %></label>
			</div>
			<div class="formgroup">
				<label>userName</label>
				<label><%out.print(user.getUsername()); %></label>
			</div>
			<div class="formgroup">
				<label>pNum</label>
				<label><%out.print(user.getpNum()); %></label>
			</div>
			<div class="formgroup">
				<label>email</label>
				<label><%out.print(user.getEmail()); %></label>
			</div>
			<form action="../LogoutServlet" method="post">
			    <div class="formgroup">
			        <input type="submit" id="logoutinp" value=" 登 出">
			    </div>
			</form>
		</div>
		<%@include file="side.jsp" %>	
		<%@include file="footer.jsp" %>
	</div>	
</body> 
</html>
<%@include file="webpets.jsp" %>