<%@page import="java.util.ArrayList"%>
<%@page import="negocio.modelo.ComidaDelCarrito"%>
<%@page import="negocio.modelo.Cliente"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <!--  This file has been downloaded from bootdey.com @bootdey on twitter -->
        <!--  All snippets are MIT license http://bootdey.com/license -->
        <title>Mi perfil</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
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
        <link rel="stylesheet" href="css/style1.css" type="text/css">
        <link rel="stylesheet" href="css/datosClientestyle.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <script>
            function confirmar() {
                if (confirm("¿Esta seguro que desea actualizar?")) {
                    return true;
                }
                return false;
            }
            function carritoVacio() {
                if (confirm("Su carrito de compras está vacío.")) {
                    return true;
                }
                return false;
            }

        </script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css" integrity="sha256-2XFplPlrFClt0bIdPgpz8H7ojnk10H69xRqd9+uTShA=" crossorigin="anonymous" />
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
                            String msg = (String) request.getAttribute("msg");

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
                                                            <a href="eliminarDelCarrito?idcomida=<%=comida.getIdcomida()%>&pathJSP=datosCliente"><i class="ti-close"></i></a>
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
                                            <a href="#" onclick="return carritoVacio()" class="primary-btn checkout-btn">Confirmar compra</a>
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
                        </ul>
                    </nav>
                    <div id="mobile-menu-wrap"></div>
                </div>
            </div>
        </header>
        <div class="container" style="padding-bottom:50px">
            <div class="row">
                <div class="col-12">
                    <!-- Page title -->
                    <div class="my-5">
                        <h3>Mi perfil</h3>
                        <hr>
                    </div>
                    <!-- Form START -->

                    <div class="row mb-5 gx-4">
                        <!-- Contact detail -->
                        <form action="actualizarCliente" method="post">
                            <div class="col-xxl-8 mb-5 mb-xxl-0">
                                <div class="bg-secondary-soft px-4 py-5 rounded">
                                    <div class="row g-3">
                                        <h4 class="mb-4 mt-0">Información del usuario</h4>
                                        <!-- First Name -->
                                        <input type="hidden" value="<%=cliente.getIdcliente()%>" name="idcliente">
                                        <div class="col-md-6">
                                            <label class="form-label">Nombre y apellido *</label>
                                            <input type="text" class="form-control" placeholder="" aria-label="First name" value="<%=cliente.getUsuario()%>" name="usuario">
                                        </div>
                                        <!-- Last name -->

                                        <!-- Phone number -->
                                        <div class="col-md-6">
                                            <label class="form-label">Celular *</label>
                                            <input type="text" class="form-control" placeholder="" aria-label="Phone number" value="<%=cliente.getCelular()%>" name="celular">
                                        </div>
                                        <!-- Mobile number -->

                                        <!-- Email -->
                                        <div class="col-md-6">
                                            <label for="inputEmail4" class="form-label">Email *</label>
                                            <input type="email" class="form-control" id="inputEmail4" value="<%=cliente.getEmail()%>" name="email">
                                        </div>
                                        <!-- Skype -->
                                        <div class="col-md-6">
                                            <label for="inputEmail4" class="form-label">Distrito </label>
                                            <input type="text" class="form-control" id="inputEmail4" value="<%=cliente.getDistrito()%>" name="distrito">
                                        </div>
                                        <div class="col-md-6">
                                            <label for="inputEmail4" class="form-label">Dirección </label>
                                            <input type="text" class="form-control" id="inputEmail4" value="<%=cliente.getDireccion()%>" name="direccion">
                                        </div>
                                        <div class="col-md-6" style="padding-top: 25px">
                                            <button onclick="return confirmar()" type="submit" class="btn btn-primary btn-lg">Actualizar perfil</button>
                                        </div>
                                    </div> <!-- Row END -->
                                </div>
                            </div>

                        </form>
                        <!-- Upload profile -->

                    </div> <!-- Row END -->

                    <!-- Social media detail -->


                    <!-- change password -->
                    <div class="col-xxl-8" style="margin-top: -120px">
                        <div class="bg-secondary-soft px-4 py-5 rounded">
                            <div class="row g-3">
                                <h4 class="my-4">Cambiar clave</h4>
                                <!-- Old password -->
                                <form action="actualizarClave" method="post">
                                    <input type="hidden" value="<%=cliente.getIdcliente()%>" name="idcliente">
                                    <div class="col-md-12">
                                        <label for="exampleInputPassword1" class="form-label">Clave antigua *</label>
                                        <input type="password" class="form-control" id="exampleInputPassword1" name="claveantigua">
                                    </div>
                                    <!-- New password -->
                                    <div class="col-md-6">
                                        <label for="exampleInputPassword2" class="form-label">Clave nueva *</label>
                                        <input type="password" class="form-control" id="exampleInputPassword2" name="clavenueva">
                                    </div>
                                    <!-- Confirm password -->
                                    <div class="col-md-6">
                                        <label for="exampleInputPassword3" class="form-label">Confirma nueva clave *</label>
                                        <input type="password" class="form-control" id="exampleInputPassword3" name="conclavenueva">
                                    </div>
                                    <div class="col-md-6" style="margin-top: 20px">
                                        <button onclick="return confirmar()" type="submit" class="btn btn-primary btn-lg">Actualizar clave</button>
                                    </div>
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
                            </div>
                        </div>
                    </div>
                </div> <!-- Row END -->
                <!-- button -->

                <!-- Form END -->
            </div>
        </div>




        <script type="text/javascript">

        </script>
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