<%@page import="buildPc.inf.GraphicsInf"%>
<%@page import="buildPc.inf.CpuInf"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page import="buildPc.inf.MainboardInf"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
					GraphicsInf graphicsInf = GraphicsInf.getInf(Integer.parseInt(cnt));
				
				%>
				<form action="../MdfgraphicsServlet" method="post" enctype="multipart/form-data">
		            	<input type="hidden" name="id" id="id" value="<%=graphicsInf.getId()%>">
		            <div class="formgroup">
		                <label for="gName">显卡名:</label>
		                <input type="text" name="gName" id="gName" value="<%=graphicsInf.getgName()%>" required>
		            </div>
		            <div class="formgroup">
		                <label for="brand">品牌:</label>
		                <input type="text" name="brand" id="brand" value="<%=graphicsInf.getBrand()%>" required>
		            </div> 
		             <div class="formgroup">
		                <label for="directX">directX支持版本:</label>
		                <input type="text" name="directX" id="directX" value="<%=graphicsInf.getDirectX()%>" required>
		            </div> 
		            <div class="formgroup">
		                <label for="OpenGL">OpenGL支持版本:</label>
		                <input type="text" name="OpenGL" id="OpenGL" value="<%=graphicsInf.getOpenGL()%>" required>
		            </div> 
		             <div class="formgroup">
		                <label for="Interface">接口:</label>
		            </div>
		            <div class="formgroup">
		                <select id="Interface" name="Interface">
							<option value="PCI Express 3.0 16X">PCI Express 3.0 16X</option>
							<option value="DP">DP</option>
							<option value="DVI">DVI</option>
						</select>
		            </div>
		           	<div class="formgroup">
		                <label for="maxResolution">最高分辨率:</label>
		                <input type="text" name="maxResolution" id="maxResolution" value="<%=graphicsInf.getMaxResolution()%>" required>
		            </div> 
		            <div class="formgroup">
		                <label for="price">价格:</label>
		                <input type="number" name="price" id="price" value="<%=graphicsInf.getPrice()%>" required>
		            </div>
		            <div class="formgroup">
		                <label for="stock">库存:</label>
		                <input type="number" name="stock" id="stock" value="<%=graphicsInf.getStock()%>" required>
		            </div>
		            <div class="formgroup">                                                                                                                          
		                <label for="img">图片:</label>
		                <input type="file" name="img" id="img" required>
		            </div>
		            <div class="formgroup">
		                <input type="submit" value=" 提交">
		            </div>
		        </form>
				
				<%} %>
		   	</div>
	    </div>
	    <%@include file="side.jsp" %>	
        <%@include file="footer.jsp" %>
	</div>
</body>
</html>