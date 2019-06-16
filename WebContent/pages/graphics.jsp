<%@page import="buildPc.util.DB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="buildPc.inf.ScoreInf"%>
<%@page import="buildPc.inf.GraphicsInf"%>
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
	
		Cookie[] cookies = request.getCookies();
		boolean isAdmin = false;
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
		List<GraphicsInf> graphicsList = GraphicsInf.getInf();
	 	if(null == graphicsList){ 
	 		out.println("<h2>当前没有显卡数据信息！</h2>");
	    }else{
	    	for(GraphicsInf graphics : graphicsList){
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
		        out.print("<div class='pform'>");
		        out.print("<form action='../BuyServlet' method='post'>");
		        out.print("<input type='hidden' name='ptype' value='GraphicsInf'>");
		        out.print("<input type='hidden' name='ptable' value='graphics_inf'>");
		        out.print("<input type='hidden' name='content' value='graphics.jsp'>");
		        out.print("<input type='hidden' name='pid' value='"+graphics.getId()+"'>");
		        out.print("<div class='formgroup'>");
		        out.print("<input type='number' min='1' name='buyNum' value='1'>");
		        out.print("</div>");
		        out.print("<div class='formgroup'>");
		        out.print("<input type='submit' value='使用该配件'> ");
		        out.print("</div>");
		        out.print("</form>");
		        out.print("</div>");
		        out.print("<br><a href='comment.jsp?content="+graphics.getId()+"&type=graphics'>评论</a>");
		        if(isAdmin){
		        	out.print("<br><a href='mdfgraphics.jsp?content="+graphics.getId()+"'>修改</a>");
		        }
		        out.print("</div>");
		        out.print("</div>");
			}
	    }
	%>
</body>
</html>