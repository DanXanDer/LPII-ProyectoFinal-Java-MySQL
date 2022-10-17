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
        <title>Confirmar compra</title>

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
        <link rel="stylesheet" href="css/style1.css" type="text/css">
        <link rel="stylesheet" href="css/tarjetaCredito.css" type="text/css">


    </head>

    <body>
        <script>
            function confirmar() {
                if (confirm("¿Esta seguro que desea realizar la compra?")) {
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
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>

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
                                                            <a href="eliminarDelCarrito?idcomida=<%=comida.getIdcomida()%>&pathJSP=confirmarCompra"><i class="ti-close"></i></a>
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
                                <li class="cart-price"><span>S/.</span><%=total%></li>
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
                        <div class="breadcrumb-text product-more">
                            <a href="index"><i class="fa fa-home"></i> Inicio</a>
                            <a href="menu">Menus</a>
                            <span>Confirmar compra</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb Section Begin -->

        <!-- Shopping Cart Section Begin -->
        <section class="checkout-section spad">
            <div class="container">
                <form action="realizarCompra" method="post" class="checkout-form">
                    <div class="row">

                        <div class="col-lg-6" style="margin-left: 25%">

                            <div class="place-order">
                                <h4>Tu orden</h4>
                                <div class="order-total">
                                    <ul class="order-table">

                                        <li>Producto <span>Precio</span></li>
                                            <%
                                                if (comidasCarrito != null) {

                                                    for (ComidaDelCarrito comida : comidasCarrito) {
                                            %>
                                        <li class="fw-normal"><%=comida.getNombre()%> x <%=comida.getCantidad()%><span>S/. <%=comida.getPrecio_total()%></span></li>
                                            <%
                                                    }
                                                }
                                            %>
                                        <li class="total-price">Total<span>S/. <%=total%></span></li>

                                    </ul>

                                    <div class="order-btn">                                       
                                        <button style="margin-bottom: 10px" onclick="return confirmar()" class="site-btn place-btn" type="submit">
                                            Pago contra entrega
                                        </button>  
                                        <button  class="site-btn place-btn" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                                            Pago con tarjeta
                                        </button>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </form>
                <div class="collapse" id="collapseExample">
                    <div class="conTarjeta">

                        <div class="tarjeta-con">

                            <div class="frontTarjeta">
                                <div class="imageTarjeta">
                                    <img src="image/chip.png" alt="">
                                    <img src="image/visa.png" alt="">
                                </div>
                                <div class="tarjeta-numero-box">################</div>
                                <div class="Tarjetaflexbox">
                                    <div class="Tarjetabox">
                                        <span>Titular de la tarjeta</span>
                                        <div class="card-holder-name">Nombre completo</div>
                                    </div>
                                    <div class="Tarjetabox">
                                        <span>Expiracion</span>
                                        <div class="expiration">
                                            <span class="exp-month">Mes</span>
                                            <span class="exp-year">Año</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="Tarjetaback">
                                <div class="Tarjetastripe"></div>
                                <div class="Tarjetabox">
                                    <span>cvv</span>
                                    <div class="Tarjetacvv-box"></div>
                                    <img src="image/visa.png" alt="">
                                </div>
                            </div>

                        </div>

                        <form action="realizarCompra" method="post">
                            <div class="inputBox">
                                <span>Número de tarjeta</span>
                                <input type="text" maxlength="16" class="card-number-input">
                            </div>
                            <div class="inputBox">
                                <span>Titular de la tarjetea</span>
                                <input type="text" class="card-holder-input">
                            </div>
                            <div class="Tarjetaflexbox">
                                <div class="inputBox">
                                    <span>Mes de expiración</span>
                                    <select name="" id="" class="month-input">
                                        <option value="month" selected disabled>Mes</option>
                                        <option value="01">01</option>
                                        <option value="02">02</option>
                                        <option value="03">03</option>
                                        <option value="04">04</option>
                                        <option value="05">05</option>
                                        <option value="06">06</option>
                                        <option value="07">07</option>
                                        <option value="08">08</option>
                                        <option value="09">09</option>
                                        <option value="10">10</option>
                                        <option value="11">11</option>
                                        <option value="12">12</option>
                                    </select>
                                </div>
                                <div class="inputBox">
                                    <span>Año de expiración</span>
                                    <select name="" id="" class="year-input">
                                        <option value="year" selected disabled>year</option>
                                        <option value="2021">2021</option>
                                        <option value="2022">2022</option>
                                        <option value="2023">2023</option>
                                        <option value="2024">2024</option>
                                        <option value="2025">2025</option>
                                        <option value="2026">2026</option>
                                        <option value="2027">2027</option>
                                        <option value="2028">2028</option>
                                        <option value="2029">2029</option>
                                        <option value="2030">2030</option>
                                    </select>
                                </div>
                                <div class="inputBox">
                                    <span>CVV</span>
                                    <input type="text" maxlength="4" class="cvv-input">
                                </div>
                            </div>
                            <input onclick="return confirmar()" type="submit" value="Realizar compra" class="Tarjetasubmit-btn">
                        </form>

                    </div>   
                </div>
            </div>
        </section>
        <!-- Shopping Cart Section End -->

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
            <script>

                document.querySelector('.card-number-input').oninput = () => {
                    document.querySelector('.tarjeta-numero-box').innerText = document.querySelector('.card-number-input').value;
                }

                document.querySelector('.card-holder-input').oninput = () => {
                    document.querySelector('.card-holder-name').innerText = document.querySelector('.card-holder-input').value;
                }

                document.querySelector('.month-input').oninput = () => {
                    document.querySelector('.exp-month').innerText = document.querySelector('.month-input').value;
                }

                document.querySelector('.year-input').oninput = () => {
                    document.querySelector('.exp-year').innerText = document.querySelector('.year-input').value;
                }

                document.querySelector('.cvv-input').onmouseenter = () => {
                    document.querySelector('.frontTarjeta').style.transform = 'perspective(1000px) rotateY(-180deg)';
                    document.querySelector('.Tarjetaback').style.transform = 'perspective(1000px) rotateY(0deg)';
                }

                document.querySelector('.cvv-input').onmouseleave = () => {
                    document.querySelector('.frontTarjeta').style.transform = 'perspective(1000px) rotateY(0deg)';
                    document.querySelector('.Tarjetaback').style.transform = 'perspective(1000px) rotateY(180deg)';
                }

                document.querySelector('.cvv-input').oninput = () => {
                    document.querySelector('.Tarjetacvv-box').innerText = document.querySelector('.cvv-input').value;
                }

            </script>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    </body>

</html>