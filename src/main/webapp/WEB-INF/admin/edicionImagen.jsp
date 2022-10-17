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
        <title>Producto</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/css/bootstrap.min.css" rel="stylesheet">

    </head>
    <body>
        <%
            String msg = (String) request.getAttribute("msg");
        %>
        <script>
            function confirmar() {
                if (confirm("¿Esta seguro de proceder?")) {
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
                                <li class="nav-item"><a class="nav-link px-2 active" href="CRUDProductos"><i class="fa fa-fw fa-arrow-left mr-1"></i><span>Regresar</span></a></li>

                            </ul>
                        </div>
                    </div>
                </div>
                <form action="GrabarEditImg" method="post" enctype="multipart/form-data" style="width: 50%; margin-left: 20%">
                    <%
                        String titulo = (String) request.getAttribute("titulo");


                    %>
                    <div id="titulo" class="card">
                        <div class="card-body">
                            <h1 style="margin-left: 20%"><%=titulo%></h1>
                        </div>
                    </div>
                    <div class="mb-3" style="margin-top: 10%">
                        <label for="exampleInputPassword1" class="form-label">Comida</label>
                        <input type="text" class="form-control" id="exampleInputPassword1" value="${comida.getNombre()}" readonly>
                    </div>    

                    <input type="hidden" name="idcomida" value="${comida.getIdcomida()}">





                    <div class="mb-3">
                        <label for="exampleInputPassword1" class="form-label">Foto</label>
                        <input type="file" name="foto" class="form-control" id="exampleInputPassword1" value="${comida.getFoto()}">
                    </div>



                    <button onclick="return confirmar()" type="submit" class="btn btn-primary">Grabar</button>
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

        <style type="text/css">
            body{
                margin-top:20px;
                background:#f8f8f8
            }
        </style>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>

    </body>
</html>