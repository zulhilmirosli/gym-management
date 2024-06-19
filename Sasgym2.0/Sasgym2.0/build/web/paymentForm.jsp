<%-- 
    Document   : paymentPage
    Created on : 16 Jun 2023, 8:15:36 pm
    Author     : Muhammad Ariq Iskandar S62678
--%>

<%@page import="com.Model.Clientsubs"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/paymentPage.css">
        <title>Payment Form</title>
    </head>
    
    <body style="background-color: wheat">
        <c:set var="id" value="${payment.id}" />
        <c:set var="packageID" value="${payment.packageID}" />
        <%
            // Database connection details
            String jdbcURL = "jdbc:mysql://localhost/sasgym";
            String dbUser = "root";
            String dbPassword = "admin";

            // Database connection and query
            Connection connection = null;
            PreparedStatement statement = null;
            ResultSet result = null;

            //try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            //Clientsubs clientSubs = new Clientsubs();
            int id = (int) pageContext.getAttribute("id");
            String packageID = (String) pageContext.getAttribute("packageID");

            // Perform database query
            String sql = "select subsNo, client_subs.id, users.name, package.packageID, price from client_subs, package,users where "
                    + "client_subs.packageID=package.packageID and client_subs.id=? and client_subs.packageID=? and client_subs.id = users.id;";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.setString(2, packageID);
            result = statement.executeQuery();
            int price = 0,subsID = 0;
            String name = null;
            if (result.next()) {
                price = result.getInt("price");
                name = result.getString("name");
                subsID = result.getInt("subsNo");                
            }
            result.close();
            statement.close();
            connection.close();
        %>
        <div class="container p-0">
            <div class="card px-4">
                <p class="h8 py-3">Payment Details</p>
                <div class="row gx-3" >
                    <form action="updatePayment" method="post">
                        <div class="col-12">
                            <br>
                            <div class="d-flex flex-column">
                                <p class="text mb-1">Subscription ID</p>
                                <input class="form-control mb-3" type="text" name="subsID" value="<%=subsID%>" style="width:400px;">
                            </div>
                        </div>
                        <div class="col-12">
                            <br>
                            <div class="d-flex flex-column">
                                <p class="text mb-1">Full Name</p>
                                <input class="form-control mb-3" type="text" name="full_name" placeholder="Name" value="<%=name%>" style="width:400px;">
                            </div>
                        </div>
                        <div class="col-12">
                            <br>
                            <div class="d-flex flex-column">
                                <p class="text mb-1" >Card Number</p>
                                <input class="form-control mb-3" type="text" name="card_number" placeholder="1234 5678 435678" style="width:400px;" required="">
                            </div>
                        </div>
                        <div class="col-6">
                            <br>
                            <div class="d-flex flex-column">
                                <p class="text mb-1">Expiry</p>
                                <input class="form-control mb-3" type="text" name="expiry" placeholder="MM/YYYY" style="width:400px;" required>
                            </div>
                        </div>
                        <div class="col-6">
                            <br>
                            <div class="d-flex flex-column">
                                <p class="text mb-1">CVV/CVC</p>
                                <input class="form-control mb-3 pt-2 " type="password" name="cvv_cvc" placeholder="***" style="width:400px;" required>
                            </div>
                        </div>
                        <br>
                        <input type="hidden" name="amount" value="<%=price%>">
                        <div class="col-12">
                            <div class="btn btn-primary mb-3">
                                <span class="ps-3" ><input type="submit" value="Pay MYR <%=price%>"></span>
                                <span class="fas fa-arrow-right"></span>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
