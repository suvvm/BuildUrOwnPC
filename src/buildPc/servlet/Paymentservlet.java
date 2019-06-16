package buildPc.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import buildPc.inf.GraphicsInf;
import buildPc.inf.MechanicsInf;
import buildPc.inf.MemoryChipInf;
import buildPc.inf.SSDInf;
import buildPc.inf.UserAssemble;
import buildPc.util.JudgeAssembleTools;

/**
 * Servlet implementation class Paymentservlet
 */
@WebServlet("/Paymentservlet")
public class Paymentservlet extends HttpServlet {
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
		HttpSession session = request.getSession();
		if(null == session.getAttribute("assemble")) {
			out.print("<script>alert('没有添加任何装机信息！');location.href='../BuildPc/pages/myAssemble.jsp'");
		}else {
			UserAssemble userAssemble = (UserAssemble) session.getAttribute("assemble");
			if(null == userAssemble.getCpu() || null == userAssemble.getGraphics() || null == userAssemble.getMainboard() || (null == userAssemble.getMechanics() && null == userAssemble.getSsd())
					|| null == userAssemble.getMemoryChip() || null == userAssemble.getRadiator()) {
				out.print("<script>alert('关键部件未选择！');location.href='../BuildPc/pages/myAssemble.jsp'</script>");
			}else {
				if (!JudgeAssembleTools.judgeCup(userAssemble.getMainboard(), userAssemble.getCpu())) {
					out.print("<script>alert('cpu无法安装至主板！');location.href='../BuildPc/pages/myAssemble.jsp'</script>");
				}else{
					for(GraphicsInf graphics : userAssemble.getGraphics()) {
						if (!JudgeAssembleTools.judgeGraphics(userAssemble.getMainboard(), graphics)) {
							out.print("<script>alert('显卡:"+graphics.getgName()+"无法安装至主板');location.href='../BuildPc/pages/myAssemble.jsp'</script>");
						}
					}
					for(MemoryChipInf memoryChip : userAssemble.getMemoryChip()) {
						if (JudgeAssembleTools.judgeMemorychip(userAssemble.getMainboard(), memoryChip)) {
							out.print("<script>alert('内存条:"+memoryChip.getmName()+"与主板接口不匹配'"+memoryChip.getBf()+" "+ userAssemble.getMainboard().getRamSlot()+");location.href='../BuildPc/pages/myAssemble.jsp'</script>");
						}
					}
					if(null != userAssemble.getMechanics()) {
						for(MechanicsInf mechanics : userAssemble.getMechanics()) {
							if (JudgeAssembleTools.judgeMechanicsInf(userAssemble.getMainboard(), mechanics)) {
								out.print("<script>alert('机械硬盘:"+mechanics.getMecName()+"与主板插槽不匹配'"+mechanics.getInterface()+");location.href='../BuildPc/pages/myAssemble.jsp'</script>");
							}
						}
					}
					if(null != userAssemble.getSsd()) {
						for(SSDInf ssd : userAssemble.getSsd()){
							if(JudgeAssembleTools.judgeSSD(userAssemble.getMainboard() , ssd)) {
								out.print("<script>alert('固态硬盘:"+ssd.getSsdName()+"与主板插槽不匹配'"+ssd.getInterface()+");location.href='../BuildPc/pages/myAssemble.jsp'</script>");	
							}
						}
					}					
				}
			}
		}
		out.print("<script>alert('开始支付');location.href='../BuildPc/pages/pay.jsp'</script>");	
	}

}
