<%-- 
    Document   : staffHub
    Created on : 17 Jun 2023, 08:30:23 am
    Author     : Muhamad Syahmi Yaacob S62602
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!--=============== FAVICON ===============-->
        <link rel="shortcut icon" href="assets/img/logo.png" type="image/x-icon">

        <!--=============== REMIXICON ===============-->
        <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">

        <!--=============== CSS ===============-->
        <link rel="stylesheet" href="assets/css/StaffHub.css">

        <title>Gym Membership - Web Group Gym</title>
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

                </div>
                </ul>
                <div class="nav__close" id="nav-close">
                    <i class="ri-close-line"></i>
                </div>
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
                        <h2 class="section__subtitle">Staff Management Hub</h2>
                        <div class="section__title">
                            <h1 class="section__title-border">SASGYM FOR STAFF</h1>
                        </div>
                    </div>
                    <div class="program__container grid">
                        <article class="program__card">
                            <div class="program__shape">
                                <img src="assets/img/program1.png" alt="program image" class="program__img">
                                <h3 class="program__title">Trainer Hub</h3>

                                <p class="program__description">
                                    Manage Gym Trainer
                                </p>
                                <a href="<%=request.getContextPath()%>/list1" class="program__button">
                                    <i class="ri-arrow-right-line"></i>
                                </a>
                            </div>
                        </article>

                        <article class="program__card">
                            <div class="program__shape">
                                <img src="assets/img/program2.png" alt="program image" class="program__img">
                                <h3 class="program__title">User Hub</h3>

                                <p class="program__description">
                                    Manage User
                                </p>
                                <a href="<%=request.getContextPath()%>/list2" class="program__button">
                                    <i class="ri-arrow-right-line"></i>
                                </a>
                            </div>
                        </article>
                        <article class="program__card">
                            <div class="program__shape">
                                <img src="assets/img/program3.png" alt="program image" class="program__img">
                                <h3 class="program__title">Package Hub</h3>

                                <p class="program__description">
                                    Manage Package
                                </p>
                                <a href="<%=request.getContextPath()%>/listpack" class="program__button">
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
    </body>
</html>
