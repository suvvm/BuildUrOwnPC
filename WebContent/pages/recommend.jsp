<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/webStyle.css" rel="stylesheet" type="text/css"/>
<title>Insert title here</title>
</head>
<body>
<div class="home">
       		<%@include file="header.jsp" %>
       		<div class="content">
       			<div class="forFlow">
	       			<hr>
					<div class='productItem'>
	
				            <form action="../RecommendServlet" method="post">
				            	<div class="formgroup">
							        <select id="recommendway" name="recommendway">
										<option value="0">性能优先</option>
										<option value="1">我要最便宜的</option>
										<option value="2">给我随便来一个</option>
										<option value="3">我有钱要最贵的</option>
									</select>
							    </div>
							    <div class="formgroup">
							        <input type="submit" value=" 提交">
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