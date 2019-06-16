<%@page import="buildPc.util.DB"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div id="sideBar">
	<br>
	<br>
	<br>
	<%

	Cookie[] cookies3 = request.getCookies();
	boolean isAdmin2 = false;
	int uid2 = 0;
	String userName = "";
	for(int i = 0;i < cookies3.length;i++){
		if(cookies3[i].getName().equals("userInf")){		
			uid2 = Integer.parseInt(cookies3[i].getValue());
			ResultSet rSet5 = DB.executeQuery("SELECT * FROM user_inf WHERE uid="+uid2+"");
			if(rSet5.next()){
				userName = rSet5.getString("uUserName");
				out.print("<p>欢迎"+userName+"</p>");
				isAdmin2 = rSet5.getBoolean("isAdministrator");
			}
			break;
		}
	}
	if(isAdmin2){
		out.print("<a href='admin.jsp'>进入管理员界面</a>");
	}
	%>
	
	<h4>公告</h4>
	<p>江泽民主席万寿无疆</p>
	 <ul class="partmenu">
        <li><a id="radiator" href="assemble.jsp?content=radiator.jsp">散热器</a></li>
        <li><a id="graphics" href="assemble.jsp?content=graphics.jsp">显卡</a></li>
        <li><a id="ssd" href="assemble.jsp?content=ssd.jsp">固态硬盘</a></li>
        <li><a id="mechanics" href="assemble.jsp?content=mechanics.jsp">机械硬盘</a></li>
        <li><a id="cpu" href="assemble.jsp?content=cpu.jsp">cpu</a></li>
        <li><a id="memorychip" href="assemble.jsp?content=memorychip.jsp">内存</a></li>
        <li><a id="mainBoard" href="assemble.jsp?content=mainBoard.jsp">主板</a></li>
        <li><a id="recommend" href="recommend.jsp">推荐一手</a></li>
     </ul>
</div>