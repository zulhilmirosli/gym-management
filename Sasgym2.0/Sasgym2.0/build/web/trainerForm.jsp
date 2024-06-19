<%-- 
    Document   : trainerForm
    Created on : 8 Jun 2023, 11:37:19 am
    Author     : Muhammad Ariq Iskandar S62678
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
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
                            <a href="<%=request.getContextPath()%>/list1" class="nav__link">Staff List</a>
                        </li>
                        </div>
                    </ul>
                </div>
            </nav>
        </header>
                        <br><br><br><br><br>
        <div class="container col-md-5">
            <div class="card">
                <div class="card-body">
                    <c:if test="${trainer!=null}">
                        <form action="update" method="post">
                        </c:if>
                        <c:if test="${trainer==null}">
                            <form action="insert" method="post">
                            </c:if>

                            <h2 class="TitleForm">
                                <c:if test="${trainer!=null}">
                                <br>    Edit Trainer <br><br>
                                </c:if>
                                <c:if test="${trainer==null}">                
                                <br>    Add New Trainer <br><br>
                                </c:if>
                            </h2>

                            <c:if test="${trainer!=null}">
                                <input type="hidden" name="id" value="<c:out value='${trainer.id}'/>"/>
                            </c:if>

                            
                                <label>Trainer Name</label>
                                <input type="text" value="<c:out value='${trainer.name}'/>" class="form-control" name="name" required="required"><br>
                            
                            
                             
                                <label>Trainer Phone Number</label>
                                <input type="text" value="<c:out value='${trainer.phone}'/>" class="form-control" name="phone"><br>
                            

                            
                                <label>Trainer E-mail</label>
                                <input type="email" value="<c:out value='${trainer.email}'/>" class="form-control" name="email"><br>
                            
                            
                            
                                <label>Trainer Course</label>
                                <input type="text" value="<c:out value='${trainer.course}'/>" class="form-control" name="course"><br>
                            

                           
                                <label>Trainer Shift</label>
                                <input list="shiftList" value="<c:out value='${trainer.shift}'/>" id="shift" class="form-control" name="shift"><br>
                                <datalist id="shiftList">
                                    <option value="10.00am-12.00pm">
                                    <option value="01.30pm-03.30pm">
                                    <option value="03.30pm-05.30pm">
                                    <option value="05.30pm-07.30pm">
                                    <option value="08.30pm-10.30pm">    
                                </datalist>
                             <br><br>

                            <button type="submit" class="button button__sub">Save</button>  <br><br>
                        </form>
                </div>
            </div>
        </div>
                        <div class="choose__images"> 
                            <img src="assets/img/choose-img.png" alt="choose image" class="choose__img">

                            <!-- <div class="choose__triangle choose__triangle-1"></div> 
                            <div class="choose__triangle choose__triangle-2"></div> 
                            <div class="choose__triangle choose__triangle-3"></div> -->
                        </div>
    </body>
</html>