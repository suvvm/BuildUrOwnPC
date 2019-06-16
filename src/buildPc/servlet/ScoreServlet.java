package buildPc.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import buildPc.inf.ScoreInf;
import buildPc.util.DB;

/**
 * Servlet implementation class ScoreServlet
 */
@WebServlet("/ScoreServlet")
public class ScoreServlet extends HttpServlet {
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
		ScoreInf scoreInf = new ScoreInf(Integer.parseInt(request.getParameter("uid")), Integer.parseInt(request.getParameter("pid")), Integer.parseInt(request.getParameter("score")));

		try {
			DB.executeUpdate("INSERT INTO `score` VALUES("+scoreInf.getPid()+","+scoreInf.getUid()+","+scoreInf.getScore()+")");
			out.print("<script>alert('评分成功');location.href='../BuildPc/pages/score.jsp'</script>");
		} catch (Exception e) {
			out.print("<script>alert('评分败亡');location.href='../BuildPc/pages/score.jsp'</script>");
		}
	}

}
