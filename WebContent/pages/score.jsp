<%@page import="buildPc.util.DB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="buildPc.inf.UserAssemble"%>
<%@page import="buildPc.inf.CpuInf"%>
<%@page import="buildPc.inf.GraphicsInf"%>
<%@page import="buildPc.inf.MechanicsInf"%>
<%@page import="buildPc.inf.SSDInf"%>
<%@page import="buildPc.inf.MemoryChipInf"%>
<%@page import="java.util.List"%>
<%@page import="buildPc.inf.RadiatorInf"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/webStyle.css" type="text/css" />
<title>Insert title here</title>
</head>
<body>
<div class="home">
       		<%@include file="header.jsp" %>
       		<div class="content">
       			<div class="forFlow">
	            <%
					Cookie cookie[] = request.getCookies();
					int userInf = 0;
					boolean flag = false;
					for(Cookie i : cookie){
						if(i.getName().equals("userInf")){
							userInf = Integer.parseInt(i.getValue());
							ResultSet rSet = DB.executeQuery("SELECT * FROM user_inf WHERE uId = "+userInf+"");
							if(rSet.next()){
	  							flag = true;
							}
							break;
						}
					}
					if(!flag){
						out.print("<p>你还没有登录</p>");
						out.print("<a href='login.jsp'>立刻登录</a>");
					}else{
						if(null == session.getAttribute("assemble")){
							out.print("<p>未选择任何配件</p>");
						} else{
							
							UserAssemble userAssemble = (UserAssemble)session.getAttribute("assemble");
							//主板信息
							if(null != userAssemble.getMainboard()){
								out.print("<div class='productItem'>");
						 		out.print("<hr>");
								out.print("<div class='pImg'>");
						        out.print("<img src='"+userAssemble.getMainboard().getImgPath()+"'>");
								out.print("</div>");
						 		out.print("<div class='pInf'>");
						        out.print("<br>id：" + userAssemble.getMainboard().getId());
						        out.print("<br>产品名：" + userAssemble.getMainboard().getmName());
						        out.print("<br>品牌：" + userAssemble.getMainboard().getBrand());
						        out.print("<br>芯片组：" + userAssemble.getMainboard().getChipset());
						        if(userAssemble.getMainboard().isIntegratedGraphics()){
						        	out.print("<br>板载显卡：有");
						        }else{
						        	out.print("<br>板载显卡：无");
						        }
						        out.print("<br>cpu接口：" + userAssemble.getMainboard().getCpuSlot());
						        out.print("<br>内存插槽：" + userAssemble.getMainboard().getRamSlot() +"*" + userAssemble.getMainboard().getRamSlotNum());
						        out.print("<br>USB2.0数量：" + userAssemble.getMainboard().getUsb2() +"   USB3.0数量：" + userAssemble.getMainboard().getUsb3());
						        out.print("<br>板载网卡：" + userAssemble.getMainboard().getNetworkcard() + "   网络接口：" + userAssemble.getMainboard().getNetworkInterface());
						        out.print("<br>硬盘接口：");
						        int mnum = userAssemble.getMainboard().getmDotTwoNum();
						        if(mnum != 0){
						        	out.print("M.2 * " +  mnum + "   ");
						        }
						        out.print("SATA * " + userAssemble.getMainboard().getSataNum());
						        out.print("<br>支持接口：");
						        int hdmi = userAssemble.getMainboard().getHdmi();
						        if(hdmi != 0){
						        	out.print("   HDMI * " +  hdmi);
						        }
						        int dvi = userAssemble.getMainboard().getDvi();
						        if(dvi != 0){
						        	out.print("   DVI * " + dvi);
						        }
						        int vga = userAssemble.getMainboard().getVga();
						        if(vga != 0){
						        	out.print("   VGA * " + vga);
						        }
						        int pic = userAssemble.getMainboard().getPic();
						        if(pic != 0){
						        	out.print("   PIC * " + pic);
						        }
						        int dp = userAssemble.getMainboard().getDp();
						        if(dp != 0){
						        	out.print("   DP * " + dp);
						        }
						        out.print("<br>价格：" + userAssemble.getMainboard().getPrice());
						        out.print("<br>库存：" + userAssemble.getMainboard().getStock());
						 		out.print("</div>");
						 		
						        out.print("<div class='pform'>");
						        out.print("<form action='../ScoreServlet' method='post'>");
						        out.print("<input type='hidden' name='uid' value='"+userInf+"'>");
						        out.print("<input type='hidden' name='pid' value='"+ userAssemble.getMainboard().getId()+"'>");
						        out.print("<div class='formgroup'>");
						        out.print("<select id='score' name='score'><option value='0'>0</option><option value='1'>1</option><option value='2'>2</option><option value='3'>3</option><option value='4'>4</option><option value='5'>5</option></select> ");
						        out.print("</div>");
						        out.print("<div class='formgroup'>");
						        out.print("<input type='submit' value='评分'> ");
						       	out.print("</div>");
						        out.print("</form>");
						        out.print("</div>");
						        
								out.print("</div>");
							}else{
								out.print("<div class='productItem'>");
						 		out.print("<hr>");
						 		out.println("<h2>当前没有主板数据信息!</h2>");
						 		out.print("</div>");
							}
							
							//cpu信息
							
						 	if(null == userAssemble.getCpu()){ 
						 		out.print("<div class='productItem'>");
						 		out.print("<hr>");
						 		out.println("<h2>当前没有cpu数据信息!</h2>");
						 		out.print("</div>");
						    }else{
						    	
						    	CpuInf cpu = userAssemble.getCpu();
					    		out.print("<hr>");
								out.print("<div class='productItem'>");
						        out.print("<div class='pImg'>");
						        out.print("<img src='"+ cpu.getImgPath()+"'>");
						        out.print("</div>");
								out.print("<div class='pInf'>");		
						        out.print("<br>id：" + cpu.getId());
						        out.print("<br>产品名：" + cpu.getCpuName());
						        out.print("<br>插槽：" + cpu.getCpuSlot());
						        out.print("<br>核数：" + cpu.getCore_number());
						        out.print("<br>频率：" + cpu.getCpu_frequency() + "GHz");
						     	if(cpu.isBits64())
						     		out.print("<br>支持64位");
						     	else
						     		out.print("<br>不支持64位");
							    out.print("<br>价格：" + cpu.getPrice());
						        out.print("<br>库存：" + cpu.getStock());
						        out.print("</div>");
						        
						        out.print("<div class='pform'>");
						        out.print("<form action='../ScoreServlet' method='post'>");
						        out.print("<input type='hidden' name='uid' value='"+userInf+"'>");
						        out.print("<input type='hidden' name='pid' value='"+cpu.getId()+"'>");
						        out.print("<div class='formgroup'>");
						        out.print("<select id='score' name='score'><option value='0'>0</option><option value='1'>1</option><option value='2'>2</option><option value='3'>3</option><option value='4'>4</option><option value='5'>5</option></select> ");
						        out.print("</div>");
						        out.print("<div class='formgroup'>");
						        out.print("<input type='submit' value='评分'> ");
						       	out.print("</div>");
						        out.print("</form>");
						        out.print("</div>");
						        
							    out.print("</div>");
								
						    }
							
							//显卡
							if(null == userAssemble.getGraphics()){
								out.print("<div class='productItem'>");
						 		out.print("<hr>");
						 		out.println("<h2>当前没有显卡数据信息!</h2>");
						 		out.print("</div>");
							}else{
								
								List<GraphicsInf> graphicsList = userAssemble.getGraphics();
								for(GraphicsInf graphics : graphicsList){
									out.print("<div class='productItem'>");
							 		out.print("<hr>");
							        out.print("<div class='pImg'>");
							        out.print("<img src='"+graphics.getImgPath()+"'>");
							        out.print("</div>");
							 		out.print("<div class='pInf'>");
							        out.print("<br>id：" + graphics.getId());
							        out.print("<br>产品名：" + graphics.getgName());
							        out.print("<br>品牌：" + graphics.getBrand());
							        out.print("<br>接口：" + graphics.getInterface());
							        out.print("<br>DirectX：" + graphics.getDirectX());
							        out.print("<br>OpenGL：" + graphics.getOpenGL());
							        out.print("<br>最高分辨率：" + graphics.getMaxResolution());
							        out.print("<br>价格：" + graphics.getPrice());
							        out.print("<br>库存：" + graphics.getStock());
							 		out.print("</div>");
							 		
							        out.print("<div class='pform'>");
							        out.print("<form action='../ScoreServlet' method='post'>");
							        out.print("<input type='hidden' name='uid' value='"+userInf+"'>");
							        out.print("<input type='hidden' name='pid' value='"+graphics.getId()+"'>");
							        out.print("<div class='formgroup'>");
							        out.print("<select id='score' name='score'><option value='0'>0</option><option value='1'>1</option><option value='2'>2</option><option value='3'>3</option><option value='4'>4</option><option value='5'>5</option></select> ");
							        out.print("</div>");
							        out.print("<div class='formgroup'>");
							        out.print("<input type='submit' value='评分'> ");
							       	out.print("</div>");
							        out.print("</form>");
							        out.print("</div>");
							        
							        out.print("</div>");
								}
							}
							
							//机械硬盘
							if(null == userAssemble.getMechanics()){
								out.print("<div class='productItem'>");
						 		out.print("<hr>");
						 		out.println("<h2>当前没有机械硬盘数据信息!</h2>");
						 		out.print("</div>");	
							}else{
								
								List<MechanicsInf> mechanicsList = userAssemble.getMechanics();
								for(MechanicsInf mechanics : mechanicsList){
									out.print("<div class='productItem'>");
							 		out.print("<hr>");
							        out.print("<div class='pImg'>");
							        out.print("<img src='"+mechanics.getImgPath()+"'>");
							        out.print("</div>");
							        out.print("<div class='pInf'>");
							        out.print("<br>id：" + mechanics.getId());
							        out.print("<br>产品名：" + mechanics.getMecName());
							        out.print("<br>品牌：" + mechanics.getBrand());
							        out.print("<br>接口：" + mechanics.getInterface());
							        out.print("<br>存储容量：" + mechanics.getCapacity());
							        out.print("<br>转速：" + mechanics.getSpeed());
							        out.print("<br>缓存区：" + mechanics.getCache());
							        out.print("<br>价格：" + mechanics.getPrice());
							        out.print("<br>库存：" + mechanics.getStock());
							        out.print("</div>");
							        
							        out.print("<div class='pform'>");
							        out.print("<form action='../ScoreServlet' method='post'>");
							        out.print("<input type='hidden' name='uid' value='"+userInf+"'>");
							        out.print("<input type='hidden' name='pid' value='"+mechanics.getId()+"'>");
							        out.print("<div class='formgroup'>");
							        out.print("<select id='score' name='score'><option value='0'>0</option><option value='1'>1</option><option value='2'>2</option><option value='3'>3</option><option value='4'>4</option><option value='5'>5</option></select> ");
							        out.print("</div>");
							        out.print("<div class='formgroup'>");
							        out.print("<input type='submit' value='评分'> ");
							       	out.print("</div>");
							        out.print("</form>");
							        out.print("</div>");
							        
							        out.print("</div>");
								}
							}
							
							//固态硬盘
							if(null == userAssemble.getSsd()){
								out.print("<div class='productItem'>");
						 		out.print("<hr>");
						 		out.println("<h2>当前没有固态硬盘数据信息!</h2>");
						 		out.print("</div>");
							}else{
								
								List<SSDInf> ssdList = userAssemble.getSsd();
								for(SSDInf ssd : ssdList){
									out.print("<div class='productItem'>");
							 		out.print("<hr>");
							 		out.print("<div class='pImg'>");
							        out.print("<img src='"+ssd.getImgPath()+"'> ");
							        out.print("</div>");
							        out.print("<div class='pInf'>");
							        out.print("<br>id：" + ssd.getId());
							        out.print("<br>产品名：" + ssd.getSsdName());
							        out.print("<br>品牌：" + ssd.getBrand());
							        out.print("<br>接口：" + ssd.getInterface());
							        out.print("<br>存储容量：" + ssd.getCapacity()+"GB");
							        out.print("<br>价格：" + ssd.getPrice());
							        out.print("<br>库存：" + ssd.getStock());
							        out.print("</div>");
							        
							        out.print("<div class='pform'>");
							        out.print("<form action='../ScoreServlet' method='post'>");
							        out.print("<input type='hidden' name='uid' value='"+userInf+"'>");
							        out.print("<input type='hidden' name='pid' value='"+ssd.getId()+"'>");
							        out.print("<div class='formgroup'>");
							        out.print("<select id='score' name='score'><option value='0'>0</option><option value='1'>1</option><option value='2'>2</option><option value='3'>3</option><option value='4'>4</option><option value='5'>5</option></select> ");
							        out.print("</div>");
							        out.print("<div class='formgroup'>");
							        out.print("<input type='submit' value='评分'> ");
							       	out.print("</div>");
							        out.print("</form>");
							        out.print("</div>");
							        
							        out.print("</div>");
								}
							}
							
							//内存
							if(null == userAssemble.getMemoryChip()){
								out.print("<div class='productItem'>");
						 		out.print("<hr>");
						 		out.println("<h2>当前没有内存数据信息!</h2>");
						 		out.print("</div>");
							}else{
								
								List<MemoryChipInf> memoryList = userAssemble.getMemoryChip();
								for(MemoryChipInf memoryChip : memoryList){
									out.print("<div class='productItem'>");
							 		out.print("<hr>");
							        out.print("<div class='pImg'>");
							        out.print("<img src='"+memoryChip.getImgPath()+"'>");
							        out.print("</div>");
							        out.print("<div class='pInf'>");
							        out.print("<br>id：" + memoryChip.getId());
							        out.print("<br>产品名：" + memoryChip.getmName());
							        out.print("<br>品牌：" + memoryChip.getBrand());
							        out.print("<br>接口：" + memoryChip.getBf());
							        out.print("<br>存储容量：" + memoryChip.getCapacity());
							        out.print("<br>价格：" + memoryChip.getPrice());
							        out.print("<br>库存：" + memoryChip.getStock());
							        out.print("</div>");
							        
							        out.print("<div class='pform'>");
							        out.print("<form action='../ScoreServlet' method='post'>");
							        out.print("<input type='hidden' name='uid' value='"+userInf+"'>");
							        out.print("<input type='hidden' name='pid' value='"+memoryChip.getId()+"'>");
							        out.print("<div class='formgroup'>");
							        out.print("<select id='score' name='score'><option value='0'>0</option><option value='1'>1</option><option value='2'>2</option><option value='3'>3</option><option value='4'>4</option><option value='5'>5</option></select> ");
							        out.print("</div>");
							        out.print("<div class='formgroup'>");
							        out.print("<input type='submit' value='评分'> ");
							       	out.print("</div>");
							        out.print("</form>");
							        out.print("</div>");
							        
							        out.print("</div>");
								}
							}
							
							//散热器
							if(null == userAssemble.getRadiator()){
								out.print("<div class='productItem'>");
						 		out.print("<hr>");
						 		out.println("<h2>当前没有散热器信息!</h2>");
						 		out.print("</div>");
							}else{
								
								RadiatorInf radiator = userAssemble.getRadiator();
								out.print("<div class='productItem'>");
						 		out.print("<hr>");
						        out.print("<div class='pImg'>");
						        out.print("<img src='"+radiator.getImgPath()+"'>");
						        out.print("</div>");
						        out.print("<div class='pInf'>");
						        out.print("<br>id：" + radiator.getId());
						        out.print("<br>产品名：" + radiator.getrName());
						        out.print("<br>散热方式：" + radiator.getHeatDissipation());                
						        out.print("<br>价格：" + radiator.getPrice());
						        out.print("<br>库存：" + radiator.getStock());
						        out.print("</div>");
						        
						        out.print("<div class='pform'>");
						        out.print("<form action='../ScoreServlet' method='post'>");
						        out.print("<input type='hidden' name='uid' value='"+userInf+"'>");
						        out.print("<input type='hidden' name='pid' value='"+radiator.getId()+"'>");
						        out.print("<div class='formgroup'>");
						        out.print("<select id='score' name='score'><option value='0'>0</option><option value='1'>1</option><option value='2'>2</option><option value='3'>3</option><option value='4'>4</option><option value='5'>5</option></select> ");
						        out.print("</div>");
						        out.print("<div class='formgroup'>");
						        out.print("<input type='submit' value='评分'> ");
						       	out.print("</div>");
						        out.print("</form>");
						        out.print("</div>");
						        
							    out.print("</div>");
							}

						}
					}
					

				%>
	            </div>
            </div>
            <%@include file="side.jsp" %>	
            <%@include file="footer.jsp" %>
     </div>  
</body>
</html>
<%@include file="webpets.jsp" %>