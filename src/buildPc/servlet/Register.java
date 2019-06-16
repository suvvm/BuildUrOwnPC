package buildPc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import buildPc.util.DB;
import buildPc.util.MD5;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	 /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        //TODO 处理表单提交数据
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        String rName = request.getParameter("rName");
        String pNum = request.getParameter("pNum");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        password = MD5.getMd5(password);
        String sql = "INSERT INTO user_inf(uName,uPNum,uEmail,uUserName,uPassword,isAdministrator) VALUE('"+rName+"', '"+pNum+"','"+email+"','"+username+"','"+password+"',0)";
        try {
//        	Connection connection = DB.getConnection();
            int result = DB.executeUpdate(sql);
            if (result > 0) {
//            	out.print("111");
                out.print("<script>alert('注册成功!');location.href='../BuildPc/pages/index.jsp'</script>");
            }else {
//            	out.print("222");
                out.print("<script>alert('注册败亡!');location.href='../BuildPc/pages/register.jsp'</script>");
            }
        }
        catch (Exception ex) {
            log(ex.getMessage());
            out.print("<script>alert('注册败亡');location.href='../BuildPc/pages/register.jsp'</script>");
//            out.print("<h1>失败</h1>");
        }
//        out.print("444");
        
    }
        
        

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
