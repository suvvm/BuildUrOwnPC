package buildPc.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import buildPc.inf.RadiatorInf;
import buildPc.inf.SSDInf;
import buildPc.util.DB;
import buildPc.util.FileTools;

/**
 * Servlet implementation class AddradiatorServlet
 */
@WebServlet("/AddradiatorServlet")
@MultipartConfig
public class AddradiatorServlet extends HttpServlet {
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
		RadiatorInf radiatorInf = new RadiatorInf();
		radiatorInf.setrName(request.getParameter("rName"));
		radiatorInf.setHeatDissipation(request.getParameter("heatDissipation"));
		radiatorInf.setNoise(request.getParameter("noise"));
		radiatorInf.setPrice(Integer.parseInt(request.getParameter("price")));
		radiatorInf.setStock(Integer.parseInt(request.getParameter("stock")));

		Part part = request.getPart("img");
		String imgName = FileTools.getFileName(part);
		String contextPath2 = "F:/kit/JAVA/eclipse/eclipse-workspace/BuildPc/WebContent/images/Radiator/";
		String contextPath ="F:/kit/GlassFish/glassfish-4.1.1/glassfish/domains/domain1/eclipseApps/BuildPc/images/Radiator/";
		getServletContext().getRealPath("/");
		FileTools.writeTo(imgName, part, contextPath);
		FileTools.writeTo(imgName, part, contextPath2);
		radiatorInf.setImgPath("../images/Radiator/"+imgName);

		try {
			DB.executeUpdate("INSERT INTO `radiator` VALUES (null, '"+radiatorInf.getrName()+"', '"+radiatorInf.getHeatDissipation()+"', '"+radiatorInf.getNoise()+"', "+radiatorInf.getPrice()+", "+radiatorInf.getStock()+", '"+radiatorInf.getImgPath()+"'");
			out.print("<script>alert('添加成功');location.href='../BuildPc/pages/add.jsp?content=addradiator.jsp'</script>");	
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			out.print("<script>alert('添加败亡');location.href='../BuildPc/pages/add.jsp?content=addradiator.jsp'</script>");
		}
	}


}
