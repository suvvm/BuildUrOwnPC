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

import buildPc.inf.MainboardInf;
import buildPc.util.DB;
import buildPc.util.FileTools;

/**
 * Servlet implementation class MdfmainboardServlet
 */
@WebServlet("/MdfmainboardServlet")
@MultipartConfig
public class MdfmainboardServlet extends HttpServlet {
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
		mainboardInf.setId(Integer.parseInt(request.getParameter("id")));
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
			String sql = "UPDATE mainboard_inf SET mName='"+mainboardInf.getmName()+"',brand='"+mainboardInf.getBrand()+"',platform='"+mainboardInf.getPlatform()+"',chipset='"+mainboardInf.getChipset()+"',integratedGraphics="+ig+",mDotTwoNum="+mainboardInf.getmDotTwoNum()+",sataNum="+mainboardInf.getSataNum()+",cpuSlot='"+mainboardInf.getCpuSlot()+"',ramSlot='"+mainboardInf.getRamSlot()+"',ramSlotNum="+mainboardInf.getRamSlotNum()+",hdmi="+mainboardInf.getHdmi()+",dvi="+mainboardInf.getDvi()+",vga="+mainboardInf.getVga()+",pic="+mainboardInf.getPic()+",dp="+mainboardInf.getDp()+",usb2="+mainboardInf.getUsb2()+",usb3="+mainboardInf.getUsb3()+",networkcard='"+mainboardInf.getNetworkcard()+"',networkInterface='"+mainboardInf.getNetworkInterface()+"',price="+mainboardInf.getPrice()+",stock="+mainboardInf.getStock()+", imgPath='"+mainboardInf.getImgPath()+"' WHERE id = "+mainboardInf.getId()+"";
			DB.executeUpdate(sql);
			out.print("<script>alert('修改成功');location.href='../BuildPc/pages/mdfmainboard.jsp?content="+mainboardInf.getId()+"'</script>");	
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			out.print("<script>alert('修改败亡');location.href='../BuildPc/pages/mdfmainboard.jsp?content="+mainboardInf.getId()+"'</script>");
		}
		out.print("<script>alert('修改败亡');location.href='../BuildPc/pages/mdfmainboard.jsp?content="+mainboardInf.getId()+"'</script>");
	}


}
