/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author st
 */
public class loginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        boolean c;
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String email = request.getParameter("email_id");
            String password = request.getParameter("password");
            int role = Integer.parseInt(request.getParameter("role"));
            
            ServletContext sc = getServletContext();
            String url = sc.getInitParameter("url");
            String username = sc.getInitParameter("username");
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection(url, username, "");
//                Statement st = conn.createStatement();
                // SQL query to insert user data
                String sql = "SELECT users.email_id,users.password,role_table.role FROM darshan_14.users,darshan_14.role_table where users.role = role_table.role and  users.email_id =' "+email+" 'and users.password='"+password+"' and role_table.role="+role+";";
//                ResultSet rs = st.executeQuery(sql);
                
                
                out.println("<html><body><h1 align=center>Registration Details of "+role+"</h1><table border=1 align=center style=\"border:2px solid black;height:50%;width:50%;font-size: 20px;text-align: center;\"><tr><td>Role</td><td>"+role+"</td></tr><tr><td>Email</td><td>"+email+"</td></tr>");
                
                    try (Statement st = conn.createStatement()) {
                        ResultSet rs = st.executeQuery(sql);
                        while (rs.next()) {
//                          String coffeeName = rs.getString("COF_NAME");
//                          int supplierID = rs.getInt("SUP_ID");
//                          float price = rs.getFloat("PRICE");
//                          int sales = rs.getInt("SALES");
//                          int total = rs.getInt("TOTAL");
                          out.print("<tr><td>Role</td><td>"+rs.getString("email_id")+"</td></tr>");
                        }
                    
                    }catch (Exception e) {
                        e.printStackTrace();
                    }
//                boolean rs = st.execute(sql);
//                if (rs) {
//                    out.println("<tr><td>Status</td><td>Successfull!</td><tr>");
//                    out.println("<tr><td>Status</td><td>"+rs+"</td><tr>");
//                } else {
//                    out.println("<tr><td>Status</td><td>Failed!</td><tr>");
//                }
                out.println("</table></body></html>");
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error processing request.");
            } catch (ClassNotFoundException cnfe){
                cnfe.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet loginServlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet loginServlet at " +   + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
