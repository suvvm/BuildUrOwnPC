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
import buildPc.util.DB;
import buildPc.util.FileTools;

/**
 * Servlet implementation class MdfcpuServlet
 */
@WebServlet("/MdfcpuServlet")
@MultipartConfig
public class MdfcpuServlet extends HttpServlet {
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
		cpuInf.setId(Integer.parseInt(request.getParameter("id")));
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
			String sql = "UPDATE cpu_inf SET cpuName='"+cpuInf.getCpuName()+"', cpuSlot='"+cpuInf.getCpuSlot()+"', core_number="+cpuInf.getCore_number()+", cpu_frequency="+cpuInf.getCpu_frequency()+", bits64="+is64+", price="+cpuInf.getPrice()+", stock="+cpuInf.getStock()+", imgPath='"+cpuInf.getImgPath()+"'";
			
			DB.executeUpdate(sql);
			out.print("<script>alert('修改成功');location.href='../BuildPc/pages/mdfcpu.jsp?content="+cpuInf.getId()+"'</script>");	
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			out.print("<script>alert('修改败亡');location.href='../BuildPc/pages/mdfcpu.jsp?content="+cpuInf.getId()+"'</script>");
		}
		
	}

}
