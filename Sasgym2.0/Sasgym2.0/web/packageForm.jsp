<%-- 
    Document   : packageForm
    Created on : 5 Jul 2023, 6:15:01 pm
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
                            <a href="<%=request.getContextPath()%>/listpack" class="nav__link">Package List</a>
                        </li>

                    </ul>
                </div>
            </nav>
        </header>
        <br><br><br><br><br>
        <div class="container col-md-5">
            <div class="card">
                <div class="card-body">
                    <c:if test="${pack!=null}">
                        <form action="updatepack" method="post">
                        </c:if>
                        <c:if test="${pack==null}">
                            <form action="insertpack" method="post">
                            </c:if>

                            <h2 class="TitleForm">
                                <c:if test="${pack!=null}">
                                    Edit Package
                                </c:if>
                                <c:if test="${pack==null}">                
                                    Add New Package
                                </c:if>
                            </h2>


                            <label>Package ID</label>
                            <input type="text" name="packageID" value="<c:out value='${pack.packageID}'/>"class="form-control" />

                            <label>Package Description</label>
                            <input type="text" value="<c:out value='${pack.packageDesc}' />" class="form-control" name="packageDesc" />

                            <label>Package Price</label>
                            <input type="text" name="price" id="price" class="form-control" value="<c:out value='${pack.price}'/>" required/>

                            <button type="submit" class="button button__sub">Save</button>  <br><br>
                        </form>
                </div>
            </div>
        </div>
    </body>
</html>

