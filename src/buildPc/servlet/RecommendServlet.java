package buildPc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import buildPc.inf.GraphicsInf;
import buildPc.inf.MechanicsInf;
import buildPc.inf.MemoryChipInf;
import buildPc.inf.SSDInf;
import buildPc.inf.UserAssemble;
import buildPc.inf.UserInf;
import buildPc.util.DB;
import buildPc.util.RecommendTools;

/**
 * Servlet implementation class RecommendServlet
 */
@WebServlet("/RecommendServlet")
public class RecommendServlet extends HttpServlet {
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
		UserInf user = new UserInf();
		Cookie cookie[] = request.getCookies();
		int userInf = 0;
		boolean flag = false;
		for(Cookie i : cookie){
			if(i.getName().equals("userInf")){
				userInf = Integer.parseInt(i.getValue());
				ResultSet rSet;
				try {
					rSet = DB.executeQuery("SELECT * FROM user_inf WHERE uId = "+userInf+"");
					if(rSet.next()){
						flag = true;
					}
				} catch (Exception e) {
					// TODO 自动生成的 catch 块
					e.printStackTrace();
				}
				break;
			}
		}
		if(!flag){
			out.print("<script>alert('你还没有登录');location.href='../BuildPc/pages/login.jsp'</script>");
		}else {
			UserAssemble userAssemble = new UserAssemble();
			userAssemble.setId(userInf);
			int rflag = Integer.parseInt(request.getParameter("recommendway"));
			userAssemble.setMainboard(RecommendTools.recMainboard(rflag));
			
			userAssemble.setCpu(RecommendTools.recCpu(userAssemble.getMainboard(), rflag));
			
			userAssemble.setRadiator(RecommendTools.recRadiator(rflag));
			
			List<GraphicsInf> graphicsInfs = new ArrayList();
			graphicsInfs.add(RecommendTools.recGraphics(userAssemble.getMainboard(), rflag));
			userAssemble.setGraphics(graphicsInfs);
			
			List<MechanicsInf> mechanicsInfs = new ArrayList();
			mechanicsInfs.add(RecommendTools.recMechanics(userAssemble.getMainboard(), rflag));
			userAssemble.setMechanics(mechanicsInfs);
			
			List<MemoryChipInf> memoryChipInfs = new ArrayList();
			memoryChipInfs.add(RecommendTools.recMemorychip(userAssemble.getMainboard(), rflag));
			userAssemble.setMemoryChip(memoryChipInfs);
			
			if (rflag != 1) {
				List<SSDInf> ssdInfs = new ArrayList();
				ssdInfs.add(RecommendTools.recSSD(userAssemble.getMainboard(), rflag));
				userAssemble.setSsd(ssdInfs);
			}
			HttpSession session = request.getSession();
			session.setAttribute("assemble", userAssemble);
			out.print("<script>alert('推荐成功');location.href='../BuildPc/pages/myAssemble.jsp'</script>");
		}
		out.print("<script>alert('推荐败亡');location.href='../BuildPc/pages/recommend.jsp'</script>");
	}

}
