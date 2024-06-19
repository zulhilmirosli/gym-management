<%-- 
    Document   : userList
    Created on : 8 Jun 2023, 11:37:32 am
    Author     : Muhamad Syahmi S62602 
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
                            <a href="<%=request.getContextPath()%>/list2" class="nav__link">User List</a>
                        </li>
                        </div>
                    </ul>
                </div>
            </nav>
        </header>
        
        <section class="home section" id="home">
             <div class="home__container container grid">
                    <div class="home__data">
                        <h2 class="home__title">List of User</h2>
                        <p class="home__description">
                            List of registered user of SASGYM
                        </p>
                        <a href="<%=request.getContextPath()%>/new2" class="button button__flex">
                            Add New User <i class="ri-arrow-right-line"></i>
                        </a>
                    </div>
                  </div>
               
            </section>
         
                
        <br>
           
            <div class="container">
              
                <hr>
                <div class="container text-left">
                   
                  <br><br>
                  
                  <form action="search2" method="post" >
                  
                       <input type="text" value="<c:out value='${user.name}'/>" class="form-control1" name="name" required="required" placeholder="Enter name">             
                  
                  <br><br>  
                  
                       <input type="text" value="<c:out value='${user.age}'/>" class="form-control1" name="age" required="required" placeholder="Enter age">             
                  
                    <br><br>
                    <button type="submit" class="button button__sub">Filter</button>
                    </form>
                </div>
                
              
                <br><br>
             
                <table id="customers">
                    <thead> 
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Age</th>
                            <th>Gender</th>
                            <th>Phone No.</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" items="${listUser}">
                            <tr>
                                <td>
                                    <c:out value="${user.id}"/>                                       
                                </td>
                                <td>
                                    <c:out value="${user.name}"/>                                       
                                </td>
                                <td>
                                    <c:out value="${user.age}"/>                                       
                                </td>
                                <td>
                                    <c:out value="${user.gender}"/>                                       
                                </td>
                                <td>
                                    <c:out value="${user.phoneNo}"/>                                       
                                </td>
                                <td><a href="edit2?id=<c:out value='${user.id}'/>">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="delete2?id=<c:out value='${user.id}'/>">Delete</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
               
           </div> 
                 <br><br><br>      
                       
                       
          
    </body>
</html>
