<%@page import="buildPc.util.DB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="buildPc.inf.ScoreInf"%>
<%@page import="buildPc.inf.MainboardInf"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		boolean isAdmin = false;
		Cookie[] cookies = request.getCookies();
		int uid = 0;
		for(int i = 0;i < cookies.length;i++){
			if(cookies[i].getName().equals("userInf")){		
				uid = Integer.parseInt(cookies[i].getValue());
				ResultSet rSet = DB.executeQuery("SELECT * FROM user_inf WHERE uid="+uid+"");
				if(rSet.next()){
					isAdmin = rSet.getBoolean("isAdministrator");
				}
				break;
			}
		}
		List<MainboardInf> mainboardList = MainboardInf.getInf();
	 	if(null == mainboardList){ 
	 		out.println("<h2>当前没有主板数据信息！</h2>");
	    }else{
	    	for(MainboardInf mainboard : mainboardList){
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
		        out.print("<div class='pform'>");
		        out.print("<form action='../BuyServlet' method='post'>");
		        out.print("<input type='hidden' name='ptype' value='MainboardInf'>");
		        out.print("<input type='hidden' name='ptable' value='mainboard_inf'>");
		        out.print("<input type='hidden' name='content' value='mainBoard.jsp'>");
		        out.print("<input type='hidden' name='pid' value='"+mainboard.getId()+"'>");
		        out.print("<input type='hidden' name='buyNum' value='1'>");
		        out.print("<div class='formgroup'>");
		        out.print("<input type='submit' value='使用该配件'> ");
		       	out.print("</div>");
		        out.print("</form>");
		        out.print("</div>");
		        out.print("<br><a href='comment.jsp?content="+mainboard.getId()+"&type=mainboard'>评论</a>");
		        if(isAdmin){
		        	out.print("<br><a href='mdfmainboard.jsp?content="+mainboard.getId()+"'>修改</a>");
		        }
		        out.print("</div>");
		        out.print("</div>");
			}
	    }
	%>
</body>
</html>