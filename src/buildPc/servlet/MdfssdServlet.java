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

import buildPc.inf.SSDInf;
import buildPc.util.DB;
import buildPc.util.FileTools;

/**
 * Servlet implementation class MdfssdServlet
 */
@WebServlet("/MdfssdServlet")
@MultipartConfig
public class MdfssdServlet extends HttpServlet {
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
		SSDInf ssdInf = new SSDInf();
		ssdInf.setSsdName(request.getParameter("ssdName"));
		ssdInf.setId(Integer.parseInt(request.getParameter("id")));
		ssdInf.setBrand(request.getParameter("brand"));
		ssdInf.setInterface(request.getParameter("Interface"));
		ssdInf.setCapacity(Integer.parseInt(request.getParameter("capacity")));
		ssdInf.setPrice(Integer.parseInt(request.getParameter("price")));
		ssdInf.setStock(Integer.parseInt(request.getParameter("stock")));

		Part part = request.getPart("img");
		String imgName = FileTools.getFileName(part);
		String contextPath2 = "F:/kit/JAVA/eclipse/eclipse-workspace/BuildPc/WebContent/images/ssd/";
		String contextPath ="F:/kit/GlassFish/glassfish-4.1.1/glassfish/domains/domain1/eclipseApps/BuildPc/images/ssd/";
		getServletContext().getRealPath("/");
		FileTools.writeTo(imgName, part, contextPath);
		FileTools.writeTo(imgName, part, contextPath2);
		ssdInf.setImgPath("../images/ssd/"+imgName);

		try {
			String sql = "UPDATE ssd_inf SET ssdName='"+ssdInf.getSsdName()+"', brand='"+ssdInf.getBrand()+"', Interface='"+ssdInf.getInterface()+"',capacity="+ssdInf.getCapacity()+", price="+ssdInf.getPrice()+", stock="+ssdInf.getStock()+", imgPath='"+ssdInf.getImgPath()+"'";
			
			DB.executeUpdate(sql);
			out.print("<script>alert('添加成功');location.href='../BuildPc/pages/mdfssd.jsp?content="+ssdInf.getId()+"'</script>");	
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			out.print("<script>alert('添加败亡');location.href='../BuildPc/pages/mdfssd.jsp?content="+ssdInf.getId()+"'</script>");
		}
	}


}
