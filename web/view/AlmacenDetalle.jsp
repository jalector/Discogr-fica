<%-- 
    Document   : AlmacenDetalle
    Created on : 29/05/2019, 11:54:00 AM
    Author     : judaa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalle de almacen</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../lib/bootstrap.min.css">
        <link rel="stylesheet" href="../lib/animate.css">
        <link rel="stylesheet" href="../css/util.css">
        <link rel="icon" href="../resources/images/favicon.ico" type="image/x-icon">
    </head>
    <body>
        <%
            String var = "";
            
            if(session.getAttribute("idUsuario") != null){
                var = session.getAttribute("idUsuario").toString();
            }
            
            if(!var.equals("")){
        %>
        <nav class="navbar navbar-dark bg-primary">
            <a class="navbar-brand" href="#">
                <img src="../resources/images/icono.jpg" width="100px" height="35px" class="d-inline-block align-top" alt="">
                Discográfica
            </a>
            <a class="navbar-brand text-right" ><%=session.getAttribute("nombreUsuario")%></a>
        </nav>
        <div class="container-fluid">
            <div class="row">
                <div class="col-2 p-0" style="background: #303030; height: 89vh;">
                    <div class="list-group">
                        <a href="Dashboard.jsp" class="list-group-item list-group-item-action">Discos</a>
                        <a href="Carrito.jsp" class="list-group-item list-group-item-action">Carrito</a>
                        <a href="Usuario.jsp" class="list-group-item list-group-item-action">Usuarios</a>
                        <a href="Cliente.jsp" class="list-group-item list-group-item-action">Clientes</a>
                        <a href="Almacen.jsp" class="list-group-item list-group-item-action">Almacen</a>
                    </div>
                    <a href="../CerrarSesion" class="list-group-item list-group-item-action" style="position:absolute;bottom: 0px">Cerrar sesión</a>
                </div>
                <div class="col-10 mt-3">
                    <div class="container-fluid p-3">
                        <div class="row">
                            <div class="col ">

                                <div class="row">
                                    <div class="col">
                                        <h3>Detalle de almacén</h3>					
                                    </div>				
                                </div>
                                <div class="row mt-2">
                                    <div class="col">
                                        <p class="text-right">12, may, 2019</p>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        <table class="table table-sm table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Id</th>
                                                    <th>Producto</th>
                                                    <th>Cantidad</th>
                                                    <th>P/U</th>
                                                    <th>Total</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>1</td>
                                                    <td>Disco: Off The Wall</td>
                                                    <td>3</td>
                                                    <td>70$</td>
                                                    <td>210$</td>								
                                                </tr>
                                                <tr>
                                                    <td>1</td>
                                                    <td>Disco: Off The Wall</td>
                                                    <td>3</td>
                                                    <td>70$</td>
                                                    <td>210$</td>								
                                                </tr>
                                                <tr>
                                                    <td>1</td>
                                                    <td>Disco: Off The Wall</td>
                                                    <td>3</td>
                                                    <td>70$</td>
                                                    <td>210$</td>								
                                                </tr>
                                                <tr>
                                                    <td>1</td>
                                                    <td>Disco: Off The Wall</td>
                                                    <td>3</td>
                                                    <td>70$</td>
                                                    <td>210$</td>								
                                                </tr>
                                                <tr>
                                                    <td class="text-center" colspan="4">Total</td>
                                                    <td>840$</td>								
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>


                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="../lib/jquery-3.4.1.min.js"></script>
        <script src="../lib/popper.min.js"></script>
        <script src="../lib/bootstrap.min.js"></script>
        <%
            }else{
        %>
        <script type="text/javascript">
            alert("Por favor inicia sesión para poder ingresar al sitio");
            setTimeout("redireccionar()", 1); //tiempo expresado en milisegundos
            
            function redireccionar(){
                window.location="../index.html";
            }
        </script>
        <%
            }
        %>
    </body>
</html>
