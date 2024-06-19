<%-- 
    Document   : package2
    Created on : 5 Jun 2023, 9:18:08 am
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
        <link rel="stylesheet" href="assets/css/packageplans.css">

        <title>Gym Membership - Web Group Gym</title>
    </head>
    <body class="package-body">
        <header>
            <nav>
                <div class="logo">
                    <img src="assets/img/logo.png" alt="Gym Logo">
                    <h1>SAS GYM</h1>
                </div>
                <ul class="nav-links">
                    <li><a href="BukaSini.jsp">Home</a></li>
                    <li><a href="BukaSini.jsp#program">Program</a></li>
                    <li><a href="BukaSini.jsp#pricing">Package</a></li>
                    <li><a href="#">Contact</a></li>
                    <li><a href="login.html" class="sign-in">Sign In</a></li>
                </ul>
            </nav>
        </header>
        <div class="container">
            <h1>Gym Packages</h1>

            <div class="package" id="basic-package">
                <div class="package-image">
                    <img src="assets/img/basic.png" alt="Package Image">
                </div>
                <div class="package-details">
                    <h2 class="package-title">Basic Personal Training Package</h2>
                    <p class="package-description">Description: This package offers one-on-one training sessions with a certified personal trainer to help you achieve your fitness goals.</p>
                    <div class="package-features">
                        <h3>Features:</h3>
                        <ul>
                            <li>Personalized workout programs tailored to your specific needs and goals.</li>
                            <li>Regular assessment and tracking of your progress.</li>
                            <li>Nutritional guidance and advice.</li>
                            <li>Access to gym facilities during specified hours.</li>
                        </ul>
                    </div>
                    <div class="package-benefits">
                        <h3>Benefits:</h3>
                        <p>This package is suitable for individuals who want personalized attention and guidance from a trainer while having the flexibility to work out independently.</p>
                    </div>
                    <a href="login.html" class="cta-button">Join Now</a>
                </div>
            </div>

            <div class="package" id="group-package">
                <div class="package-image">
                    <img src="assets/img/group-package.png" alt="Package Image">
                </div>
                <div class="package-details">
                    <h2 class="package-title">Group Training Package</h2>
                    <p class="package-description">Description: This package provides training sessions in a small group setting led by a qualified trainer, combining elements of personal training and group fitness.</p>
                    <div class="package-features">
                        <h3>Features:</h3>
                        <ul>
                            <li>Group workouts with a maximum number of participants for personalized attention.</li>
                            <li>Varied exercises and training techniques for overall fitness.</li>
                            <li>Motivation and support from both the trainer and fellow participants.</li>
                            <li>Regular check-ins and progress tracking.</li>
                        </ul>
                    </div>
                    <div class="package-benefits">
                        <h3>Benefits:</h3>
                        <p>Group training offers a social and supportive environment while still receiving professional guidance, making it ideal for those who enjoy a sense of community and interaction during their workouts.</p>
                    </div>
                    <a href="login.html" class="cta-button">Join Now</a>
                </div>
            </div>

            <div class="package" id="premium-package">
                <div class="package-image">
                    <img src="assets/img/premium-package.png" alt="Package Image">
                </div>
                <div class="package-details">
                    <h2 class="package-title">Premium VIP Package</h2>
                    <p class="package-description">Description: This high-end package offers exclusive access to a dedicated personal trainer, additional amenities, and enhanced services.</p>
                    <div class="package-features">
                        <h3>Features:</h3>
                        <ul>
                            <li>Unlimited one-on-one training sessions with a top-tier personal trainer.</li>
                            <li>Customized workout programs tailored to your goals and preferences.</li>
                            <li>Priority scheduling and flexibility in session timings.</li>
                            <li>Additional perks such as access to exclusive training areas, spa facilities, and complimentary services like massages or nutrition consultations.</li>
                        </ul>
                    </div>
                    <div class="package-benefits">
                        <h3>Benefits:</h3>
                        <p>The VIP package provides an elevated gym experience with exceptional personalized training and premium amenities, suitable for individuals who prioritize luxury, convenience, and individualized attention.</p>
                    </div>
                    <a href="login.html" class="cta-button">Join Now</a>
                </div>
            </div>

        </div>
        <!--==================== FOOTER ====================-->
        <footer class="footer section" id="footer">
            <div class="footer_container container grid"> 

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
                                <li><a href="#" class="footer_link">Basic</a></li>
                                <li><a href="#" class="footer_link"></a></li>
                                <li><a href="#" class="footer_link">Premium</a></li>
                                <li><a href="#" class="footer_link">Diamond</a></li>
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


        <!-- Add Font Awesome JavaScript if necessary -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
    </body>
</html>

