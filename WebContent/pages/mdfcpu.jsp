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
					CpuInf cpuInf = CpuInf.getInf(Integer.parseInt(cnt));
				%>
				<form action="../MdfcpuServlet" method="post" enctype="multipart/form-data">
		           	<input type="hidden" name="id" id="id" value="<%=cpuInf.getId()%>">
		            <div class="formgroup">
		                <label for="cpuName">CPU名:</label>
		                <input type="text" name="cpuName" id="cpuName" value="<%=cpuInf.getCpuName() %>" required>
		            </div>
		            <div class="formgroup">
		                <label for="cpuSlot">CPU接口:</label>
		            </div> 
		             <div class="formgroup">
		                <select id="cpuSlot" name="cpuSlot">
							<option value="LGA">LGA</option>
							<option value="Socket AM4">Socket AM4</option>
						</select>
		            </div>
		             <div class="formgroup">
		                <label for="core_number">核数:</label>
		                <input type="number" name="core_number" id="core_number" value="<%=cpuInf.getCore_number() %>" required>
		            </div> 
		            <div class="formgroup">
		                <label for="cpu_frequency">主频:</label>
		                <input type="text" name="cpu_frequency" id="cpu_frequency" value="<%=cpuInf.getCpu_frequency() %>" required>
		            </div>
		            
		            <div class="formgroup">
		                <label for="bits64">64位支持:</label>
		                <%if(cpuInf.isBits64()){ %>
		                <input type="number" name="bits64" id="bits64" value="1" required>
		                <%}else{ %>
		                <input type="number" name="bits64" id="bits64" value="0" required>
		                <%} %>
		            </div>
		            <div class="formgroup">
		                <label for="price">价格:</label>
		                <input type="number" name="price" id="price" value="<%=cpuInf.getPrice() %>" required>
		            </div>
		            <div class="formgroup">
		                <label for="stock">库存:</label>
		                <input type="number" name="stock" id="stock" value="<%=cpuInf.getStock() %>" required>
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