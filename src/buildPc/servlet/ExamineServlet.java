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
 * Servlet implementation class ExamineServlet
 */
@WebServlet("/ExamineServlet")
public class ExamineServlet extends HttpServlet {
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
        commentInf.setUid(Integer.parseInt(request.getParameter("uid")));
        commentInf.setPid(Integer.parseInt(request.getParameter("pid")));
        try {
        	DB.executeUpdate("UPDATE usercomment SET isshow=1 WHERE uid="+commentInf.getUid()+" && pid="+commentInf.getPid()+"");
        	out.print("<script>alert('审核成功');location.href='../BuildPc/pages/examine.jsp'</script>");
        }catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			out.print("<script>alert('审核败亡');location.href='../BuildPc/pages/examine.jsp'</script>");
		}
        out.print("<script>alert('审核败亡');location.href='../BuildPc/pages/examine.jsp'</script>");
	}

}
