<%@page import="buildPc.inf.SSDInf"%>
<%@page import="buildPc.inf.MemoryChipInf"%>
<%@page import="buildPc.inf.MechanicsInf"%>
<%@page import="buildPc.inf.MainboardInf"%>
<%@page import="buildPc.inf.GraphicsInf"%>
<%@page import="buildPc.util.DB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="buildPc.inf.ScoreInf"%>
<%@page import="buildPc.inf.CpuInf"%>
<%@page import="javax.persistence.Index"%>
<%@page import="java.util.List"%>
<%@page import="buildPc.inf.RadiatorInf"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/webStyle.css" type="text/css" />
<title>组装</title>
</head>
<body>
	<div class="home">
		<%@include file="header.jsp" %>
		<div class="content">
			<div class="forFlow">
				<% 
				int uid = 0;
				for(int i = 0;i < cookies.length;i++){
					if(cookies[i].getName().equals("userInf")){		
						uid = Integer.parseInt(cookies[i].getValue());
						break;
					}
				}
				if(null != request.getParameter("content") && null != request.getParameter("type")){
					out.print("Yse");
					String cnt = request.getParameter("content");
					
					String type = request.getParameter("type");
					if(type.equals("cpu")){
						CpuInf cpu = CpuInf.getInf(Integer.parseInt(cnt));
						out.print("<hr>");
						out.print("<div class='productItem'>");
						out.print("<div class='pOut'>");
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
				        out.print("<br>评分：" + ScoreInf.getInf(cpu.getId()));
				        out.print("</div>");
				 		
				        ResultSet rSet = DB.executeQuery("SELECT * FROM usercomment WHERE pid="+cpu.getId()+"");
				        while(rSet.next()){
				        	if(rSet.getBoolean("isshow")){
				        		ResultSet rSet2 = DB.executeQuery("SELECT * FROM user_inf WHERE uid="+rSet.getInt("uid")+"");
				        		if(rSet2.next()){
				        			out.print("<hr>");
				        			out.print("<div class='pInf'>");
					        		out.print("<br>用户：" +rSet2.getString("uUserName"));
					        		out.print("<p>"+rSet.getString("content")+"</p>");
					        		out.print("</div>");
				        		}
				        	}
				        }
				        out.print("</div>");
				        out.print("</div>");
					}else if(type.equals("graphics")){
						GraphicsInf graphics = GraphicsInf.getInf(Integer.parseInt(cnt));
						out.print("<div class='productItem'>");
				 		out.print("<hr>");
				 		out.print("<div class='pOut'>");
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
				        out.print("<br>评分：" + ScoreInf.getInf(graphics.getId()));
				 		out.print("</div>");
						
				 		ResultSet rSet = DB.executeQuery("SELECT * FROM usercomment WHERE pid="+graphics.getId()+"");
				        while(rSet.next()){
				        	if(rSet.getBoolean("isshow")){
				        		ResultSet rSet2 = DB.executeQuery("SELECT * FROM user_inf WHERE uid="+rSet.getInt("uid")+"");
				        		if(rSet2.next()){
				        			out.print("<hr>");
				        			out.print("<div class='pInf'>");
					        		out.print("<br>用户：" +rSet2.getString("uUserName"));
					        		out.print("<p>"+rSet.getString("content")+"</p>");
					        		out.print("</div>");
				        		}
				        	}
				        }
				 		
				        out.print("</div>");
				        out.print("</div>");
					}else if(type.equals("mainboard")){
						MainboardInf mainboard = MainboardInf.getInf(Integer.parseInt(cnt));
						out.print("<div class='productItem'>");
				 		out.print("<hr>");
				 		out.print("<div class='pOut'>");
						out.print("<div class='pImg'>");
				        out.print("<img src='"+mainboard.getImgPath()+"'>");
						out.print("</div>");
				 		out.print("<div class='pInf'>");
				        out.print("<br>id：" + mainboard.getId());
				        out.print("<br>产品名：" + mainboard.getmName());
				        out.print("<br>品牌：" + mainboard.getBrand());
				        out.print("<br>芯片组：" + mainboard.getChipset());
				        if(mainboard.isIntegratedGraphics()){
				        	out.print("<br>板载显卡：有");
				        }else{
				        	out.print("<br>板载显卡：无");
				        }
				        out.print("<br>cpu接口：" + mainboard.getCpuSlot());
				        out.print("<br>内存插槽：" + mainboard.getRamSlot() +"*" + mainboard.getRamSlotNum());
				        out.print("<br>USB2.0数量：" + mainboard.getUsb2() +"   USB3.0数量：" + mainboard.getUsb3());
				        out.print("<br>板载网卡：" + mainboard.getNetworkcard() + "   网络接口：" + mainboard.getNetworkInterface());
				        out.print("<br>硬盘接口：");
				        int mnum = mainboard.getmDotTwoNum();
				        if(mnum != 0){
				        	out.print("M.2 * " +  mnum + "   ");
				        }
				        out.print("SATA * " + mainboard.getSataNum());
				        out.print("<br>支持接口：");
				        int hdmi = mainboard.getHdmi();
				        if(hdmi != 0){
				        	out.print("   HDMI * " +  hdmi);
				        }
				        int dvi = mainboard.getDvi();
				        if(dvi != 0){
				        	out.print("   DVI * " + dvi);
				        }
				        int vga = mainboard.getVga();
				        if(vga != 0){
				        	out.print("   VGA * " + vga);
				        }
				        int pic = mainboard.getPic();
				        if(pic != 0){
				        	out.print("   PIC * " + pic);
				        }
				        int dp = mainboard.getDp();
				        if(dp != 0){
				        	out.print("   DP * " + dp);
				        }
				        out.print("<br>价格：" + mainboard.getPrice());
				        out.print("<br>库存：" + mainboard.getStock());
				        out.print("<br>评分：" + ScoreInf.getInf(mainboard.getId()));
				 		out.print("</div>");
				      
				 		ResultSet rSet = DB.executeQuery("SELECT * FROM usercomment WHERE pid="+mainboard.getId()+"");
				        while(rSet.next()){
				        	if(rSet.getBoolean("isshow")){
				        		ResultSet rSet2 = DB.executeQuery("SELECT * FROM user_inf WHERE uid="+rSet.getInt("uid")+"");
				        		if(rSet2.next()){
				        			out.print("<hr>");
				        			out.print("<div class='pInf'>");
					        		out.print("<br>用户：" +rSet2.getString("uUserName"));
					        		out.print("<p>"+rSet.getString("content")+"</p>");
					        		out.print("</div>");
				        		}
				        	}
				        }
				 		
				        out.print("</div>");
				        out.print("</div>");
					}else if(type.equals("mechanics")){
						MechanicsInf mechanics = MechanicsInf.getInf(Integer.parseInt(cnt));
						out.print("<div class='productItem'>");
				 		out.print("<hr>");
				 		out.print("<div class='pOut'>");
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
				        out.print("<br>评分：" + ScoreInf.getInf(mechanics.getId()));
				        out.print("</div>");
				     
				        ResultSet rSet = DB.executeQuery("SELECT * FROM usercomment WHERE pid="+mechanics.getId()+"");
				        while(rSet.next()){
				        	if(rSet.getBoolean("isshow")){
				        		ResultSet rSet2 = DB.executeQuery("SELECT * FROM user_inf WHERE uid="+rSet.getInt("uid")+"");
				        		if(rSet2.next()){
				        			out.print("<hr>");
				        			out.print("<div class='pInf'>");
					        		out.print("<br>用户：" +rSet2.getString("uUserName"));
					        		out.print("<p>"+rSet.getString("content")+"</p>");
					        		out.print("</div>");
				        		}
				        	}
				        }
				        
				        out.print("</div>");
				        out.print("</div>");
					}else if(type.equals("memoryChip")){
						MemoryChipInf memoryChip = MemoryChipInf.getInf(Integer.parseInt(cnt));
						out.print("<div class='productItem'>");
				 		out.print("<hr>");
				 		out.print("<div class='pOut'>");
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
				        out.print("<br>评分：" + ScoreInf.getInf(memoryChip.getId()));
				        out.print("</div>");
				       	
				        ResultSet rSet = DB.executeQuery("SELECT * FROM usercomment WHERE pid="+memoryChip.getId()+"");
				        while(rSet.next()){
				        	if(rSet.getBoolean("isshow")){
				        		ResultSet rSet2 = DB.executeQuery("SELECT * FROM user_inf WHERE uid="+rSet.getInt("uid")+"");
				        		if(rSet2.next()){
				        			out.print("<hr>");
				        			out.print("<div class='pInf'>");
					        		out.print("<br>用户：" +rSet2.getString("uUserName"));
					        		out.print("<p>"+rSet.getString("content")+"</p>");
					        		out.print("</div>");
				        		}
				        	}
				        }
				        
				        out.print("</div>");
				        out.print("</div>");
					}else if(type.equals("radiator")){
						RadiatorInf radiator = RadiatorInf.getInf(Integer.parseInt(cnt));
						out.print("<div class='productItem'>");
				 		out.print("<hr>");
				 		out.print("<div class='pOut'>");
				        out.print("<div class='pImg'>");
				        out.print("<img src='"+radiator.getImgPath()+"'>");
				        out.print("</div>");
				        out.print("<div class='pInf'>");
				        out.print("<br>id：" + radiator.getId());
				        out.print("<br>产品名：" + radiator.getrName());
				        out.print("<br>散热方式：" + radiator.getHeatDissipation());                
				        out.print("<br>价格：" + radiator.getPrice());
				        out.print("<br>库存：" + radiator.getStock());
				        out.print("<br>评分：" + ScoreInf.getInf(radiator.getId()));
				        out.print("</div>");
				        
				        ResultSet rSet = DB.executeQuery("SELECT * FROM usercomment WHERE pid="+radiator.getId()+"");
				        while(rSet.next()){
				        	if(rSet.getBoolean("isshow")){
				        		ResultSet rSet2 = DB.executeQuery("SELECT * FROM user_inf WHERE uid="+rSet.getInt("uid")+"");
				        		if(rSet2.next()){
				        			out.print("<hr>");
				        			out.print("<div class='pInf'>");
					        		out.print("<br>用户：" +rSet2.getString("uUserName"));
					        		out.print("<p>"+rSet.getString("content")+"</p>");
					        		out.print("</div>");
				        		}
				        	}
				        }
				        
				        out.print("</div>");
				        out.print("</div>");
					}else if(type.equals("ssd")){
						SSDInf ssd = SSDInf.getInf(Integer.parseInt(cnt));
						out.print("<div class='productItem'>");
				 		out.print("<hr>");
				 		out.print("<div class='pOut'>");
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
				        out.print("<br>评分：" + ScoreInf.getInf(ssd.getId()));
				        out.print("</div>");
				        
				        ResultSet rSet = DB.executeQuery("SELECT * FROM usercomment WHERE pid="+ssd.getId()+"");
				        while(rSet.next()){
				        	if(rSet.getBoolean("isshow")){
				        		ResultSet rSet2 = DB.executeQuery("SELECT * FROM user_inf WHERE uid="+rSet.getInt("uid")+"");
				        		if(rSet2.next()){
				        			out.print("<hr>");
				        			out.print("<div class='pInf'>");
					        		out.print("<br>用户：" +rSet2.getString("uUserName"));
					        		out.print("<p>"+rSet.getString("content")+"</p>");
					        		out.print("</div>");
				        		}
				        	}
				        }
				        
				        out.print("</div>");
				        out.print("</div>");
					}
				%> 
				<hr>
				<div class='productItem'>
					<div class='pOut'>
						<div class='pform'>
		        			<form action='../CommentServlet' method='post'>
		        				<input type='hidden' name='type' value='<%= type%>'>
		       					<input type='hidden' name='uid' value='<%= uid %>'>
		       					<input type='hidden' name='pid' value='<%= Integer.parseInt(cnt)%>'>
		        				<div class='formgroup'>
		       					<textarea style="width: 80%; height: 250px" name='ct' id='ct'>输入评论</textarea>
		       					</div>
		        				<div class='formgroup'>
		        				<input type='submit' value='提交'>
		       					</div>
		       				</form>
		        		</div>
					</div>
				</div>
				 
				<%}%>
			</div>
		
		</div>
		<%@include file="side.jsp" %>
		<%@include file="footer.jsp" %>
	</div>
</body>
</html>
<%@include file="webpets.jsp" %>