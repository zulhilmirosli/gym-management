<%-- 
    Document   : staffLogin
    Created on : 16 Jun 2023, 10:15:38 pm
    Author     : Asus
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="objLogin" class="jb.login" scope="request"/>
        <jsp:setProperty name="objLogin" property="*"/>
        <%
            objLogin.setUsername(request.getParameter("username"));
            objLogin.setPassword(request.getParameter("password"));

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/sasgym", "root", "admin");

                // Perform database query
                String sql = "SELECT * FROM staff WHERE username = ? AND password = ?";
                PreparedStatement statement = connection.prepareStatement(sql);
                statement.setString(1, objLogin.getUsername());
                statement.setString(2, objLogin.getPassword());
                ResultSet result = statement.executeQuery();

                if (result.next()) {
                    out.println("Betul");
                    session.setAttribute("username", objLogin.getUsername());
                    response.sendRedirect("staffHub.jsp");

                } else {
                    out.println("Salah");
                    String errorMessage = "Invalid username or password";
                    out.println("<script>showError('" + errorMessage + "');</script>");
                    out.println("<script>window.open('BukaSini.jsp');</script>");

                }
                result.close();
                statement.close();
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        %>
    </body>
</html>
