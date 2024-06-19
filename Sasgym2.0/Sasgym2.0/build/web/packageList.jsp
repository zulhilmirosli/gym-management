<%-- 
    Document   : packageList
    Created on : 5 Jul 2023, 6:15:12 pm
    Author     : Muhammad Zulhilmi Bin Rosli S61807 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--=============== FAVICON ===============-->
        <link rel="shortcut icon" href="assets/img/logo.png" type="image/x-icon">

        <!--=============== REMIXICON ===============-->
        <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">

        <!--=============== CSS ===============-->
        <link rel="stylesheet" href="assets/css/StaffHub.css">



        <title>User Management Application</title>

    </head>
    <body>
        <!--==================== HEADER ====================-->
        <header class="header" id="header">
            <nav class="nav container">
                <a href="#" class="nav__logo">
                    <img src="assets/img/logo.png" alt="logo"> Web Group Gym
                </a>
                <div class="nav__menu" id="nav-menu">
                    <ul class="nav__list">
                        <li class="nav__item">
                            <a href="staffHub.jsp" class="nav__link">Staff Hub</a>
                        </li>
                        <li class="nav__item">
                            <a href="<%=request.getContextPath()%>/listpack" class="nav__link">Package List</a>
                        </li>
                    </ul>
                </div>

            </nav>
        </header>

        <section class="home section" id="home">
            <div class="home__container container grid">
                <div class="home__data">
                    <h2 class="home__title">List of Package</h2>
                    <p class="home__description">
                        List of All Package of SASGYM
                    </p>
                    <a href="<%=request.getContextPath()%>/newpack" class="button button__flex">
                        Add New Package <i class="ri-arrow-right-line"></i>
                    </a>
                </div>
            </div>

        </section>   

        <br>
        <div class="container">
            <hr>
            <br><br>
            <table id="customers">
                <thead> 
                    <tr>
                        <th>Package ID</th>
                        <th>Package Description</th>
                        <th>Package Price</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="pack" items="${listPack}">
                        <tr>
                            <td>
                                <c:out value="${pack.packageID}"/>                                       
                            </td>
                            <td>
                                <c:out value="${pack.packageDesc}"/>                                       
                            </td>
                            <td>
                                <c:out value="${pack.price}"/>                                       
                            </td>

                            <td><a href="editpack?packageID=<c:out value='${pack.packageID}'/>">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="deletepack?packageID=<c:out value='${pack.packageID}'/>">Delete</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <br><br><br>  
    </body>
</html>

