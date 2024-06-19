<%-- 
    Document   : clientsubsList
    Created on : 11 Jun 2023, 3:25:50 pm
    Author     : Muhammad Zulhilmi Bin Rosli S61807 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gym Management Application</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    </head>
    <body>
        <header>
            <nav class="navbar navbar-expand-md navbar-dark" style="background-color:#BAB86C">
                <div>
                    <a href="" class="navbar-brand">Gym Management App </a>
                </div>

                <ul class="navbar-nav">
                    <li><a href="<%=request.getContextPath()%>/list" class="nav-link">Gym</a></li>
                </ul>
            </nav>
        </header>
        <br>
        <div class="row">
            <div class="container">
                <h3 class="text-center">List of Client Subscription</h3>
                <hr>
                <div class="container text-left">
                    <!-- <a href="<%=request.getContextPath()%>/new3" class="btn btn-success">Add New Subscription</a> -->
                    <a href="lepasregisterclient.jsp" class="btn btn-success">Back</a>
                </div>
                <br>
                <table class="table table-bordered">
                    <thead> 
                        <tr>
                            <th>Subscription No</th>
                            <th>User Id</th>
                            <th>Package ID</th>
                            <th>Package Description</th>
                            <th>Booking Date</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="clientsubs" items="${listClientsubs}">
                            <tr>
                                <td>
                                    <c:out value="${clientsubs.subsNo}"/>                                       
                                </td>
                                <td>
                                    <c:out value="${clientsubs.id}"/>                                       
                                </td>
                                <td>
                                    <c:out value="${clientsubs.packageID}"/>                                       
                                </td>
                                <td>
                                    <c:out value="${clientsubs.packageDesc}"/>                                       
                                </td>
                                <td>
                                    <c:out value="${clientsubs.bookingDate}"/>                                       
                                </td>
                                

                                <td><a href="edit3?subsNo=<c:out value='${clientsubs.subsNo}'/>">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="delete3?subsNo=<c:out value='${clientsubs.subsNo}'/>">Delete</a> &nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="payment?subsNo=<c:out value='${clientsubs.subsNo}'/>">Go to Payment</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
