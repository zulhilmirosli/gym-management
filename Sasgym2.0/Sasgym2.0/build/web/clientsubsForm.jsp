<%-- 
    Document   : clientsubsForm
    Created on : 11 Jun 2023, 3:25:40 pm
    Author     : Muhammad Zulhilmi Bin Rosli S61807 
--%>

<%@page import="com.Model.User"%>
<%@page import="java.sql.*"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gym Management Application</title>
        <link rel="stylesheet" href="assets/css/subsForm.css">
    </head>
    <body>
        <%
            String username = (String) session.getAttribute("username");
            String id = ""; // Initialize id variable

            // Database connection code
            try {
                // Establish database connection and execute query
                Class.forName("com.mysql.jdbc.Driver");
                String myURL = "jdbc:mysql://localhost/sasgym";
                Connection myConnection = DriverManager.getConnection(myURL, "root", "admin");

                PreparedStatement statement = myConnection.prepareStatement("SELECT id FROM users WHERE username = ?");
                statement.setString(1, username);
                ResultSet resultSet = statement.executeQuery();

                // Check if a matching user record exists
                if (resultSet.next()) {
                    id = resultSet.getString("id"); // Get the id value from the result set
                }

                // Close database resources
                resultSet.close();
                statement.close();
                myConnection.close();
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            }
        %>

        <header class="header" id="header">
            <nav class="nav container">
                <a href="#" class="nav__logo">
                    <img src="assets/img/logo.png" alt="logo"> SAS Gym
                </a>
                <div class="nav__menu" id="nav-menu">
                    <ul class="nav__list">
                        <li class="nav__item">
                            <a href="BukaSini.jsp" class="nav__link">Home</a>
                        </li>
                        <li class="nav__item">
                            <a href="<%=request.getContextPath()%>/listHome" class="nav__link">Trainer List</a>
                        </li>
                        <li class="button nav__button" style="color:red;">
                            <%= username%>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <br><br><br><br><br>
        <div class="container col-md-5">
            <div class="card">
                <div class="card-body">
                    <c:if test="${clientsubs!=null}">
                        <form action="update3?id=<%= id %>" method="post">
                        </c:if>
                        <c:if test="${clientsubs==null}">
                            <form action="insert3" method="post">
                            </c:if>

                            <h2 class="TitleForm">
                                <c:if test="${clientsubs!=null}">
                                    Edit Your Subscription
                                </c:if>
                                <c:if test="${clientsubs==null}">                
                                    Add New Subscription
                                </c:if>
                            </h2>

                            <c:if test="${clientsubs!=null}">
                                <input type="hidden" name="subsNo" value="<c:out value='${clientsubs.subsNo}'/>"/>
                            </c:if>

                            <c:if test="${clientsubs!=null}">

                                <label>User Id</label>
                                <input type="text" value="<c:out value='${clientsubs.id}' />" class="form-control" name="id" readonly/>

                            </c:if>

                            <c:if test="${clientsubs==null}">

                                <label>User Id</label>
                                <input type="text" value="<%= id%>" class="form-control" name="id" readonly="">

                            </c:if>


                            <label>Package Description</label>
                            <select name="packageDesc" id="packageDesc" onchange="getPackageID(this)" class="form-control">
                                <c:forEach items="${listDropDown}" var="packageDesc">
                                    <option per="${packageDesc.packageID}" value="${packageDesc.packageDesc}">
                                        ${packageDesc.packageDesc}
                                    </option>
                                </c:forEach>
                            </select>


                            <script>
                                selectElement('packageDesc', '<c:out value='${clientsubs.packageDesc}'/>');

                                function selectElement(id, valueToSelect) {
                                    let element = document.getElementById(id);
                                    element.value = valueToSelect;
                                }
                                function getPackageID(select) {
                                    var form = select.form;
                                    form.packageID.value = select.options[select.selectedIndex].getAttribute('per');
                                }
                            </script>


                            <label>Package ID</label>
                            <input type="text" name="packageID" id="packageID" class="form-control" value="<c:out value='${clientsubs.packageID}'/>" readonly/>



                            <label>Booking Date</label>
                            <input type="date" value="<c:out value='${clientsubs.bookingDate}'/>" class="form-control" name="bookingDate" required>


                            <button type="submit" class="button button__sub">Save</button>  <br><br>
                        </form>
                </div>
            </div>
        </div>
    </body>
</html>
