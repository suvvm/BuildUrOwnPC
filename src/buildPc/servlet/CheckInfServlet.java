package buildPc.servlet;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import buildPc.util.DB;

/**
 * Servlet implementation class CheckInfServlet
 */
@WebServlet("/CheckInfServlet")
public class CheckInfServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String data = request.getParameter("data");
		String sql = "SELECT * FROM user_inf WHERE uEmail='"+data+"' || uPNum='"+data+"' || uUserName='"+data+"'";
		try {
			ResultSet rSet = DB.executeQuery(sql);
			if (rSet.next()) {
				response.getWriter().print("yes");
			} else {
				response.getWriter().print("no");
			}
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			response.getWriter().print("no");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

}
