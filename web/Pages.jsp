<%-- 
    Document   : Pages
    Created on : 8 Mar, 2024, 9:55:33 AM
    Author     : DARSHAN
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
            int roleName = (Integer) session.getAttribute("role_name_session");
            String role_s = null;
            if(roleName == 1){
                role_s = "Admin";
            }
            if(roleName == 2){
                role_s = "User";
            }
            if(roleName == 3){
                role_s = "Guest";
            }
            out.println("<html><body>");
            out.println("<h1 align=center>Welcome to Login page of "+role_s+"</h1><table border=1 align=center style=\"border:2px solid black;height:50%;width:50%;font-size: 20px;text-align: center;\"><tr><td>Role</td><td>"+role_s+"</td></tr><tr><td>Email</td><td>"+session.getAttribute("eamil_session")+"</td></tr>");
//            out.println(session.getAttribute("SessionName"));
            
        %>
<!--        <h1><%= session.getAttribute("role_name_session") %></h1>-->
    </body>
</html>
