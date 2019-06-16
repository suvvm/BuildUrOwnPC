package buildPc.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import buildPc.inf.CommentInf;
import buildPc.util.DB;

/**
 * Servlet implementation class CommentServlet
 */
@WebServlet("/CommentServlet")
public class CommentServlet extends HttpServlet {
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
		CommentInf commentInf = new CommentInf();
		commentInf.setPid(Integer.parseInt(request.getParameter("pid")));
		commentInf.setUid(Integer.parseInt(request.getParameter("uid")));
		commentInf.setContent(request.getParameter("ct"));
		try {
		DB.executeUpdate("INSERT INTO usercomment VALUES("+commentInf.getUid()+","+commentInf.getPid()+",'"+commentInf.getContent()+"',0)");
		out.print("<script>alert('评论成功等待审核');location.href='../BuildPc/pages/comment.jsp?content="+commentInf.getPid()+"&type="+request.getParameter("type")+"'</script>");
		} catch (Exception e) {
			e.printStackTrace();
			out.print("<script>alert('评论败亡');location.href='../BuildPc/pages/comment.jsp?content="+commentInf.getPid()+"&type="+request.getParameter("type")+"'</script>");
		}
	}

}
