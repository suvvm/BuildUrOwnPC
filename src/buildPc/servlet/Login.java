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

import com.alibaba.fastjson.JSONObject;

import buildPc.inf.UserInf;
import buildPc.util.DB;
import buildPc.util.MD5;

/**
 * Servlet implementation class Login
 */

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String sql = "SELECT * FROM user_inf WHERE uUserName ='"+username+"' && uPassword = '"+MD5.getMd5(password)+"' ";
		try {
			ResultSet rSet = DB.executeQuery(sql);
			
			if (rSet.next()) {
				if (null != request.getParameter("rememberme") &&request.getParameter("rememberme").equals("Yes")) {	
					Cookie ck_password = new Cookie("remPassword", password);
					Cookie ck_username = new Cookie("remuserName", username);
					ck_password.setMaxAge(7 * 24 * 60 * 60);
					ck_password.setHttpOnly(false);
					ck_username.setMaxAge(7 * 24 * 60 * 60);
					ck_username.setHttpOnly(false);
					response.addCookie(ck_username);
					response.addCookie(ck_password);
				}else {
					Cookie ck_password = new Cookie("remPassword", password);
					Cookie ck_username = new Cookie("remuserName", username);
					ck_password.setMaxAge(0);
					ck_password.setHttpOnly(false);
					ck_username.setMaxAge(0);
					ck_username.setHttpOnly(false);
					response.addCookie(ck_username);
					response.addCookie(ck_password);
				}
				
				Cookie ck_userInf = new Cookie("userInf", String.valueOf(rSet.getInt("uid")));
				ck_userInf.setMaxAge(60 * 60);
				ck_userInf.setHttpOnly(false);
				response.addCookie(ck_userInf);
				out.print("<script>alert('登录成功');location.href='../BuildPc/pages/index.jsp'</script>");
			} else {

				out.print("<script>alert('登录败亡');location.href='../BuildPc/pages/index.jsp'</script>");
			}

		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			out.print("<script>alert('登录败亡');location.href='../BuildPc/pages/index.jsp'</script>");
		}
	}

}
