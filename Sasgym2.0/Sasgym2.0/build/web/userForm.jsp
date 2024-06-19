<%-- 
    Document   : userForm
    Created on : 8 Jun 2023, 11:37:19 am
    Author     : Muhamad Syahmi S62602 
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
                            <a href="<%=request.getContextPath()%>/list2" class="nav__link">User List</a>
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
                    <c:if test="${user!=null}">
                        <form action="update2" method="post">
                        </c:if>
                        <c:if test="${user==null}">
                            <form action="insert2" method="post">
                            </c:if>

                            <h2 class="TitleForm">
                                <c:if test="${user!=null}">
                                  <br>  Edit User <br><br>
                                </c:if>
                                <c:if test="${user==null}">                
                                  <br>   Add New User <br><br>
                                </c:if>
                            </h2 >

                            <c:if test="${user!=null}">
                                <input type="hidden" name="id" value="<c:out value='${user.id}'/>"/>
                            </c:if>
                            
                            <c:if test="${user!=null}">    
                            
                                <label>Username</label>
                                <input type="text" value="<c:out value='${user.username}'/>" class="form-control" name="username" readonly/> <br>
                               
                             
                                <label>Password</label>
                                <input type="text" value="<c:out value='${user.password}'/>" class="form-control" name="password" readonly/> <br>
                            
                            </c:if>
                            <c:if test="${user==null}">    
                           
                                <label>Username</label>
                                <input type="text" value="<c:out value='${user.username}'/>" class="form-control" name="username" required="required"> <br>
                            
                                <label>Password</label>
                                <input type="text" value="<c:out value='${user.password}'/>" class="form-control" name="password" required="required"> <br>
                            
                            </c:if>    
                            
                                <label>Full Name</label>
                                <input type="text" value="<c:out value='${user.name}'/>" class="form-control" name="name" required="required"> <br>
                            

                            
                                <label>Age</label>
                                <input type="text" value="<c:out value='${user.age}'/>" class="form-control" name="age"> <br>
                            
                            
                            
                                <label>Gender</label>

                                <input list="genderList"  value="<c:out value='${user.gender}'/>" id="gender" class="form-control" name="gender"> <br>
                                <datalist id="genderList">
                                    <option value="Male">
                                    <option value="Female">
                                </datalist>
                           

                           
                                <label>Phone No</label>
                                <input type="text" value="<c:out value='${user.phoneNo}'/>" class="form-control" name="phoneNo"> <br><br>
                            

                            <button type="submit" class="button button__sub">Save</button> <br><br><br>
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