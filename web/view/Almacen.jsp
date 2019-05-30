<%-- 
    Document   : Almacen
    Created on : 16/05/2019, 10:15:28 PM
    Author     : Saul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controller.AlmacenController"%>
<%@page import="model.Almacen"%>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Almacen</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                        <a href="Producto.jsp" class="list-group-item list-group-item-action">Productos</a>
                        <a href="Almacen.jsp" class="list-group-item list-group-item-action">Almacen</a>
                    </div>
                    <a href="../CerrarSesion" class="list-group-item list-group-item-action" style="position:absolute;bottom: 0px">Cerrar sesión</a>
                </div>
                <div class="col-10 mt-3">
                    <div class="container-fluid p-3">
                        <div class="row">
                            <div class="col">
                                <h3>Movimientos de almacén</h3>
                                <p>Las entradas de almacén son registradas según la mercansía ha sido vendida</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <table class="table table-hover table-sm">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Tipo movimiento</th>
                                            <th>Fecha movimiento</th>
                                            <th>Usuario</th>
                                            <th>Cliente</th>
                                            <th>Descripción</th>
                                            <th>Detalle</th>
                                        </tr>					
                                    </thead>
                                    <tbody>
                                        <%
                                            AlmacenController ac = new AlmacenController();
                                            
                                            List <Almacen> movimientos = ac.getRegistrosAlmacen();
                                            for (Almacen movimiento : movimientos) {
                                                
                                                if((!session.getAttribute("tipoUsuario").equals("Cliente")) || 
                                                        (session.getAttribute("tipoUsuario").equals("Cliente") && 
                                                            (Integer.parseInt(session.getAttribute("idUsuario").toString()) == movimiento.getIdCliente().getId()))){

                                                    out.println("<tr>");
                                                        out.println("<td>"+movimiento.getId()+"</td>");
                                                        out.println("<td>"+movimiento.getTipoMovimiento()+"</td>");
                                                        out.println("<td>"+movimiento.getFechaMovimiento()+"</td>");
                                                        out.println("<td>"+movimiento.getDescripcion()+"</td>");
                                                        out.println("<td>"+movimiento.getIdCliente().getNombre()+"</td>");
                                                        out.println("<td>"+movimiento.getIdUsuario  ().getNombre()+"</td>");

                                                        out.println("<td>");
                                                        out.println("<a href='AlmacenDetalle.jsp?movimoento="+ movimiento.getId() +"' class='btn btn-sm btn-info'>Detalle</a>");

                                                        out.println("</td>");

                                                    out.println("</tr>");

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