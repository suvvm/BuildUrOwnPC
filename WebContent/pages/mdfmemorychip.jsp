<%@page import="buildPc.inf.MemoryChipInf"%>
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
					MemoryChipInf memoryChipInf = MemoryChipInf.getInf(Integer.parseInt(cnt));
					
				%>
				<form action="../MdfmemorychipServlet" method="post" enctype="multipart/form-data">
		            <input type="hidden" name="id" id="id" value="<%=memoryChipInf.getId()%>">
		            <div class="formgroup">
		                <label for="mName">内存名:</label>
		                <input type="text" name="mName" id="mName" value="<%=memoryChipInf.getmName()%>" required>
		            </div>
		            <div class="formgroup">
		                <label for="brand">品牌:</label>
		                <input type="text" name="brand" id="brand" value="<%=memoryChipInf.getBrand()%>" required>
		            </div> 
		             <div class="formgroup">
		                <label for="capacity">容量(GB):</label>
		                <input type="number" name="capacity" id="capacity" value="<%=memoryChipInf.getCapacity()%>" required>
		            </div> 
		            <div class="formgroup">
		                <label for="bf">插槽:</label>
		            </div>
		            <div class="formgroup">
		                <select id="bf" name="bf">
							<option value="DDR3">DDR3</option>
							<option value="DDR4">DDR4</option>
						</select>
		            </div>
		            <div class="formgroup">
		                <label for="price">价格:</label>
		                <input type="number" name="price" id="price" value="<%=memoryChipInf.getPrice()%>" required>
		            </div>
		            <div class="formgroup">
		                <label for="stock">库存:</label>
		                <input type="number" name="stock" id="stock" value="<%=memoryChipInf.getStock()%>" required>
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