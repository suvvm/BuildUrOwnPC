<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="header">
    <img src="../images/logo.png" alt="">
    <h2>江胡科技</h2>
    <ul class="menu">
        <li><a id="index" href="index.jsp">首页</a></li>
        <li><a id="webInf" href="WebIntroduction.jsp">网站简介</a></li>
        <li><a id="assemble" href="assemble.jsp">组装服务</a></li>
        <li><a id="partsInf" href="partIntroduction.jsp">配件介绍</a></li>
        <li><a id="myAssmnle" href="myAssemble.jsp">我的组装</a></li>
        
        <li>
            <% 
            	//检查是否存在名为userInf的cookies 存在则用户已经登录
            	Cookie[] cookies = request.getCookies();
            	boolean isLogin = false;
            	for(int i = 0;i < cookies.length;i++){
            		if(cookies[i].getName().equals("userInf")){		
            			isLogin = true;
            			break;
            		}
            	}
                if (isLogin) {
                    out.print("<a id=\"logout\" href=\"logout.jsp\">注销</a>");
                }else { 
                    out.print("<a id=\"login\" href=\"login.jsp\">登录</a>");
                }
            %>
        </li>
        <li class="slider"></li>
    </ul>
    
</div>
