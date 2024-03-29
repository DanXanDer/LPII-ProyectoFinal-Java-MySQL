<%@page import="negocio.modelo.DAO.CategoriaDAO"%>
<%@page import="negocio.modelo.Categoria"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>La Mayita - Men�</title>
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
                            <a href="contacto" class="nav-item nav-link">Cont�ctanos</a>
                        </div>
                        <a href="ingresarAdmin" class="btn btn-primary py-2 px-4">Ingresar</a>
                    </div>
                </nav>

                <div class="container-xxl py-5 bg-dark hero-header mb-5">
                    <div class="container text-center my-5 pt-5 pb-4">
                        <h1 class="display-3 text-white mb-3 animated slideInDown">Men�</h1>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb justify-content-center text-uppercase">
                                <li class="breadcrumb-item"><a href="#">Inicio</a></li>
                                <li class="breadcrumb-item"><a href="#">Explorar</a></li>
                                <li class="breadcrumb-item text-white active" aria-current="page">Menu</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>

            <div class="container-xxl py-5">
                <div class="container">
                    <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                        <h5 class="section-title ff-secondary text-center text-primary fw-normal">Menu</h5>
                        <h1 class="mb-5">Comidas m�s populares</h1>
                    </div>
                    <div class="tab-class text-center wow fadeInUp" data-wow-delay="0.1s">
                        <ul class="nav nav-pills d-inline-flex justify-content-center border-bottom mb-5">
                            <%
                                    ArrayList<Categoria> categorias = CategoriaDAO.listarCategorias();
                                    for (Categoria c : categorias) {
                                %>
                                <li class="nav-item">
                                <a class="d-flex align-items-center text-start mx-3 ms-0 pb-3 active" data-bs-toggle="pill" href="principalMenu?idcategoria=<%=c.getIdcategoria()%>">
                                    <i class="fa fa-utensils fa-2x text-primary"></i>
                                    <div class="ps-3">
                                        
                                        <h6 class="mt-n1 mb-0"><%=c.getCategoria()%></h6>
                                    </div>
                                </a>
                                </li>
                                
                                <%}%>
                        </ul>

                    </div>
                </div>
            </div>
            <div class="container-fluid bg-dark text-light footer pt-5 mt-5 wow fadeIn" data-wow-delay="0.1s">
                <div class="container py-5">
                    <div class="row g-5">
                        <div class="col-lg-3 col-md-6">
                            <h4 class="section-title ff-secondary text-start text-primary fw-normal mb-4">Empresa</h4>
                            <a class="btn btn-link" href="sobreNosotros">Sobre nosotros</a>
                            <a class="btn btn-link" href="contacto">Cont�ctanos</a>
                            <a class="btn btn-link" href="reservar">Reservaci�n</a>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <h4 class="section-title ff-secondary text-start text-primary fw-normal mb-4">Contacto</h4>
                            <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>Calle Ram�n Guerrero 142, Pamplona Baja</p>
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
                            <h4 class="section-title ff-secondary text-start text-primary fw-normal mb-4">Horario de atenci�n</h4>
                            <h5 class="text-light fw-normal">Lunes - S�bado</h5>
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

                                <!--/*** This template is free as long as you keep the footer author?s credit link/attribution link/backlink. If you'd like to use the template without the footer author?s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                                Dise�ado por <a class="border-bottom" href="https://htmlcodex.com">Grupo 2</a><br><br>

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