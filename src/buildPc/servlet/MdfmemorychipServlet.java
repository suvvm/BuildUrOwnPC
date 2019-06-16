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

import buildPc.inf.MemoryChipInf;
import buildPc.util.DB;
import buildPc.util.FileTools;

/**
 * Servlet implementation class MdfmemorychipServlet
 */
@WebServlet("/MdfmemorychipServlet")
@MultipartConfig
public class MdfmemorychipServlet extends HttpServlet {
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
		MemoryChipInf memoryChipInf = new MemoryChipInf();
		memoryChipInf.setId(Integer.parseInt(request.getParameter("id")));
		memoryChipInf.setmName(request.getParameter("mName"));
		memoryChipInf.setBrand(request.getParameter("brand"));
		memoryChipInf.setCapacity(Integer.parseInt(request.getParameter("capacity")));
		memoryChipInf.setBf(request.getParameter("bf"));
		memoryChipInf.setPrice(Integer.parseInt(request.getParameter("price")));
		memoryChipInf.setStock(Integer.parseInt(request.getParameter("stock")));

		Part part = request.getPart("img");
		String imgName = FileTools.getFileName(part);
		String contextPath2 = "F:/kit/JAVA/eclipse/eclipse-workspace/BuildPc/WebContent/images/MemoryChip/";
		String contextPath ="F:/kit/GlassFish/glassfish-4.1.1/glassfish/domains/domain1/eclipseApps/BuildPc/images/MemoryChip/";
		getServletContext().getRealPath("/");
		FileTools.writeTo(imgName, part, contextPath);
		FileTools.writeTo(imgName, part, contextPath2);
		memoryChipInf.setImgPath("../images/MemoryChip/"+imgName);

		try {
			String sql = "UPDATE memorychip SET mName='"+memoryChipInf.getmName()+"', brand='"+memoryChipInf.getBrand()+"', capacity="+memoryChipInf.getCapacity()+", bf='"+memoryChipInf.getBf()+"', price="+memoryChipInf.getPrice()+", stock="+memoryChipInf.getStock()+", imgPath='"+memoryChipInf.getImgPath()+"'";
			DB.executeUpdate(sql);
			out.print("<script>alert('修改成功');location.href='../BuildPc/pages/mdfmemorychip.jsp?content="+memoryChipInf.getId()+"'</script>");	
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			out.print("<script>alert('修改败亡');location.href='../BuildPc/pages/mdfmemorychip.jsp?content="+memoryChipInf.getId()+"'</script>");
		}
	}

}
