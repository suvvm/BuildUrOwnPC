<%@page import="java.sql.ResultSet"%>
<%@page import="buildPc.util.DB"%>
<%@page import="buildPc.inf.UserInf"%>
<%@page import="buildPc.inf.ScoreInf"%>
<%@page import="java.util.List"%>
<%@page import="buildPc.inf.CpuInf"%>
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
		List<CpuInf> cpuList = CpuInf.getInf();
	 	if(null == cpuList){ 
	 		out.println("<h2>当前没有cpu数据信息!</h2>");
	    }else{
	    	for(CpuInf cpu : cpuList){
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
		        
		        out.print("<div class='pform'>");
		        out.print("<form action='../BuyServlet' method='post'>");
		        out.print("<input type='hidden' name='ptype' value='CpuInf'>");
		        out.print("<input type='hidden' name='ptable' value='cpu_inf'>");
		        out.print("<input type='hidden' name='content' value='cpu.jsp'>");
		        out.print("<input type='hidden' name='pid' value='"+cpu.getId()+"'>");
		        out.print("<input type='hidden' name='buyNum' value='1'>");
		        out.print("<div class='formgroup'>");
		        out.print("<input type='submit' value='使用该配件'> ");
		        out.print("</div>");
		        out.print("</form>");
		        out.print("</div>");
		        out.print("<br><a href='comment.jsp?content="+cpu.getId()+"&type=cpu'>评论</a>");
		        if(isAdmin){
		        	out.print("<br><a href='mdfcpu.jsp?content="+cpu.getId()+"'>修改</a>");
		        }
		        out.print("</div>");
		        out.print("</div>");
			}
	    }
	%>
</body>
</html>