<%@page import="buildPc.inf.MechanicsInf"%>
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
					MechanicsInf mechanicsInf = MechanicsInf.getInf(Integer.parseInt(cnt));
				%>
				<form action="../MdfmechanicsServlet" method="post" enctype="multipart/form-data">
		            <input type="hidden" name="id" id="id" value="<%=mechanicsInf.getId()%>">
		            <div class="formgroup">
		                <label for="mecName">机械硬盘名:</label>
		                <input type="text" name="mecName" id="mecName" value="<%=mechanicsInf.getMecName()%>" required>
		            </div>
		             <div class="formgroup">
		                <label for="brand">品牌:</label>
		                <input type="text" name="brand" id="brand" value="<%=mechanicsInf.getBrand()%>" required>
		            </div> 
		            <div class="formgroup">
		                <label for="Interface">接口:</label>
		            </div> 
		             <div class="formgroup">
		                <select id="Interface" name="Interface">
							<option value="SATA">SATA</option>
						</select>
		            </div>
		             <div class="formgroup">
		                <label for="speed">转速:</label>
		                <input type="number" name="speed" id="speed" value="<%=mechanicsInf.getSpeed()%>" required>
		            </div> 
		            <div class="formgroup">
		                <label for="capacity">容量(GB):</label>
		                <input type="number" name="capacity" id="capacity" value="<%=mechanicsInf.getCapacity()%>" required>
		            </div>
		            
		            <div class="formgroup">
		                <label for="cache">缓冲区:</label>
		                <input type="number" name="cache" id="cache" value="<%=mechanicsInf.getCache()%>" required>
		            </div>
		            <div class="formgroup">
		                <label for="price">价格:</label>
		                <input type="number" name="price" id="price" value="<%=mechanicsInf.getPrice()%>" required>
		            </div>
		            <div class="formgroup">
		                <label for="stock">库存:</label>
		                <input type="number" name="stock" id="stock" value="<%=mechanicsInf.getStock()%>" required>
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