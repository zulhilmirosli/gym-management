<%-- 
    Document   : register
    Created on : 10 Jun 2023, 11:51:51 am
    Author     : TUF GAMING
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    <body>
        <jsp:useBean id="objRegister" class="jb.register" scope="request"/>
        <%
            objRegister.setName(request.getParameter("name"));
            objRegister.setAge(Integer.parseInt(request.getParameter("age")));
            objRegister.setPhoneNo(request.getParameter("phoneNo"));
            objRegister.setGender(request.getParameter("gender"));
            objRegister.setUsername(request.getParameter("username"));
            objRegister.setPassword_(request.getParameter("password"));

            // Database connection details
            String url = "jdbc:mysql://localhost:3306/sasgym";
            String username = "root";
            String password = "admin";

            Connection conn = null;
            // Register JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Open a connection
            conn = DriverManager.getConnection(url, username, password);

            // Perform database operations here
            String sql = "INSERT INTO users (name, age, phoneNo, gender, username, password) VALUES (?, ?, ?, ?, ?, ?)";
            int result;
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, objRegister.getName());
            statement.setInt(2, objRegister.getAge());
            statement.setString(3, objRegister.getPhoneNo());
            statement.setString(4, objRegister.getGender());
            statement.setString(5, objRegister.getUsername());
            statement.setString(6, objRegister.getPassword_());
            result = statement.executeUpdate();
            if (result > 0) {
            
                response.sendRedirect("registerMessage.jsp");
                statement.close();
            }
            conn.close();
        %>
    </body>
</html>
