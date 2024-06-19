<%-- 
    Document   : trainerList
    Created on : 8 Jun 2023, 11:37:32 am
    Author     : Muhammad Ariq Iskandar S62678
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
        <link rel="stylesheet" href="assets/css/StaffHome.css">
        
        
        
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
                            <a href="BukaSini.jsp" class="nav__link">Home</a>
                        </li>
                        <li class="nav__item">
                            <a href="<%=request.getContextPath()%>/listHome" class="nav__link">Trainer List</a>
                        </li>
                        </div>
                    </ul>
                </div>
            </nav>
        </header>
                        
         <section class="home section" id="home">
             <div class="home__container container grid">
                    <div class="home__data">
                        <h2 class="home__title">List of Trainer</h2>
                    
                    </div>
                  </div>
               
            </section>                 
                        
                        
        <br>
        
            <div class="container">
                
                <hr>
                <div class="container text-left">
                    
                <br><br>    

                    
                  <form action="searchHome" method="post">
                  
                       <input type="text" value="<c:out value='${trainer.course}'/>" class="form-control1" name="course" required="required" placeholder="Enter course">             
                  
                  <br><br>  
                  
                        <input list="shiftList" value="<c:out value='${trainer.shift}'/>" id="shift" class="form-control1" name="shift" required="required" placeholder="Enter shift">
                                <datalist id="shiftList">
                                    <option value="10.00am-12.00pm">
                                    <option value="01.30pm-03.30pm">
                                    <option value="03.30pm-05.30pm">
                                    <option value="05.30pm-07.30pm">
                                    <option value="08.30pm-10.30pm">    
                                </datalist>
                  
                    <br><br>
                    <button type="submit" class="button button__sub">Filter</button>
                    </form>
                </div>
                 <br> <br>
                <table id="customers">
                    <thead> 
                        <tr>
                            <th>Name</th>
                            <th>Phone Number</th>
                            <th>E-mail</th>
                            <th>Course</th>
                            <th>Available</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="trainer" items="${listTrainerHome}">
                            <tr>
                                <td>
                                    <c:out value="${trainer.name}"/>                                       
                                </td>
                                <td>
                                    <c:out value="${trainer.phone}"/>                                       
                                </td>
                                <td>
                                    <c:out value="${trainer.email}"/>                                       
                                </td>
                                <td>
                                    <c:out value="${trainer.course}"/>                                       
                                </td>
                                <td>
                                    <c:out value="${trainer.shift}"/>                                       
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
                <br><br><br>     
    </body>
</html>
