package buildPc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import buildPc.inf.MainboardInf;
import buildPc.inf.SSDInf;
import buildPc.inf.UserAssemble;
import buildPc.inf.UserInf;
import buildPc.util.AddProductTools;
import buildPc.util.DB;
import jdk.nashorn.internal.runtime.UserAccessorProperty;

/**
 * Servlet implementation class BuyServlet
 */
@WebServlet("/BuyServlet")
public class BuyServlet extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO 加入购物车
		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		UserInf user = new UserInf();
		Cookie cookie[] = request.getCookies();
		int userInf = 0;
		boolean flag = false;
		for(Cookie i : cookie){
			if(i.getName().equals("userInf")){
				userInf = Integer.parseInt(i.getValue());
				ResultSet rSet;
				try {
					rSet = DB.executeQuery("SELECT * FROM user_inf WHERE uId = "+userInf+"");
					if(rSet.next()){
						flag = true;
					}
				} catch (Exception e) {
					// TODO 自动生成的 catch 块
					e.printStackTrace();
				}
				break;
			}
		}
		if(!flag){
			out.print("<script>alert('你还没有登录');location.href='../BuildPc/pages/login.jsp'</script>");
		}else {
			String ptype = request.getParameter("ptype");
			int pid = Integer.parseInt(request.getParameter("pid"));
			String ptable = request.getParameter("ptable");
			String content = request.getParameter("content");
			int number = Integer.parseInt(request.getParameter("buyNum"));
			out.print("ptype="+ptype+"   pid="+pid+"   ptable="+ptable+"  content="+content+"   number="+number+"");
			if (!AddProductTools.judgeStock(ptable, pid, number)) {
				out.print("<script>alert('该商品库存不足');location.href='../BuildPc/pages/assemble.jsp?content="+content+"'</script>");
			}
			HttpSession session = request.getSession();
			if (AddProductTools.addProduct(ptype, pid, userInf, number, session)) {
				out.print("<script>alert('加入购物车成功');location.href='../BuildPc/pages/assemble.jsp?content="+content+"'</script>");
			}else {
				out.print("<script>alert('加入购物车败亡');location.href='../BuildPc/pages/assemble.jsp?content="+content+"'</script>");
			}
		}
	}
	
}

