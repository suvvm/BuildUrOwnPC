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

import buildPc.inf.MechanicsInf;
import buildPc.util.DB;
import buildPc.util.FileTools;

/**
 * Servlet implementation class MdfmechanicsServlet
 */
@WebServlet("/MdfmechanicsServlet")
@MultipartConfig
public class MdfmechanicsServlet extends HttpServlet {
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
		MechanicsInf mechanicsInf = new MechanicsInf();
		mechanicsInf.setId(Integer.parseInt(request.getParameter("id")));
		mechanicsInf.setMecName(request.getParameter("mecName"));
		mechanicsInf.setBrand(request.getParameter("brand"));
		mechanicsInf.setInterface(request.getParameter("Interface"));
		mechanicsInf.setSpeed(Integer.parseInt(request.getParameter("speed")));
		mechanicsInf.setCapacity(Integer.parseInt(request.getParameter("capacity")));
		mechanicsInf.setCache(Integer.parseInt(request.getParameter("cache")));
		mechanicsInf.setPrice(Integer.parseInt(request.getParameter("price")));
		mechanicsInf.setStock(Integer.parseInt(request.getParameter("stock")));

		Part part = request.getPart("img");
		String imgName = FileTools.getFileName(part);
		String contextPath2 = "F:/kit/JAVA/eclipse/eclipse-workspace/BuildPc/WebContent/images/Mechanics/";
		String contextPath ="F:/kit/GlassFish/glassfish-4.1.1/glassfish/domains/domain1/eclipseApps/BuildPc/images/Mechanics/";

		FileTools.writeTo(imgName, part, contextPath);
		FileTools.writeTo(imgName, part, contextPath2);
		mechanicsInf.setImgPath("../images/Mechanics/"+imgName);

		try {
			String sql = "UPDATE mechanics SET mecName='"+mechanicsInf.getMecName()+"', brand='"+mechanicsInf.getBrand()+"', Interface='"+mechanicsInf.getInterface()+"',speed="+mechanicsInf.getSpeed()+",capacity="+mechanicsInf.getCapacity()+",cache="+mechanicsInf.getCache()+", price="+mechanicsInf.getPrice()+", stock="+mechanicsInf.getStock()+", imgPath='"+mechanicsInf.getImgPath()+"'";
			
			DB.executeUpdate(sql);
			out.print("<script>alert('修改成功');location.href='../BuildPc/pages/mdfmechanics.jsp?content="+mechanicsInf.getId()+"'</script>");	
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			out.print("<script>alert('修改败亡');location.href='../BuildPc/pages/mdfmechanics.jsp?content="+mechanicsInf.getId()+"'</script>");
		}
	}

}
