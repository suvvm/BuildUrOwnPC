<%@page import="buildPc.inf.SSDInf"%>
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
					SSDInf ssdInf = SSDInf.getInf(Integer.parseInt(cnt));
				%>
				<form action="../MdfssdServlet" method="post" enctype="multipart/form-data">
		            <input type="hidden" name="id" id="id" value="<%=ssdInf.getId()%>">
		            <div class="formgroup">
		                <label for="ssdName">固态硬盘名:</label>
		                <input type="text" name="ssdName" id="ssdName" value="<%=ssdInf.getSsdName()%>" required>
		            </div>
		            <div class="formgroup">
		                <label for="brand">品牌:</label>
		                <input type="text" name="brand" id="brand" value="<%=ssdInf.getBrand()%>" required>
		            </div> 
		            <div class="formgroup">
		                <label for="Interface">插槽:</label>
		            </div>
		            <div class="formgroup">
		                <select id="Interface" name="Interface">
							<option value="PIC">PIC</option>
							<option value="SATA">SATA</option>
							<option value="M.2">M.2</option>
						</select>
		            </div>
		             <div class="formgroup">
		                <label for="capacity">容量(GB):</label>
		                <input type="number" name="capacity" id="capacity" value="<%=ssdInf.getCapacity()%>" required>
		            </div> 
		            
		            <div class="formgroup">
		                <label for="price">价格:</label>
		                <input type="number" name="price" id="price" value="<%=ssdInf.getPrice()%>" required>
		            </div>
		            <div class="formgroup">
		                <label for="stock">库存:</label>
		                <input type="number" name="stock" id="stock" value="<%=ssdInf.getStock()%>" required>
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