<%@page import="buildPc.util.DB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="buildPc.inf.ScoreInf"%>
<%@page import="java.util.List"%>
<%@page import="buildPc.inf.RadiatorInf"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div>
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
		List<RadiatorInf> radiatorList = RadiatorInf.getInf();
	 	if(null == radiatorList){ 
	 		out.println("<div><h2>当前没有散热器数据信息！</h2></div>");
	    }else{
	    	for(RadiatorInf radiator : radiatorList){
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
		        out.print("<div class='pform'>");
		        out.print("<form action='../BuyServlet' method='post'>");
		        out.print("<input type='hidden' name='ptype' value='RadiatorInf'>");
		        out.print("<input type='hidden' name='ptable' value='radiator'>");
		        out.print("<input type='hidden' name='content' value='radiator.jsp'>");
		        out.print("<input type='hidden' name='pid' value='"+radiator.getId()+"'>");
		        out.print("<input type='hidden' name='buyNum' value='1'>");
		        out.print("<div class='formgroup'>");
		        out.print("<input type='submit' value='使用该配件'> ");
		        out.print("</div>");
		        out.print("</form>");
		        out.print("</div>");
		        out.print("<br><a href='comment.jsp?content="+radiator.getId()+"&type=radiator'>评论</a>");
		        if(isAdmin){
		        	out.print("<br><a href='mdfradiator.jsp?content="+radiator.getId()+"'>修改</a>");
		        }
		        out.print("</div>");
		        out.print("</div>");
			}
	    }
	%>
</div>