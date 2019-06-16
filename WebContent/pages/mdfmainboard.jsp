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
					MainboardInf mainboardInf = MainboardInf.getInf(Integer.parseInt(cnt));
				%>
				<form action="../MdfmainboardServlet" method="post" enctype="multipart/form-data">
		             <input type="hidden" name="id" id="id" value="<%=mainboardInf.getId()%>">
		            <div class="formgroup">
		            	
		                <label for="mName">主板名:</label>
		                <input type="text" name="mName" id="mName" value="<%= mainboardInf.getmName() %>" required>
		            </div>
		            <div class="formgroup">
		                <label for="brand">品牌:</label>
		                <input type="text" name="brand" id="brand" value="<%= mainboardInf.getBrand() %>" required>
		            </div> 
		             <div class="formgroup">
		                <label for="platform">平台:</label>
		                <input type="text" name="platform" id="platform" value="<%=mainboardInf.getPlatform() %>" required>
		            </div> 
		            <div class="formgroup">
		                <label for="chipset">芯片组:</label>
		                <input type="text" name="chipset" id="chipset" value="<%=mainboardInf.getChipset() %>" required>
		            </div>
		            <div class="formgroup">
		                <label for="integratedGraphics">板载显卡:</label>
		                <%if(mainboardInf.isIntegratedGraphics()){ %>
		                <input type="number" name="integratedGraphics" id="integratedGraphics" value="1" required>
		                <%}else{ %>
		                <input type="number" name="integratedGraphics" id="integratedGraphics" value="0" required>
		                <%} %>
		            </div>
		            <div class="formgroup">
		                <label for="mDotTowNum">M.2数量:</label>
		                <input type="number" name="mDotTowNum" id="mDotTowNum" value="<%=mainboardInf.getmDotTwoNum() %>" required>
		            </div>
		            <div class="formgroup">
		                <label for="sataNum">SATA数量:</label>
		                <input type="number" name="sataNum" id="sataNum" value="<%=mainboardInf.getSataNum() %>" required>
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
		                <label for="ramSlot">内存接口:</label>
		            </div>
		            <div class="formgroup">
		                <select id="ramSlot" name="ramSlot">
							<option value="DDR3">DDR3</option>
							<option value="DDR4">DDR4</option>
						</select>
		            </div>
		            <div class="formgroup">
		                <label for="ramSlotNum">内存插槽数量:</label>
		                <input type="number" name="ramSlotNum" id="ramSlotNum" value="<%=mainboardInf.getRamSlotNum() %>" required>
		            </div>
		            <div class="formgroup">
		                <label for="hdmi">HDMI数量:</label>
		                <input type="number" name="hdmi" id="hdmi" value="<%=mainboardInf.getHdmi() %>"required>
		            </div>
		            <div class="formgroup">
		                <label for="dvi">DVI数量:</label>
		                <input type="number" name="dvi" id="dvi" value="<%=mainboardInf.getDvi() %>" required>
		            </div>
		            <div class="formgroup">
		                <label for="vga">VGA数量:</label>
		                <input type="number" name="vga" id="vga" value="<%=mainboardInf.getVga() %>" required>
		            </div>
		            <div class="formgroup">
		                <label for="pic">PIC数量:</label>
		                <input type="number" name="pic" id="pic" value="<%=mainboardInf.getPic() %>" required>
		            </div>
		            <div class="formgroup">
		                <label for="dp">DP数量:</label>
		                <input type="number" name="dp" id="dp" value="<%=mainboardInf.getDp() %>" required>
		            </div>
		            <div class="formgroup">
		                <label for="usb2">USB2.0数量:</label>
		                <input type="number" name="usb2" id="usb2" value="<%=mainboardInf.getUsb2() %>" required>
		            </div>
		            <div class="formgroup">
		                <label for="usb3">USB3.0数量:</label>
		                <input type="number" name="usb3" id="usb3" value="<%=mainboardInf.getUsb3() %>" required>
		            </div>
		            <div class="formgroup">
		                <label for="networkcard">板载网卡:</label>
		                <input type="text" name="networkcard" id="networkcard" value="<%=mainboardInf.getNetworkcard() %>" required>
		            </div>
		            <div class="formgroup">
		                <label for="networkInterface">网络接口:</label>
		                <input type="text" name="networkInterface" id="networkInterface" value="<%=mainboardInf.getNetworkInterface() %>" required>
		            </div>
		            <div class="formgroup">
		                <label for="price">价格:</label>
		                <input type="number" name="price" id="price" value="<%=mainboardInf.getPrice() %>" required>
		            </div>
		            <div class="formgroup">
		                <label for="stock">库存:</label>
		                <input type="number" name="stock" id="stock" value="<%=mainboardInf.getStock() %>" required>
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