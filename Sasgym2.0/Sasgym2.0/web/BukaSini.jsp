<%-- 
    Document   : headerPage
    Created on : 9 Jun 2023, 11:30:23 pm
    Author     : Muhammad Zulhilmi Bin Rosli S61807 
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
        <link rel="stylesheet" href="assets/css/home.css">

        <style>
      #loading, #results {
        display: none;
    
      }
      #loading {
        width: 100%;
      }
    </style>

        
        <title>Gym Membership - Web Group Gym</title>
        
        <script>
            function calculateBMI() {
                var weight = document.getElementById("weight1").value;
                var height = (document.getElementById("height1").value) / 100;

                var bmi = weight / (height * height);

                document.getElementById("result").value = bmi.toFixed(2);

                // Classify the BMI
                var classification = "";
                if (bmi < 18.5) {
                    classification = "Underweight";
                } else if (bmi >= 18.5 && bmi < 25) {
                    classification = "Normal weight";
                } else if (bmi >= 25 && bmi < 30) {
                    classification = "Overweight";
                } else {
                    classification = "Obese";
                }

                document.getElementById("classification").value = classification;
            }
        </script>   
        
    </head>
    <body>
        <!--==================== HEADER ====================-->
        <header class="header" id="header">
            <nav class="nav container">
                <a href="#" class="nav__logo">
                    <img src="assets/img/logo.png" alt="logo"> SAS Gym
                </a>
                <div class="nav__menu" id="nav-menu">
                    <ul class="nav__list">
                        <li class="nav__item">
                            <a href="#home" class="nav__link">Home</a>
                        </li>
                        <li class="nav__item">
                            <a href="#program" class="nav__link">Program</a>
                        </li>
                        <li class="nav__item">
                            <a href="#choose" class="nav__link">Choose Us</a>
                        </li>
                        <li class="nav__item">
                            <a href="#pricing" class="nav__link">Package</a>
                        </li>
                         <li class="nav__item">
                            <a href="<%=request.getContextPath()%>/listHome" class="nav__link">Trainer</a>
                        </li>

                        <div class="nav__link">
                            <a href="login.html" class="button nav__button">
                                Sign In
                            </a>
                            <a href="register.html" class="button nav__button">
                                Sign Up
                            </a>
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
            <section class="home section" id="home">
                <div class="home__container container grid">
                    <div class="home__data">
                        <h2 class="home__subtitle">MAKE YOUR</h2>
                        <h1 class="home__title">BODY SHAPE</h1>
                        <p class="home__description">
                            In here we will help you to shape and build your ideal 
                            body and live your life to the fullest.
                        </p>
                        <a href="login.html" class="button button__flex">
                            Get Started <i class="ri-arrow-right-line"></i>
                        </a>
                    </div>
                    <div class="home__images">
                        <img src="assets/img/home-img.png" alt="home image" class="home__img">

                    </div>
                </div>
            </section>

            <!--==================== LOGOS ====================-->
            <section class="logos section">
                <div class="logos__container container grid">
                    <img src="assets/img/logo1.png" alt="logo" class="logos__img">
                    <img src="assets/img/logo2.png" alt="logo" class="logos__img">
                    <img src="assets/img/logo3.png" alt="logo" class="logos__img">
                    <img src="assets/img/logo4.png" alt="logo" class="logos__img">
                </div>
            </section>

            <!--==================== PROGRAM ====================-->
            <section class="program section" id="program">
                <div class="container">
                    <div class="section__data">
                        <h2 class="section__subtitle">Our Program</h2>
                        <div class="section__title">
                            <h1 class="section__title-border">BUILD YOUR</h1>
                            <h1 class="section__title">BEST BODY</h1>
                        </div>
                    </div>
                    <div class="program__container grid">
                        <article class="program__card">
                            <div class="program__shape">
                                <img src="assets/img/program1.png" alt="program image" class="program__img">
                                <h3 class="program__title">Flex Muscle</h3>

                                <p class="program__description">
                                    Creating tension that's temporarily making the muscle 
                                    fibers smaller or contracted.
                                </p>
                                <a href="#" class="program__button">
                                    <i class="ri-arrow-right-line"></i>
                                </a>
                            </div>
                        </article>

                        <article class="program__card">
                            <div class="program__shape">
                                <img src="assets/img/program2.png" alt="program image" class="program__img">
                                <h3 class="program__title">Cardio Exercise</h3>

                                <p class="program__description">
                                    Exercise your heart rate up and keeps it 
                                    up for a prolonged period of time.
                                </p>
                                <a href="#" class="program__button">
                                    <i class="ri-arrow-right-line"></i>
                                </a>
                            </div>
                        </article>

                        <article class="program__card">
                            <div class="program__shape">
                                <img src="assets/img/program3.png" alt="program image" class="program__img">
                                <h3 class="program__title">Basic Yoga</h3>

                                <p class="program__description">
                                    Diaphragmatic this is the most common breathing 
                                    technique you'll find in yoga.
                                </p>
                                <a href="#" class="program__button">
                                    <i class="ri-arrow-right-line"></i>
                                </a>
                            </div>
                        </article>

                        <article class="program__card">
                            <div class="program__shape">
                                <img src="assets/img/program4.png" alt="program image" class="program__img">
                                <h3 class="program__title">Weight Lifting</h3>

                                <p class="program__description">
                                    Attempts a maximum weight single lift of a 
                                    barbell loaded with weight plates.
                                </p>
                                <a href="#" class="program__button">
                                    <i class="ri-arrow-right-line"></i>
                                </a>
                            </div>
                        </article>
                    </div>
                </div>
            </section>

            <!--==================== CHOOSE US ====================-->
            <section class="choose section" id="choose">
                <div class="choose__bverflow">
                    <div class="choose__container container grid"> 
                        <div class="choose__content"> 
                            <div class="section__data">
                                <h2 class="section__subtitle">Best Reason</h2>
                                <div class="section__titles">
                                    <h1 class="section__title-border">WHY</h1>
                                    <h1 class="section__title">CHOOSE US?</h1>
                                </div>
                            </div>
                            <p class="choose__description">
                                Choose your favorite class and start now. Remember the only bad workout is 
                                the one you didn't do.
                            </p>

                            <div class="choose__data">
                                <div class="choose__group">
                                    <h3 class="choose__number">200+</h3>
                                    <p class="choose__subtitle">Total Members</p>
                                </div>
                                <div class="choose__group">
                                    <h3 class="choose__number">50+</h3>
                                    <p class="choose__subtitle">Best trainers</p>
                                </div>
                                <div class="choose__group">
                                    <h3 class="choose__number">25+</h3>
                                    <p class="choose__subtitle">Programs</p>
                                </div>
                                <div class="choose__group">
                                    <h3 class="choose__number">100+</h3>
                                    <p class="choose__subtitle">Awards</p>
                                </div>
                            </div>
                        </div>

                        <div class="choose__images"> 
                            <img src="assets/img/choose-img.png" alt="choose image" class="choose__img">

                            <!-- <div class="choose__triangle choose__triangle-1"></div> 
                            <div class="choose__triangle choose__triangle-2"></div> 
                            <div class="choose__triangle choose__triangle-3"></div> -->
                        </div>
                    </div>
                </div>
            </section>

            <!--==================== PRICING ====================-->
            <section class="pricing section" id="pricing">
                <div class="container">
                    <div class="section__data">
                        <h2 class="section__subtitle">Pricing</h2>
                        <div class="section__titles">
                            <h1 class="section__title-border">OUR</h1>
                            <h1 class="section__title">SPECIAL PLAN</h1>
                        </div>
                    </div>

                    <div class="program__container grid">
                        <article class="program__card">
                            <div class="program__shape">
                                <img src="assets/img/basic-package.png" alt="pricing image" class="pricing__img">
                                <h3 class="program__title">Basic Personal Training</h3>
                                <h3 class="pricing__number">MYR 100</h3>

                                <ul class="pricing__list">
                                    <li class="pricing__items">
                                        <i class="ri-checkbox-circle-line"></i>5 Days In A Week
                                    </li>
                                    <li class="pricing__items">
                                        <i class="ri-checkbox-circle-line"></i>01 Sweatshirt
                                    </li>
                                    <li class="pricing__items pricing__item-opacity">
                                        <i class="ri-checkbox-circle-line"></i>01 Bottle of Protein
                                    </li>
                                    <li class="pricing__items pricing__item-opacity">
                                        <i class="ri-checkbox-circle-line"></i>Access to Videos
                                    </li>
                                    <li class="pricing__items pricing__item-opacity">
                                        <i class="ri-checkbox-circle-line"></i>Muscle Stretching
                                    </li>
                                </ul>

                                <a href="showPackage.jsp#basic-package" class="button button__flex pricing__button">
                                    More Details<i class="ri-arrow-right-line"></i>
                                </a>
                            </div>
                        </article>

                        <article class="program__card">
                            <div class="program__shape">
                                <img src="assets/img/group-package.png" alt="pricing image" class="pricing__img">
                                <h3 class="program__title">Group Training</h3>
                                <h3 class="pricing__number">MYR 125</h3>

                                <ul class="pricing__list">
                                    <li class="pricing__items">
                                        <i class="ri-checkbox-circle-line"></i>5 Days In A Week
                                    </li>
                                    <li class="pricing__items">
                                        <i class="ri-checkbox-circle-line"></i>01 Sweatshirt
                                    </li>
                                    <li class="pricing__items pricing__item-opacity">
                                        <i class="ri-checkbox-circle-line"></i>01 Bottle of Protein
                                    </li>
                                    <li class="pricing__items pricing__item-opacity">
                                        <i class="ri-checkbox-circle-line"></i>Access to Videos
                                    </li>
                                    <li class="pricing__items pricing__item-opacity">
                                        <i class="ri-checkbox-circle-line"></i>Muscle Stretching
                                    </li>
                                </ul>

                                <a href="showPackage.jsp#group-package" class="button button__flex pricing__button">
                                    More Details<i class="ri-arrow-right-line"></i>
                                </a>
                            </div>
                        </article>

                        <article class="program__card">
                            <div class="program__shape">
                                <img src="assets/img/premium-package.png" alt="pricing image" class="pricing__img">
                                <h3 class="program__title">Premium VIP</h3>
                                <h3 class="pricing__number">MYR 175</h3>

                                <ul class="pricing__list">
                                    <li class="pricing__items">
                                        <i class="ri-checkbox-circle-line"></i>5 Days In A Week
                                    </li>
                                    <li class="pricing__items">
                                        <i class="ri-checkbox-circle-line"></i>01 Sweatshirt
                                    </li>
                                    <li class="pricing__items">
                                        <i class="ri-checkbox-circle-line"></i>01 Bottle of Protein
                                    </li>
                                    <li class="pricing__items ">
                                        <i class="ri-checkbox-circle-line"></i>Access to Videos
                                    </li>
                                    <li class="pricing__items">
                                        <i class="ri-checkbox-circle-line"></i>Muscle Stretching
                                    </li>
                                </ul>

                                <a href="showPackage.jsp#premium-package" class="button button__flex pricing__button">
                                    More Details<i class="ri-arrow-right-line"></i>
                                </a>
                            </div>
                        </article>
                    </div>
                </div>
            </section>

          <!--==================== CALCULATE ====================-->
            <section class="calculate section">
                <div class="calculate__container container grid">
                    <div class="calculate__content">
                        <div class="section__titles">
                            <h1 class="section__title-border">CALCULATE</h1>
                            <h1 class="section__title">YOUR BMI</h1>
                        </div>
                        <p class="calculate__description">
                            The body mass index (BMI) calculator calculates body mass index from your weight and height.
                        </p>

                        <form action="" class="calculate__form" id="calculate-form"> 
                            <div class="calculate__box">
                                <input type="text" id="weight1"  placeholder="Weight" class="calculate-kg"   required>
                                <label for="" class="calculate__label">kg</label>
                            </div>


                            <div class="calculate__box">
                                <input type="text" id="height1" placeholder="Height" class="calculate-kg"   required>
                                <label for="" class="calculate__label">cm</label>
                            </div>

                            <input type="button" value="Calculate BMI" onclick="calculateBMI()"> 

                            <div class="calculate__box">
                            </div>

                            <div class="calculate__box">
                                <input type="text" id="result" placeholder="bmi" class="calculate-kg" readonly>
                                <label for="" class="calculate__label">bmi</label>
                            </div>

                            <div class="calculate__box">                            
                                <input type="text" id="classification" placeholder="classification" class="calculate-kg" readonly>
                                <label for="" class="calculate__label">classification</label>
                            </div>

          

                        </form>
                        <p class="calculate__message" id="calculate-message"></p>
                    </div>
                    <img src="assets/img/calculate2.png" alt="calculate image" class="choose__img">

                    </section>
            
                       <!--==================== CALCULATE ====================-->
      <section class="calculate section">
                <div class="calculate__container container grid">
                    <div class="calculate__content">
                        <div class="section__titles">
                            <h1 class="section__title-border">CALCULATE</h1>
                            <h1 class="section__title">CALORIE</h1>
                        </div>
                        <form action="" class="calculate__form" id="calorie-form"> 
                            <div class="calculate__box">
                                <input type="number" placeholder="Years" class="calculate-cm" id="age">
                                <label for="" class="calculate__label">years</label>
                            </div>
                            <div class="calculate__box">
                                <input type="number" placeholder="Weight" class="calculate-kg" id="weight">
                                <label for="" class="calculate__label">kg</label>
                            </div>
                            <div class="calculate__box">
                                <input type="number" placeholder="Height" class="calculate-kg" id="height">
                                <label for="" class="calculate__label">cm</label>
                            </div>
                            
                          <div class="calculate__box">
                          <label>Gender :</label>    
                          <input type="radio" id="male" name="customRadioInline1" class="custom-control-input" checked="checked">
                          <label>Male</label>
                           
                          <input type="radio" id="female" name="customRadioInline1" class="custom-control-input">
                          <label>Female</label>
                          </div>
                          
                         <div class="calculate__box">   
                         <select class="form-control" id="list">  <br>
                         <option selected value="1">Sedentary (little or no exercise)</option>
                         <option value="2">Lightly active (light exercise/sports 1-3 days/week)</option>
                         <option value="3">Moderately active (moderate exercise/sports 3-5 days/week)</option>
                         <option value="4">Very active (hard exercise/sports 6-7 days a week)</option>
                         <option value="5">Extra active (very hard exercise/sports & physical job or 2x training)</option>
                         </select>
                         <label for="" class="calculate__label">your activity</label>    
                         </div>
                           
                          <div class="calculate__box">
                          <div id="loading">
                          <img src="./img/Loading.gif" alt="">
                          </div>    
                          <div id="results" class="pt-4">
                          <input type="number" class="form-control" id="total-calories" disabled>
                          <label for="" class="calculate__label">total calorie</label>   
                          </div>          
                          </div>    
                            

                            <button type="submit" class="button button__flex" value="Calculate">
                                Calculate Now <i class="ri-arrow-right-line"></i>
                            </button>
                        </form>
                        
                  

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <script src="assets/js/script.js"></script>
    
            
            
                    </main>

                    <!--==================== FOOTER ====================-->
                    <footer class="footer section" id="footer">
                        <div class="footer_container container grid"> 
                            <div>
                                <a href="#" class="footer_logo"> <img src="assets/img/logo.png" alt=""> Web Group Gym
                                </a> 
                                <p class="footer_description">
                                    Subscribe for company <br> updates below.
                                </p>
                                <form action="" class="footer_form" id="contact-form">
                                    <input type="email" name="user_email" placeholder="Your Email"class="footer_input" id="contact-user">
                                    <button type="submit" class="button">
                                        Subscribe
                                    </button>
                                </form>

                                <p class="footer_message" id="contact_message"></p>
                            </div>

                        </div>
                        <div class="container-footer">
                            <div class="row">
                                <div class="col-md-4">
                                    <h4>SERVICES</h4>
                                    <ul class="footage_links">
                                        <li><a href="#" class="footer_link">Flex Muscle</a></li>
                                        <li><a href="#" class="footer_link">Cardio Exercise</a></li>
                                        <li><a href="#" class="footer_link">Basic Yoga</a></li>
                                        <li><a href="#" class="footer_link">Weight Lifting</a></li>
                                    </ul>
                                </div>
                                <div class="col-md-4">
                                    <h4>PACKAGE</h4>
                                    <ul class="footage_links">
                                        <li><a href="#" class="footer_link">Basic Personal Training</a></li>
                                        <li><a href="#" class="footer_link"></a></li>
                                        <li><a href="#" class="footer_link">Group Training</a></li>
                                        <li><a href="#" class="footer_link">Premium</a></li>
                                    </ul>
                                </div>
                                <div class="col-md-4">
                                    <h4>COMPANY</h4>
                                    <ul class="col-md-4">
                                        <li><a href="#" class="footer_link">About Us</a></li>
                                        <li><a href="#" class="footer_link">Careers</a></li>
                                        <li><a href="#" class="footer_link">Customers</a></li>
                                        <li><a href="#" class="footer_link">Partners</a></li>
                                    </ul>
                                </div>
                                <div class="col-md-4">
                                    <h4>FOLLOW US</h4>
                                    <ul class="social-media">
                                        <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                                        <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                                        <li><a href="#"><i class="fab fa-instagram"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </footer>

                    <!--========== SCROLL UP ==========-->


                    <!--=============== SCROLLREVEAL ===============-->
                    <script src=""></script>

                    <!--=============== EMAIL JS ===============-->


                    <!--=============== MAIN JS ===============-->
                    <script src="assets/js/main.js"></script>
                    </body>
                    </html>
