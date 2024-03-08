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
            out.println("<html><body><h1 align=center>Welcome to Login page of "+" d "+"</h1><table border=1 align=center style=\"border:2px solid black;height:50%;width:50%;font-size: 20px;text-align: center;\"><tr><td>Role</td><td>"+" a "+"</td></tr><tr><td>Email</td><td>"+" r "+"</td></tr>");
//            out.println(session.getAttribute("SessionName"));
            String value = (String) session.getAttribute("SessionName");
        
            // Use the value as needed
            out.println("Value from FirstPage: " + value);
        %>
        <h1><%= session.getAttribute("SessionName") %></h1>
    </body>
</html>
