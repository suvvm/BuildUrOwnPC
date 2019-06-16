package buildPc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import buildPc.util.DB;

/**
 * Servlet implementation class DltServlet
 */
@WebServlet("/DltServlet")
public class DltServlet extends HttpServlet {
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
		int id = Integer.parseInt(request.getParameter("id"));
		try {
			ResultSet rSet = DB.executeQuery("SELECT * FROM cpu_inf WHERE id="+id+"");
			if (rSet.next()) {
				DB.executeUpdate("DELETE FROM cpu_inf  WHERE id="+id+"");
				out.print("<script>alert('删除成功');location.href='../BuildPc/pages/dlt.jsp'</script>");	
			}
			rSet = DB.executeQuery("SELECT * FROM graphics_inf WHERE id="+id+"");
			if (rSet.next()) {
				DB.executeUpdate("DELETE FROM graphics_inf WHERE id="+id+"");
				out.print("<script>alert('删除成功');location.href='../BuildPc/pages/dlt.jsp'</script>");
			}
			rSet = DB.executeQuery("SELECT * FROM mainboard_inf WHERE id="+id+"");
			if (rSet.next()) {
				DB.executeUpdate("DELETE FROM mainboard_inf WHERE id="+id+"");
				out.print("<script>alert('删除成功');location.href='../BuildPc/pages/dlt.jsp'</script>");
			}
			rSet = DB.executeQuery("SELECT * FROM mechanics_inf WHERE id="+id+"");
			if (rSet.next()) {
				DB.executeUpdate("DELETE FROM mechanics_inf WHERE id="+id+"");
				out.print("<script>alert('删除成功');location.href='../BuildPc/pages/dlt.jsp'</script>");
			}
			rSet = DB.executeQuery("SELECT * FROM memorychip WHERE id="+id+"");
			if (rSet.next()) {
				DB.executeUpdate("DELETE FROM memorychip WHERE id="+id+"");
				out.print("<script>alert('删除成功');location.href='../BuildPc/pages/dlt.jsp'</script>");
			}
			rSet = DB.executeQuery("SELECT * FROM radiator WHERE id="+id+"");
			if (rSet.next()) {
				DB.executeUpdate("DELETE FROM radiator WHERE id="+id+"");
				out.print("<script>alert('删除成功');location.href='../BuildPc/pages/dlt.jsp'</script>");
			}
			rSet = DB.executeQuery("SELECT * FROM ssd_inf WHERE id="+id+"");
			if (rSet.next()) {
				DB.executeUpdate("DELETE FROM ssd_inf WHERE id="+id+"");
				out.print("<script>alert('删除成功');location.href='../BuildPc/pages/dlt.jsp'</script>");
			}
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			out.print("<script>alert('删除败亡');location.href='../BuildPc/pages/dlt.jsp'</script>");
		}
	}
}
