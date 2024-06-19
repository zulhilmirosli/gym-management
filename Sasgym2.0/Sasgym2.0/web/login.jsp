<%-- 
    Document   : login
    Created on : 10 Jun 2023, 2:14:19 am
    Author     : TUF GAMING
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page language="java"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login JSP</title>
        <script>
            function showError(message) {
                alert(message); // Display an alert pop-up with the error message
                location.replace("http://localhost:8080/Sasgym2.0/login.html");
            }
        </script>
    </head>
    <body>
        <jsp:useBean id="objLogin" class="jb.login" scope="request"/>
        <jsp:setProperty name="objLogin" property="*"/>
        <%
            // Database connection details
            String jdbcURL = "jdbc:mysql://localhost/sasgym";
            String dbUser = "root";
            String dbPassword = "admin";

            objLogin.setUsername(request.getParameter("username"));
            objLogin.setPassword(request.getParameter("password"));

            // Database connection and query
            Connection connection = null;
            PreparedStatement statement = null;
            ResultSet result = null;

            //try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            // Perform database query
            String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, objLogin.getUsername());
            statement.setString(2, objLogin.getPassword());
            result = statement.executeQuery();

            if (result.next()) {
                out.println("Betul");
                session.setAttribute("username", objLogin.getUsername());
                response.sendRedirect("lepasregisterclient.jsp");

            } else {
                String errorMessage = "Invalid username or password";
                out.println("<script>showError('" + errorMessage + "');</script>");

            }
            result.close();
            statement.close();
            connection.close();
        %>
    </body>
</html>
