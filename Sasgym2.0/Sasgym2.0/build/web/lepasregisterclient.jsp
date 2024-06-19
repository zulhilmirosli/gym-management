<%-- 
    Document   : lepasregisterclient
    Created on : 17 Jun 2023, 5:29:30 pm
    Author     : Muhammad Zulhilmi Bin Rosli S61807 
--%>
<%@page import="com.Model.User"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!--=============== FAVICON ===============-->
        <link rel="shortcut icon" href="assets/img/logo.png" type="image/x-icon">

        <!--=============== REMIXICON ===============-->
        <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">

        <!--=============== CSS ===============-->
        <link rel="stylesheet" href="assets/css/StaffHome.css">

        <title>Gym Membership - Web Group Gym</title>
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
        <div id="body1" style="background-color:black;">
            <!--==================== HEADER ====================-->
            <header class="header" id="header">
                <nav class="nav container">
                    <a href="#" class="nav__logo">
                        <img src="assets/img/logo.png" alt="logo"> Web Group Gym
                    </a>
                    <div class="nav__menu" id="nav-menu">
                        <ul class="nav__list">
                            <li class="nav__item">
                                <a href="BukaSini.jsp" class="nav__link">Home</a>
                            </li>
                            <li class="button nav__button" style="color:red;">
                                <%= username%> <br>Your ID: <%= id%>
                            </li>
                        </ul>
                    </div>

                    <div class="nav__close" id="nav-close">
                        <i class="ri-close-line"></i>
                    </div>

                    <!<!-- Toggle Button -->
                    <div class="nav__toggle" id="nav-toggle">
                        <i class="ri-menu-line"></i>
                    </div>
                </nav>
            </header>    

            <!--==================== MAIN ====================-->
            <main class="main">
                <!--==================== HOME ====================-->

                <!--==================== PROGRAM ====================-->
                <section class="program section" id="program">
                    <div class="container">
                        <div class="section__data">
                            <h2 class="section_welcome">Welcome <%= username%> to</h2>
                            <h2 class="section_welcome">SAS GYM</h2>
                        </div>
                        <div class="program__container grid">
                            <article class="program__card">
                                <div class="program__shape">
                                    <img src="assets/img/program1.png" alt="program image" class="program__img">
                                    <h3 class="program__title">Subscribe Package</h3>

                                    <p class="program__description">
                                        Subscribe Your Package
                                    </p>
                                    <a href="<%=request.getContextPath()%>/new3" class="program__button">
                                        <i class="ri-arrow-right-line"></i>
                                    </a>
                                </div>
                            </article>

                            <article class="program__card">
                                <div class="program__shape">
                                    <img src="assets/img/program2.png" alt="program image" class="program__img">
                                    <h3 class="program__title">Edit Subscription</h3>

                                    <p class="program__description">
                                        Edit Your Subscription
                                    </p>
                                    <a href="<%=request.getContextPath()%>/listSubs?id=<%= id%>" class="program__button">
                                        <i class="ri-arrow-right-line"></i>
                                    </a>

                                </div>
                            </article>
                        </div>
                    </div>
                </section>
                <!--==================== LOGOS ====================-->

                <!--==================== CHOOSE US ====================-->
            </main>

            <div class="choose__images"> 
                <img src="assets/img/choose-img.png" alt="choose image" class="choose__img">

                <!-- <div class="choose__triangle choose__triangle-1"></div> 
                <div class="choose__triangle choose__triangle-2"></div> 
                <div class="choose__triangle choose__triangle-3"></div> -->
            </div>


            <!--==================== FOOTER ====================-->


            <!--========== SCROLL UP ==========-->


            <!--=============== SCROLLREVEAL ===============-->
            <script src=""></script>

            <!--=============== EMAIL JS ===============-->


            <!--=============== MAIN JS ===============-->
            <script src="assets/js/main.js"></script>
            <script>
                function setSession() {
                    sessionStorage.setItem("username", "<%= username%>");
                }
            </script>
        </div> </body>
</html>






