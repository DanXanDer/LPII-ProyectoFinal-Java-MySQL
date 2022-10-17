<%-- 
    Document   : registroVentas
    Created on : 25 jul. 2022, 14:03:29
    Author     : Daniel
--%>



<%@page import="negocio.modelo.DAO.CategoriaDAO"%>
<%@page import="negocio.modelo.Categoria"%>
<%@page import="negocio.modelo.Comida"%>
<%@page import="negocio.modelo.Cliente"%>
<%@page import="negocio.modelo.DAO.ClienteDAO"%>
<%@page import="negocio.modelo.DAO.ComidaDAO"%>
<%@page import="negocio.modelo.DAO.OrdenClienteDAO"%>
<%@page import="negocio.modelo.ordenCliente"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de ventas</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <div class="container">
            <div class="row flex-lg-nowrap">
                <div class="col-12 col-lg-auto mb-3" style="width: 200px; margin-left: -150px">
                    <div class="card p-3">
                        <div class="e-navlist e-navlist--active-bg">
                            <ul class="nav">
                                <li class="nav-item"><a class="nav-link px-2 active" href="CRUDProductos"><i class="fa fa-arrow-left mr-1"></i><span>Regresar</span></a></li>

                            </ul>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="e-tabs mb-3 px-3">
                        <ul class="nav nav-tabs">
                            <li class="nav-item"><a class="nav-link active" href="#">Registro de ventas</a></li>
                        </ul>
                    </div>

                    <div class="row flex-lg-nowrap">
                        <div class="col mb-3">
                            <div class="e-panel card">
                                <div class="card-body">
                                    <div class="card-title">
                                        <h6 class="mr-2"><span>Ventas</span></h6>
                                    </div>
                                    <div class="e-table">
                                        <div class="table-responsive table-lg mt-3">
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr>

                                                        <th>#</th>
                                                        <th class="max-width">Cliente</th>
                                                        <th class="sortable">Producto</th>
                                                        <th class="sortable">Precio</th>
                                                        <th class="sortable">Cantidad</th>
                                                        <th class="sortable">Total</th>
                                                        <th class="sortable">Fecha</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                        ArrayList<ordenCliente> ordenDelCliente = (ArrayList<ordenCliente>) request.getAttribute("ordenDelCliente");
                                                        if (ordenDelCliente != null) {
                                                            for (ordenCliente o : ordenDelCliente) {

                                                    %>
                                                    <tr>

                                                        <td><%=o.getIdorden()%></td>
                                                        <td><%=ClienteDAO.mostrarClienteSegunID(o.getIdcliente()).getUsuario()%></td>
                                                        <td><%=ComidaDAO.comidaSegunID(o.getIdcomida()).getNombre()%></td>
                                                        <td>S/. <%=ComidaDAO.comidaSegunID(o.getIdcomida()).getPrecio()%></td>
                                                        <td><%=o.getCantidad()%></td>
                                                        <td>S/. <%=o.getPrecioTotal()%></td>
                                                        <td><%=o.getFecha()%></td>
                                                    </tr>
                                                    <%
                                                            }
                                                        }
                                                    %>


                                                </tbody>
                                            </table>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <form class="col-12 col-lg-4 mb-3" style="margin-right: -150px" action="registroDeVentasFiltrar" method="post">
                            <div class="card">
                                <div class="card-body">
                                    <div class="text-center px-xl-3">
                                        <div class="input-group mb-3">
                                            <label class="input-group-text">Pago total</label>
                                            <select class="form-select" name="precio"> 
                                                <option value="0">Seleccionar</option>
                                                <option value="1">Ascendente</option>
                                                <option value="2">Descendente</option>
                                            </select>                                            
                                        </div>                                        

                                        <div class="input-group mb-3">    
                                            <label class="input-group-text">Producto</label>
                                            <select class="form-select" name="producto">  
                                                <option value="0">Seleccionar producto</option>
                                                <%
                                                    ArrayList<Comida> comidas = ComidaDAO.mostrarComidas();
                                                    if (comidas != null) {
                                                        for (Comida c : comidas) {


                                                %>
                                                <option value="<%=c.getIdcomida()%>"><%=c.getNombre()%></option>
                                                <%
                                                        }
                                                    }
                                                %>
                                            </select>
                                        </div>

                                    </div>
                                    <hr class="my-3">
                                    <button class="btn btn-success btn-block" type="submit">Filtrar</button>

                                </div>



                            </div>
                        </form>
                    </div>

                </div>

                <!-- User Form Modal -->

            </div>
        </div>
    

    <style type="text/css">
        body{
            margin-top:20px;
            background:#f8f8f8
        }
    </style>




































</body>
</html>
