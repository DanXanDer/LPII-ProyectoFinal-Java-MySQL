<%@page import="negocio.modelo.Categoria"%>
<%@page import="negocio.modelo.DAO.CategoriaDAO"%>
<%@page import="negocio.modelo.DAO.ComidaDAO"%>
<%@page import="negocio.modelo.Comida"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <!--  This file has been downloaded from bootdey.com @bootdey on twitter -->
        <!--  All snippets are MIT license http://bootdey.com/license -->
        <title>Productos</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/css/bootstrap.min.css" rel="stylesheet">

    </head>
    <body>
        <script>
            function confirmar() {
                if (confirm("¿Esta seguro de eliminar este producto?")) {
                    return true;
                }
                return false;
            }

        </script>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <div class="container">
            <div class="row flex-lg-nowrap">
                <div class="col-12 col-lg-auto mb-3" style="width: 200px; margin-left: -150px">
                    <div class="card p-3">
                        <div class="e-navlist e-navlist--active-bg">
                            <ul class="nav">                              
                                <li class="nav-item"><a class="nav-link px-2 active" href="Principal.jsp"><i class="fa fa-home mr-1"></i><span>Inicio</span></a></li>
                                <li class="nav-item"><a class="nav-link px-2 active" href="registroVentas"><i class="fa fa-fw fa-bar-chart mr-1"></i><span>Reporte de ventas</span></a></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="e-tabs mb-3 px-3">
                        <ul class="nav nav-tabs">
                            <li class="nav-item"><a class="nav-link active" href="adminTodasLasComidas">Todos los productos</a></li>

                            <%
                                ArrayList<Categoria> categorias = (ArrayList<Categoria>) CategoriaDAO.listarCategorias();
                                for (Categoria cat : categorias) {


                            %>
                            <li class="nav-item"><a  class="nav-link active" href="adminComidaSegunCategoria?idcategoria=<%=cat.getIdcategoria()%>" class="nav-link"><%=cat.getCategoria()%></a></li>
                                <%
                                    }

                                %>
                        </ul>
                    </div>

                    <div class="row flex-lg-nowrap">
                        <div class="col mb-3">
                            <div class="e-panel card">
                                <div class="card-body">
                                    <div class="card-title">

                                        <form action="AdminBuscarProducto" method="post">
                                            <div class="input-group mb-3"> 
                                                
                                                <input type="text" class="form-control" placeholder="Ingrese el nombre del producto" name="producto">
                                                <span class="input-group-text" id="basic-addon1"><button type="submit" class="btn btn-primary"><i class="fa-solid fa-magnifying-glass"></i></button></span>
                                            </div>
                                        </form>



                                    </div>
                                    <div class="e-table">
                                        <div class="table-responsive table-lg mt-3">
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr>

                                                        <th>Foto</th>
                                                        <th class="max-width">Nombre</th>
                                                        <th class="sortable">Precio</th>

                                                        <th class="sortable">Categoria</th>
                                                        <th>Acciones</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%                                                        ArrayList<Comida> comidas = (ArrayList<Comida>) request.getAttribute("comidas");
                                                        if (comidas != null) {
                                                            for (Comida c : comidas) {

                                                    %>
                                                    <tr>
                                                        <td class="align-middle text-center">
                                                            <div class="bg-light d-inline-flex justify-content-center align-items-center align-top" style="width: 100px; height: 100px; border-radius: 3px;"><img style="width: 100px; height: 100px" src="ControladorImagen?idcomida=<%=c.getIdcomida()%>" alt=""></div>
                                                        </td>
                                                        <td class="text-nowrap align-middle"><%=c.getNombre()%></td>
                                                        <td class="text-nowrap align-middle"><span>S/. <%=c.getPrecio()%></span></td>

                                                        <td class="text-nowrap align-middle"><span><%=CategoriaDAO.obtenerCategoria(c.getIdcategoria()).getCategoria()%></span></td>
                                                        <td class="text-center align-middle">
                                                            <div class="btn-group align-top">
                                                                <a class="btn btn-sm btn-outline-secondary badge" href="Producto?idcomida=<%=c.getIdcomida()%>&pathJSP=editarProducto">Editar</a>
                                                                <a onclick="return confirmar()" class="btn btn-sm btn-outline-secondary badge" href="eliminarProducto?idcomida=<%=c.getIdcomida()%>"><i class="fa fa-trash"></i></a>
                                                            </div>
                                                            <div>
                                                                <a class="btn btn-sm btn-outline-secondary badge" href="AdminEditarImagen?idcomida=<%=c.getIdcomida()%>">Editar imagen</a>
                                                                
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <%                             }
                                                        }
                                                    %>


                                                </tbody>
                                            </table>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-3 mb-3" style="margin-right: -150px">
                            <div class="card">
                                <div class="card-body">
                                    <div class="text-center px-xl-3">

                                        <a class="btn btn-success btn-block" href="Producto?pathJSP=agregarProducto"> + Agregar producto</a>

                                    </div>



                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- User Form Modal -->

                </div>
            </div>
        </div>

        <style type="text/css">
            body{
                margin-top:20px;
                background:#f8f8f8
            }
        </style>

        <script src="https://kit.fontawesome.com/7715cd7cb3.js" crossorigin="anonymous"></script>
    </body>
</html>