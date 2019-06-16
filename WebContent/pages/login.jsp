<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
    <head>
    	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>登录</title>	
        <link href="../css/webStyle.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="home">
	        <%@include file="header.jsp"%>
	        <div calss = "content">
	        
			<form action="../Login" method="post">
			    <div class="formgroup">
			        <label for="username">用户名：</label><input type="text" name="username" id="username" value="${cookie.remuserName.value}">
			    </div>
			    <div class="formgroup">
			        <label for="password">密码：</label><input type="password" name="password" id="password" value="${cookie.remPassword.value}">
			    </div>
			        <div class="formgroup">
			        <label for="rememberme">记住我的登录信息</label><input type="checkbox" name="rememberme" id="rememberme" value="Yes">
			    </div>
			    <div class="formgroup">
			        <input id="loginSub" type="submit" value=" 提交">
			    </div>
			    <div class="formgroup">
			        <a id="toRegister" href="register.jsp">还没有用户名？点击这里马上注册</a>
			    </div>
			</form>
			</div>
			<%@include file="footer.jsp"%>  
		</div>
    </body>
</html>
<%@include file="webpets.jsp" %>
