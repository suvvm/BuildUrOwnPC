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

import buildPc.inf.CpuInf;
import buildPc.inf.MainboardInf;
import buildPc.util.DB;
import buildPc.util.FileTools;

/**
 * Servlet implementation class AddcpuServlet
 */
@WebServlet("/AddcpuServlet")
@MultipartConfig
public class AddcpuServlet extends HttpServlet {
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
		CpuInf cpuInf = new CpuInf();
		cpuInf.setCpuName(request.getParameter("cpuName"));
		cpuInf.setCpuSlot(request.getParameter("cpuSlot"));
		cpuInf.setCore_number(Integer.parseInt(request.getParameter("core_number")));
		cpuInf.setCpu_frequency(Double.parseDouble(request.getParameter("cpu_frequency")));
		if (Integer.parseInt(request.getParameter("bits64")) > 0) {
			cpuInf.setBits64(true);
		}else {
			cpuInf.setBits64(false);
		}
		cpuInf.setPrice(Integer.parseInt(request.getParameter("price")));
		cpuInf.setStock(Integer.parseInt(request.getParameter("stock")));

		Part part = request.getPart("img");
		String imgName = FileTools.getFileName(part);
		String contextPath2 = "F:/kit/JAVA/eclipse/eclipse-workspace/BuildPc/WebContent/images/cpu/";
		String contextPath ="F:/kit/GlassFish/glassfish-4.1.1/glassfish/domains/domain1/eclipseApps/BuildPc/images/cpu/";
		getServletContext().getRealPath("/");
		FileTools.writeTo(imgName, part, contextPath);
		FileTools.writeTo(imgName, part, contextPath2);
		cpuInf.setImgPath("../images/cpu/"+imgName);

		try {
			int is64 = 0;
			if (cpuInf.isBits64()) {
				is64 = 1;
			}
			DB.executeUpdate("INSERT INTO `cpu_inf` VALUES (null, '"+cpuInf.getCpuName()+"', '"+cpuInf.getCpuSlot()+"', "+cpuInf.getCore_number()+", "+cpuInf.getCpu_frequency()+", "+is64+", "+cpuInf.getPrice()+", "+cpuInf.getStock()+", '"+cpuInf.getImgPath()+"'");
			out.print("<script>alert('添加成功');location.href='../BuildPc/pages/add.jsp?content=addcpu.jsp'</script>");	
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			out.print("<script>alert('添加败亡');location.href='../BuildPc/pages/add.jsp?content=addcpu.jsp'</script>");
		}
		
	}

}
