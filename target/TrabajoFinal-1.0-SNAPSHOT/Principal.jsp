<%-- 
    Document   : Principal
    Created on : 6 jul. 2022, 22:11:57
    Author     : Daniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>La Mayita</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

   
        <link href="img/favicon.ico" rel="icon">

       
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&family=Pacifico&display=swap" rel="stylesheet">

        
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

       
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

       
        <link href="css/bootstrap.min.css" rel="stylesheet">

        
        <link href="css/style.css" rel="stylesheet">
    </head>

    <body>
        <div class="container-xxl bg-white p-0">
            
            <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
                <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                    <span class="sr-only">Loading...</span>
                </div>
            </div>
            
            <div class="container-xxl position-relative p-0">
                <nav class="navbar navbar-expand-lg navbar-dark bg-dark px-4 px-lg-5 py-3 py-lg-0">
                    <a href="Principal.jsp" class="navbar-brand p-0">
                        <img src="img/logo-principal.png" alt="">                       
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                        <span class="fa fa-bars"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarCollapse">
                        <div class="navbar-nav ms-auto py-0 pe-4">
                            <a href="Principal.jsp" class="nav-item nav-link active">Inicio</a>
                            <a href="sobreNosotros" class="nav-item nav-link">Sobre nosotros</a>
                            <a href="servicio" class="nav-item nav-link">Servicio</a>
                            <a href="menu" class="nav-item nav-link">Menu</a>
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Explorar</a>
                                <div class="dropdown-menu m-0">
                                    <a href="reservar" class="dropdown-item">Reservar</a>
                                    <a href="equipo" class="dropdown-item">Nuestro equipo</a>
                                    <a href="testimonios" class="dropdown-item">Testimonios</a>
                                </div>
                            </div>
                            <a href="contacto" class="nav-item nav-link">Contáctanos</a>
                        </div>
                        <a href="ingresarAdmin" class="btn btn-primary py-2 px-4">Ingresar</a>
                    </div>
                </nav>

                <div class="container-xxl py-5 bg-dark hero-header mb-5">
                    <div class="container my-5 py-5">
                        <div class="row align-items-center g-5">
                            <div class="col-lg-6 text-center text-lg-start">
                                <h1 class="display-3 text-white animated slideInLeft">Disfruta<br>de nuestra deliciosa comida</h1>
                                <p class="text-white animated slideInLeft mb-4 pb-2">Te brindamos comida deliciosa con el mejor servicio que puedas tener!</p>
                                <a href="indexCommerce" class="btn btn-primary py-sm-3 px-sm-5 me-3 animated slideInLeft">Pide en línea</a>
                            </div>
                            <div class="col-lg-6 text-center text-lg-end overflow-hidden">
                                <img class="img-fluid" src="img/ceviche-principal.png" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            


           
            <div class="container-xxl py-5">
                <div class="container">
                    <div class="row g-4">
                        <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.1s">
                            <div class="service-item rounded pt-3">
                                <div class="p-4">
                                    <i class="fa fa-3x fa-user-tie text-primary mb-4"></i>
                                    <h5>Cocineros especializados</h5>
                                    <p>Los mejores cocineros los encontrarás aquí</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.3s">
                            <div class="service-item rounded pt-3">
                                <div class="p-4">
                                    <i class="fa fa-3x fa-utensils text-primary mb-4"></i>
                                    <h5>Comida de calidad</h5>
                                    <p>Usamos los mejores ingredientes y el mejor método de preparación para el disfrute de tu paladar</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.5s">
                            <div class="service-item rounded pt-3">
                                <div class="p-4">
                                    <i class="fa fa-3x fa-cart-plus text-primary mb-4"></i>
                                    <h5>Delivery</h5>
                                    <p>Llegamos a tu casa en un siantamén!</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                            <div class="service-item rounded pt-3">
                                <div class="p-4">
                                    <i class="fa fa-3x fa-lock text-primary mb-4"></i>
                                    <h5>Seguridad garantizada</h5>
                                    <p>Velamos por tu seguridad mientras disfrutas de tu de comida. Nuestro restaurante se encuentra en una zona tranquila y contamos con personal de seguridad entrenado.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="container-xxl py-5">
                <div class="container">
                    <div class="row g-5 align-items-center">
                        <div class="col-lg-6">
                            <div class="row g-3">
                                <div class="col-6 text-start">
                                    <img class="img-fluid rounded w-100 wow zoomIn" data-wow-delay="0.1s" src="img/about-1.jpg">
                                </div>
                                <div class="col-6 text-start">
                                    <img class="img-fluid rounded w-75 wow zoomIn" data-wow-delay="0.3s" src="img/about-2.jpg" style="margin-top: 25%;">
                                </div>
                                <div class="col-6 text-end">
                                    <img class="img-fluid rounded w-75 wow zoomIn" data-wow-delay="0.5s" src="img/about-3.jpg">
                                </div>
                                <div class="col-6 text-end">
                                    <img class="img-fluid rounded w-100 wow zoomIn" data-wow-delay="0.7s" src="img/about-4.jpg">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <h5 class="section-title ff-secondary text-start text-primary fw-normal">Sobre nosotros</h5>
                            <h1 class="mb-4">Bienvevnido a <i class="fa fa-utensils text-primary me-2"></i>La Mayita</h1>
                            
                            <p class="mb-4">Somos un restaurant que inició el año 1990 aproximadamente, atendiendo solo los días domingos, nuestros primeros clientes fueron los vecinos de nuestro alrededor así como familiares, vendíamos ceviche en porciones pequeñas de un sol, al pasar los meses los clientes empezaron a llegar los días sábado, luego los lunes y se atendía sábado domingo y lunes, nuestros clientes empezaron a ser más exigentes y ya no solo vendíamos ceviche si no tortillas de raya sudados, ya para eso habían transcurrido 10 años tiempo en que llegó la hora de formalizar y empezar a legalizar el negocio convirtiéndonos poco a poco en uno de los restaurantes más conocidos de la ciudad de Chiclayo.</p>
                            <div class="row g-4 mb-4">
                                <div class="col-sm-6">
                                    <div class="d-flex align-items-center border-start border-5 border-primary px-3">
                                        <h1 class="flex-shrink-0 display-5 text-primary mb-0" data-toggle="counter-up">32</h1>
                                        <div class="ps-4">
                                            <p class="mb-0">Años de</p>
                                            <h6 class="text-uppercase mb-0">Experiencia</h6>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="d-flex align-items-center border-start border-5 border-primary px-3">
                                        <h1 class="flex-shrink-0 display-5 text-primary mb-0" data-toggle="counter-up">4</h1>
                                        <div class="ps-4">
                                            <p class="mb-0">Expertos</p>
                                            <h6 class="text-uppercase mb-0">Cocineros</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <a class="btn btn-primary py-3 px-5 mt-2" href="sobreNosotros">Leer más</a>
                        </div>
                    </div>
                </div>
            </div>
            

            <div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
                <div class="container">
                    <div class="text-center">
                        <h5 class="section-title ff-secondary text-center text-primary fw-normal">Testimonios</h5>
                        <h1 class="mb-5">Lo que nuestros clientes dicen!</h1>
                    </div>
                    <div class="owl-carousel testimonial-carousel">
                        <div class="testimonial-item bg-transparent border rounded p-4">
                            <i class="fa fa-quote-left fa-2x text-primary mb-3"></i>
                            <p>La mejor comida que he probado en mucho tiempo!</p>
                            <div class="d-flex align-items-center">
                                <img class="img-fluid flex-shrink-0 rounded-circle" src="img/testimonial-1.jpg" style="width: 50px; height: 50px;">
                                <div class="ps-3">
                                    <h5 class="mb-1">Daniel Gonzales</h5>
                                    <small>Estudiante</small>
                                </div>
                            </div>
                        </div>
                        <div class="testimonial-item bg-transparent border rounded p-4">
                            <i class="fa fa-quote-left fa-2x text-primary mb-3"></i>
                            <p>Excelente comida, además el personal fue muy amable!</p>
                            <div class="d-flex align-items-center">
                                <img class="img-fluid flex-shrink-0 rounded-circle" src="img/testimonial-2.jpg" style="width: 50px; height: 50px;">
                                <div class="ps-3">
                                    <h5 class="mb-1">Leidy Orihuela</h5>
                                    <small>Estiista</small>
                                </div>
                            </div>
                        </div>
                        <div class="testimonial-item bg-transparent border rounded p-4">
                            <i class="fa fa-quote-left fa-2x text-primary mb-3"></i>
                            <p>Unos amigos me recomendaron ir a este restaurante hace tiempo hasta que me animé hacerlo hace unos días. Me arrepiento de no haberlo hecho antes!</p>
                            <div class="d-flex align-items-center">
                                <img class="img-fluid flex-shrink-0 rounded-circle" src="img/testimonial-3.jpg" style="width: 50px; height: 50px;">
                                <div class="ps-3">
                                    <h5 class="mb-1">Carolina Luna</h5>
                                    <small>Estudiante</small>
                                </div>
                            </div>
                        </div>
                        <div class="testimonial-item bg-transparent border rounded p-4">
                            <i class="fa fa-quote-left fa-2x text-primary mb-3"></i>
                            <p>Espectacular comida!</p>
                            <div class="d-flex align-items-center">
                                <img class="img-fluid flex-shrink-0 rounded-circle" src="img/testimonial-4.jpg" style="width: 50px; height: 50px;">
                                <div class="ps-3">
                                    <h5 class="mb-1">Fustantina Vilca</h5>
                                    <small>Administradora</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="container-fluid bg-dark text-light footer pt-5 mt-5 wow fadeIn" data-wow-delay="0.1s">
                <div class="container py-5">
                    <div class="row g-5">
                        <div class="col-lg-3 col-md-6">
                            <h4 class="section-title ff-secondary text-start text-primary fw-normal mb-4">Empresa</h4>
                            <a class="btn btn-link" href="sobreNosotros">Sobre nosotros</a>
                            <a class="btn btn-link" href="contacto">Contáctanos</a>
                            <a class="btn btn-link" href="reservar">Reservación</a>
                            
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <h4 class="section-title ff-secondary text-start text-primary fw-normal mb-4">Contacto</h4>
                            <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>Calle Ramón Guerrero 142, Pamplona Baja</p>
                            <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>+51 977953432</p>
                            <p class="mb-2"><i class="fa fa-envelope me-3"></i>danielsmart5@hotmail.com</p>
                            <div class="d-flex pt-2">
                                <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-twitter"></i></a>
                                <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-facebook-f"></i></a>
                                <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-youtube"></i></a>
                                <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-linkedin-in"></i></a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <h4 class="section-title ff-secondary text-start text-primary fw-normal mb-4">Horario de atención</h4>
                            <h5 class="text-light fw-normal">Lunes - Sábado</h5>
                            <p>09AM - 09PM</p>
                            <h5 class="text-light fw-normal">Domingo</h5>
                            <p>10AM - 08PM</p>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <h4 class="section-title ff-secondary text-start text-primary fw-normal mb-4">Mantente informado</h4>
                            <p>Ingresa tu correo y te mantendremos informado con las mejores ofertas disponibles</p>
                            <div class="position-relative mx-auto" style="max-width: 400px;">
                                <input class="form-control border-primary w-100 py-3 ps-4 pe-5" type="text" placeholder="Tu correo">
                                <button type="button" class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2">Registrarse</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="copyright">
                        <div class="row">
                            <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                                &copy; <a class="border-bottom" href="#">La Mayita</a>, Todos los derechos reservados.

                                
                                Diseñado por <a class="border-bottom" href="#">Grupo 2</a><br><br>
                              
                            </div>
                            <div class="col-md-6 text-center text-md-end">
                                <div class="footer-menu">
                                    <a href="">Inicio</a>
                                    <a href="">Cookies</a>
                                    <a href="">Ayuda</a>
                                    <a href="">FQAs</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
        </div>

        
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/wow/wow.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/counterup/counterup.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="lib/tempusdominus/js/moment.min.js"></script>
        <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

   
        <script src="js/main.js"></script>
    </body>

</html>