<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册</title>
<link rel="stylesheet" href="../css/webStyle.css">
</head>
<body>
	<div class="home">
		<%@include file="header.jsp" %>
    	<h1>用户注册</h1>
        <form action="../Register" method="post">
            <div class="formgroup">
                <label for="rName">真实姓名:</label>
                <input type="text" name="rName" id="rName" required>
            </div>
            <div class="formgroup">
                <label for="pNum">手机号码:</label>
                <input type="text" name="pNum" onblur="checkData('pNum')" id="pNum" required>
            </div> 
            <div class="formgroup">
                <label for="email">电子邮箱:</label>
                <input type="email" name="email" onblur="checkData('email')" id="email" required>
            </div>
            <div class="formgroup">
                <label for="username">用户昵称:</label>
                <input type="text" name="username" onblur="checkData('username')" id="username" required>
            </div>
            <div class="formgroup">
                <label for="password">用户密码:</label>
                <input type="password" name="password" id="password" required>
            </div>
            <div class="formgroup">
                <label for="password2">重复密码:</label>
                <input type="password" name="password2" onblur="checkpsw('password','password2')" id="password2" required>
            </div>
            <div class="formgroup">
                <input type="submit" value=" 提交">
            </div>
        </form>
        <%@include file="footer.jsp" %>
	</div>
</body>
    <script src="../js/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function checkData(id) {
            var str = $("#"+id).val();
            var checkurl = "../CheckInfServlet?data="+str;
            $.ajax({
                url: checkurl,
                type: "get",
                success: function (data){
                	 if (data=="yes") {
                         if (id=="email")
                        	$("#"+id).val(""),
                        	showMessage('这个邮箱已经注册过啦~', 5000, true);
                         else if(id=="pNum")
                            $("#"+id).val(""),
                            showMessage('这个号码已经被使用了哟~', 5000, true);
                         else 
     						$("#"+id).val(""),
     						showMessage('这个用户名已经存在啦~', 5000, true);
                         $("#"+id).focus();
                     }
                }
            });
        }
        function checkpsw(id1,id2) {
        	var psw1 = document.getElementById("password").value;
        	var psw2 = document.getElementById("password2").value;
        	if (psw1 != psw2) {
        		showMessage('两次的密码不一致哟~', 5000, true);
        		$("#"+id1).val("");
        		$("#"+id2).val("");
        		$("#"+id1).focus();
			}
        }
        
    </script>
</html>
<%@include file="webpets.jsp" %>