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

import buildPc.inf.GraphicsInf;
import buildPc.util.DB;
import buildPc.util.FileTools;

/**
 * Servlet implementation class AddgraphicsServlet
 */
@WebServlet("/AddgraphicsServlet")
@MultipartConfig
public class AddgraphicsServlet extends HttpServlet {
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
		GraphicsInf graphicsInf = new GraphicsInf();
		graphicsInf.setgName(request.getParameter("gName"));
		graphicsInf.setBrand(request.getParameter("brand"));
		graphicsInf.setDirectX(Double.parseDouble(request.getParameter("directX")));
		graphicsInf.setOpenGL(request.getParameter("OpenGL"));
		graphicsInf.setInterface(request.getParameter("interface"));
		graphicsInf.setMaxResolution(request.getParameter("maxResolution"));
		graphicsInf.setPrice(Integer.parseInt(request.getParameter("price")));
		graphicsInf.setStock(Integer.parseInt(request.getParameter("stock")));

		Part part = request.getPart("img");
		String imgName = FileTools.getFileName(part);
		String contextPath2 = "F:/kit/JAVA/eclipse/eclipse-workspace/BuildPc/WebContent/images/Graphics/";
		String contextPath ="F:/kit/GlassFish/glassfish-4.1.1/glassfish/domains/domain1/eclipseApps/BuildPc/images/Graphics/";
		getServletContext().getRealPath("/");
		FileTools.writeTo(imgName, part, contextPath);
		FileTools.writeTo(imgName, part, contextPath2);
		graphicsInf.setImgPath("../images/Graphics/"+imgName);

		try {
			DB.executeUpdate("INSERT INTO `graphics_inf` VALUES (null, '"+graphicsInf.getgName()+"', '"+graphicsInf.getBrand()+"', "+graphicsInf.getDirectX()+",'"+graphicsInf.getOpenGL()+"', '"+graphicsInf.getInterface()+"', '"+graphicsInf.getMaxResolution()+"', "+graphicsInf.getPrice()+", "+graphicsInf.getStock()+", '"+graphicsInf.getImgPath()+"'");
			out.print("<script>alert('添加成功');location.href='../BuildPc/pages/add.jsp?content=addgraphics.jsp'</script>");	
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			out.print("<script>alert('添加败亡');location.href='../BuildPc/pages/add.jsp?content=addgraphics.jsp'</script>");
		}
	}


}
