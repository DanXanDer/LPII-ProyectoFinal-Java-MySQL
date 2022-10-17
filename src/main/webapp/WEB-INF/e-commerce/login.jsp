
<%@page import="java.util.ArrayList"%>
<%@page import="negocio.modelo.ComidaDelCarrito"%>
<%@page import="negocio.modelo.Cliente"%>
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Fashi Template">
        <meta name="keywords" content="Fashi, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>La Mayita - Ingresar</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap1.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/themify-icons.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style1.css?v=1.0" type="text/css">
        <link rel="stylesheet" href="css/style1.css?v=1.0" type="text/css">
    </head>

    <body>
        <script>
            function confirmar() {
                if (confirm("Su carrito de compras está vacío.")) {
                    return true;
                }
                return false;
            }

        </script>
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>
        <%
            String msg = (String) request.getAttribute("msg");
        %>
        <!-- Header Section Begin -->
        <header class="header-section">
            <div class="header-top">
                <div class="container">
                    <div class="ht-left">
                        <div class="mail-service">
                            <i class=" fa fa-envelope"></i>
                            danielsmart5@hotmail.com
                        </div>
                        <div class="phone-service">
                            <i class=" fa fa-phone"></i>
                            +51 977 953 432
                        </div>
                    </div>
                    <div class="ht-right">
                        <%
                            Cliente cliente = null;
                            cliente = (Cliente) request.getSession().getAttribute("cliente");
                            if (cliente == null) {


                        %>
                        <a href="login" class="login-panel"><i class="fa fa-user"></i>Ingresar</a>
                        <%                        } else {

                        %>
                        <div class="login-panel">
                            <span style="padding-right: 10px"><a href="datosCliente" style="color: black"><%=cliente.getUsuario()%></a></span>
                            <a href="cerrarSesionCliente" style="color: black"><i class="fa fa-user"></i>Cerrar sesión</a>

                        </div>

                        <%
                            }
                        %>
                        <div class="top-social">
                            <a href="#"><i class="ti-facebook"></i></a>
                            <a href="#"><i class="ti-twitter-alt"></i></a>
                            <a href="#"><i class="ti-linkedin"></i></a>
                            <a href="#"><i class="ti-youtube"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="inner-header">
                    <div class="row">
                        <div class="col-lg-2 col-md-2" style="margin-top: -30px;">
                            <div class="logo">
                                <a href="Principal.jsp">
                                    <img src="img/logo.png" alt="">
                                </a>
                            </div>
                        </div>
                        <form class="col-lg-7 col-md-7" action="buscarProductoPorInicial" method="post">
                            <div class="advanced-search">
                                 <button type="button" class="category-btn">Toda categoria</button>
                                <div class="input-group">
                                    
                                    <input type="text" placeholder="Ingresa el nombre" name="nombreProducto">
                                    <button type="submit"><i class="ti-search"></i></button>
                                </div>
                            </div>
                        </form>
                        <div class="col-lg-3 text-right col-md-3">
                            <ul class="nav-right">

                                <li class="cart-icon">
                                    <a href="#">
                                        <i class="icon_bag_alt"></i>
                                        <%
                                            ArrayList<ComidaDelCarrito> comidasCarrito = (ArrayList<ComidaDelCarrito>) request.getSession().getAttribute("comida_Carrito");
                                            if (comidasCarrito != null) {

                                                int cantidad = comidasCarrito.size();

                                        %>
                                        <span><%=cantidad%></span>
                                        <%
                                            }
                                        %>
                                    </a>
                                    <div class="cart-hover">
                                        <div class="select-items">
                                            <table>
                                                <tbody>
                                                    <%
                                                        comidasCarrito = (ArrayList<ComidaDelCarrito>) request.getSession().getAttribute("comida_Carrito");
                                                        if (comidasCarrito != null) {

                                                            for (ComidaDelCarrito comida : comidasCarrito) {


                                                    %>
                                                    <tr>
                                                        <td class="si-pic"><img width="150" height="100" src="ControladorImagen?idcomida=<%=comida.getIdcomida()%>"></td>
                                                        <td class="si-text">
                                                            <div class="product-selected">
                                                                <p><span>S/. </span><%=comida.getPrecio()%><span> x <%=comida.getCantidad()%></span></p>
                                                                <h6><%=comida.getNombre()%></h6>
                                                            </div>
                                                        </td>
                                                        <td class="si-close">
                                                            <a href="eliminarDelCarrito?idcomida=<%=comida.getIdcomida()%>&pathJSP=login"><i class="ti-close"></i></a>
                                                        </td>
                                                    </tr>
                                                    <%
                                                            }
                                                        }
                                                    %>

                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="select-total">
                                            <span>total:</span>
                                            <%
                                                float total = 0;
                                                if (comidasCarrito != null) {

                                                    for (ComidaDelCarrito comida : comidasCarrito) {

                                            %>
                                            <%                                                        total += comida.getPrecio_total();
                                                    }
                                                }
                                            %>
                                            <h5><span>S/. </span><%=total%></h5>
                                        </div>
                                        <div class="select-button">
                                            <a href="carrito" class="primary-btn view-card">Ver todo</a>
                                            <%
                                                if (comidasCarrito != null) {


                                            %>
                                            <a href="confirmarCompra" class="primary-btn checkout-btn">Confirmar compra</a>
                                            <%                                            } else {
                                            %>
                                            <a href="#" onclick="return confirmar()" class="primary-btn checkout-btn">Confirmar compra</a>
                                            <%
                                                }
                                            %>
                                        </div>
                                    </div>
                                </li>
                                <li class="cart-price"><span>S/. </span><%=total%></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="nav-item">
                <div class="container">
                    <div class="nav-depart">
                        <div class="depart-btn">
                            <i class="ti-menu"></i>
                            <span>Todas las categorías</span>
                            <ul class="depart-hover">
                                <li class="active"><a href="#">Entradas</a></li>
                                <li><a href="#">Fondo</a></li>
                                <li><a href="#">Guarniciones</a></li>
                                <li><a href="#">Platos extras</a></li>
                                <li><a href="#">Domingo especial</a></li>
                                <li><a href="#">Bebidas</a></li>
                                <li><a href="#">Postres</a></li>

                            </ul>
                        </div>
                    </div>
                    <nav class="nav-menu mobile-menu">
                        <ul>
                            <li class="active"><a href="indexCommerce">Inicio</a></li>
                            <li><a href="shop">Menú</a></li>



                            <li><a href="#">Páginas</a>
                                <ul class="dropdown">

                                    <li><a href="carrito">Carrito de compra</a></li>
                                    
                                        <%
                                            if (cliente == null) {
                                        %>
                                    <li><a href="agregarCliente">Registrarse</a></li>
                                    <li><a href="login">Ingresar</a></li>
                                        <%
                                        } else {
                                        %>
                                    <li><a href="historialDeCompra">Historial de compras</a></li>
                                        <%
                                            }
                                        %>
                                </ul>
                            </li>
                    </nav>
                    <div id="mobile-menu-wrap"></div>
                </div>
            </div>
        </header>
        <!-- Header End -->

        <!-- Breadcrumb Section Begin -->
        <div class="breacrumb-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb-text">
                            <a href="#"><i class="fa fa-home"></i> Inicio</a>
                            <span>Ingresar</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb Form Section Begin -->

        <!-- Register Section Begin -->
        <div class="register-login-section spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 offset-lg-3">
                        <div class="login-form">
                            <h2>Ingresar</h2>
                            <form action="logearCliente" method="post">
                                <div class="group-input">
                                    <label for="username">Correo electrónico*</label>
                                    <input type="text" id="username" name="email">
                                </div>
                                <div class="group-input">
                                    <label for="pass">Clave*</label>
                                    <input type="password" id="pass" name="clave">
                                </div>
                                <div class="group-input gi-check">
                                    <div class="gi-more">
                                        <label for="save-pass">
                                            Guardar clave
                                            <input type="checkbox" id="save-pass">
                                            <span class="checkmark"></span>
                                        </label>
                                        <a href="#" class="forget-pass">¿Olvidaste tu clave?</a>
                                    </div>
                                </div>
                                <button type="submit" class="site-btn login-btn">Ingresar</button>
                                <%if (msg != null) {

                                %>
                                <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">            
                                <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
                                    <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                                </symbol>
                                </svg>
                                <div class="alert alert-danger d-flex align-items-center" role="alert" style="margin-top: 10px;">
                                    <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
                                    <div>
                                        <%=msg%>
                                    </div>
                                </div>
                                <%}%>
                            </form>
                            <div class="switch-login">
                                <a href="agregarCliente" class="or-login">O crea una cuenta</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Register Form Section End -->

        <!-- Partner Logo Section Begin -->
        <div class="partner-logo">
            <div class="container">
                <div class="logo-carousel owl-carousel">
                    <div class="logo-item">
                        <div class="tablecell-inner">
                            <img src="img/logo-carousel/logo-1.png" alt="">
                        </div>
                    </div>
                    <div class="logo-item">
                        <div class="tablecell-inner">
                            <img src="img/logo-carousel/logo-2.png" alt="">
                        </div>
                    </div>
                    <div class="logo-item">
                        <div class="tablecell-inner">
                            <img src="img/logo-carousel/logo-3.png" alt="">
                        </div>
                    </div>
                    <div class="logo-item">
                        <div class="tablecell-inner">
                            <img src="img/logo-carousel/logo-4.png" alt="">
                        </div>
                    </div>
                    <div class="logo-item">
                        <div class="tablecell-inner">
                            <img src="img/logo-carousel/logo-5.png" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Partner Logo Section End -->

        <!-- Footer Section Begin -->
        <footer class="foot">
            <div class="container py-5">
                <div class="row py-4">
                    <div class="col-lg-4 col-md-6 mb-4 mb-lg-0"><img src="img/logo.png" alt="" height="75" width="180" class="mb-3">
                        <p style="font-size: 15px; color:white">© 2022 La Mayita. Todos los derechos reservados</p>
                        <ul class="list-inline mt-4">
                            <li class="list-inline-item"><a href="#" target="_blank" title="twitter"><i class="fa fa-twitter"></i></a></li>
                            <li class="list-inline-item"><a href="#" target="_blank" title="facebook"><i class="fa fa-facebook"></i></a></li>
                            <li class="list-inline-item"><a href="#" target="_blank" title="instagram"><i class="fa fa-instagram"></i></a></li>
                            <li class="list-inline-item"><a href="#" target="_blank" title="pinterest"><i class="fa fa-pinterest"></i></a></li>
                            <li class="list-inline-item"><a href="#" target="_blank" title="vimeo"><i class="fa fa-vimeo"></i></a></li>
                        </ul>
                    </div>
                    <div class="col-lg-2 col-md-6 mb-4 mb-lg-0">
                        <h6 class="text-uppercase mb-4" style="color: #2773BE; font-weight: 700">Información</h6>
                        <ul class="list-unstyled mb-0">
                            <li class="mb-2" style="font-size: 15px; color:white"><a href="sobreNosotros" class="text-muted">Sobre nosotros</a></li>
                            <li class="mb-2" style="font-size: 15px; color:white"><a href="contacto" class="text-muted">Contáctanos</a></li>
                            <li class="mb-2" style="font-size: 15px; color:white"><a href="reservar" class="text-muted">Reservación</a></li>

                        </ul>
                    </div>
                    <div class="col-lg-2 col-md-6 mb-4 mb-lg-0">
                        <h6 class="text-uppercase mb-4" style="color: #2773BE; font-weight: 700">Empresa</h6>
                        <ul class="list-unstyled mb-0">
                            <li class="mb-2"><a href="login" class="text-muted">Ingresar</a></li>
                            <li class="mb-2"><a href="agregarCliente" class="text-muted">Registrarse</a></li>

                            <li class="mb-2"><a href="carrito" class="text-muted">Carrito de compras</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-4 col-md-6 mb-lg-0">
                        <h6 class="text-uppercase mb-4" style="color: #2773BE; font-weight: 700">Mantente informado</h6>
                        <p class="text-muted mb-4" style="font-size: 15px; color:white">LIngresa tu correo y te mantendremos informado con las últimas ofertas disponibles</p>
                        <div class="p-1 rounded border">
                            <div class="input-group">
                                <input type="email" placeholder="Enter your email address" aria-describedby="button-addon1" class="form-control border-0 shadow-0">
                                <div class="input-group-append">
                                    <button id="button-addon1" type="submit" class="btn btn-link"><i class="fa fa-paper-plane"></i></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Copyrights -->

        </footer>
        <!-- Footer Section End -->

        <!-- Js Plugins -->
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap1.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.countdown.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery.zoom.min.js"></script>
        <script src="js/jquery.dd.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main1.js"></script>
    </body>

</html>