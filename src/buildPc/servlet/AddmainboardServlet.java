package buildPc.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.UUID;

import javax.mail.Multipart;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.jboss.weld.context.beanstore.AbstractNamingScheme;

import com.mysql.cj.protocol.a.MultiPacketReader;
import com.sun.xml.rpc.processor.modeler.j2ee.xml.string;

import buildPc.inf.MainboardInf;
import buildPc.util.DB;
import buildPc.util.FileTools;

/**
 * Servlet implementation class AddmainboardServlet
 */
@WebServlet("/AddmainboardServlet")
@MultipartConfig
public class AddmainboardServlet extends HttpServlet {
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
		MainboardInf mainboardInf = new MainboardInf();
		mainboardInf.setmName(request.getParameter("mName"));
		mainboardInf.setBrand(request.getParameter("brand"));
		mainboardInf.setPlatform(request.getParameter("platform"));
		mainboardInf.setChipset(request.getParameter("chipset"));
		if(Integer.parseInt(request.getParameter("integratedGraphics")) == 0) {
			mainboardInf.setIntegratedGraphics(false);
		}else {
			mainboardInf.setIntegratedGraphics(true);
		}
		mainboardInf.setmDotTwoNum(Integer.parseInt(request.getParameter("mDotTowNum")));
		mainboardInf.setSataNum(Integer.parseInt(request.getParameter("sataNum")));
		mainboardInf.setCpuSlot(request.getParameter("cpuSlot"));
		mainboardInf.setRamSlot(request.getParameter("ramSlot"));
		mainboardInf.setRamSlotNum(Integer.parseInt(request.getParameter("ramSlotNum")));
		mainboardInf.setHdmi(Integer.parseInt(request.getParameter("hdmi")));
		mainboardInf.setDvi(Integer.parseInt(request.getParameter("dvi")));
		mainboardInf.setVga(Integer.parseInt(request.getParameter("vga")));
		mainboardInf.setPic(Integer.parseInt(request.getParameter("pic")));
		mainboardInf.setDp(Integer.parseInt(request.getParameter("dp")));
		mainboardInf.setUsb2(Integer.parseInt(request.getParameter("usb2")));
		mainboardInf.setUsb3(Integer.parseInt(request.getParameter("usb3")));
		mainboardInf.setNetworkcard(request.getParameter("networkcard"));
		mainboardInf.setNetworkInterface(request.getParameter("networkInterface"));
		mainboardInf.setPrice(Integer.parseInt(request.getParameter("price")));
		mainboardInf.setStock(Integer.parseInt(request.getParameter("stock")));
		Part part = request.getPart("img");
		String imgName = FileTools.getFileName(part);
		String contextPath2 = "F:/kit/JAVA/eclipse/eclipse-workspace/BuildPc/WebContent/images/mainborad/";
		String contextPath ="F:/kit/GlassFish/glassfish-4.1.1/glassfish/domains/domain1/eclipseApps/BuildPc/images/mainborad/";
		getServletContext().getRealPath("/");
		FileTools.writeTo(imgName, part, contextPath);
		FileTools.writeTo(imgName, part, contextPath2);
		mainboardInf.setImgPath("../images/mainborad/"+imgName);

		try {
			int ig = 0;
			if (mainboardInf.isIntegratedGraphics()) {
				ig = 1;
			}
			DB.executeUpdate("INSERT INTO `mainboard_inf` VALUES (null, '"+mainboardInf.getmName()+"', '"+mainboardInf.getBrand()+"', '"+mainboardInf.getPlatform()+"', '"+mainboardInf.getChipset()+"', "+ig+", "+mainboardInf.getmDotTwoNum()+", "+mainboardInf.getSataNum()+", '"+mainboardInf.getCpuSlot()+"', '"+mainboardInf.getRamSlot()+"', "+mainboardInf.getRamSlotNum()+", "+mainboardInf.getHdmi()+", "+mainboardInf.getDvi()+", "+mainboardInf.getVga()+", "+mainboardInf.getPic()+", "+mainboardInf.getDp()+", "+mainboardInf.getUsb2()+", "+mainboardInf.getUsb3()+", '"+mainboardInf.getNetworkcard()+"', '"+mainboardInf.getNetworkInterface()+"', "+mainboardInf.getPrice()+", "+mainboardInf.getStock()+", '"+mainboardInf.getImgPath()+"')");
			out.print("<script>alert('添加成功');location.href='../BuildPc/pages/add.jsp?content=addmainboard.jsp'</script>");	
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			out.print("<script>alert('添加败亡');location.href='../BuildPc/pages/add.jsp?content=addmainboard.jsp'</script>");
		}
		
	}

}
