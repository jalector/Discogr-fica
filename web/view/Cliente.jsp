<%-- 
    Document   : Cliente
    Created on : 16/05/2019, 11:06:31 PM
    Author     : Saul
--%>

<%@page import="java.util.List"%>
<%@page import="controller.ConsultasCliente"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Usuario</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../lib/bootstrap.min.css">
        <link rel="stylesheet" href="../lib/animate.css">
        <link rel="stylesheet" href="../css/util.css">
    </head>
    <body>
        <nav class="navbar navbar-dark bg-primary">
            <a class="navbar-brand" href="#">
                <img src="../resources/images/icono.jpg" width="100px" height="35px" class="d-inline-block align-top" alt="">
                Discográfica
            </a>
            <a class="navbar-brand text-right" >Usuario</a>
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
                    <a href="#" class="list-group-item list-group-item-action" style="position:absolute;bottom: 0px">Cerrar sesión</a>
                </div>
                <div class="col-10 mt-3">
                    <div class="container-fluid p-3">
                        <div class="row">
                            <div class="col">
                                <h3>Clientes</h3>
                                <p>Para ver más detalles acerca del cliente pulsa en el botón de ver detalle</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <table class="table table-sm table-hover">
                                    <thead class="thead-dark">
                                        <tr>
                                            <td>Id</td>
                                            <td>Nombre</td>
                                            <td>Apellidos</td>
                                            <td>Teléfono</td>
                                            <td>Dirección</td>
                                            <td>Correo</td>
                                            <td class="text-center">Opciones</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            EntityManagerFactory emf = Persistence.createEntityManagerFactory("DiscograficaPU");
                                            EntityManager em = emf.createEntityManager();
                                            ConsultasCliente conCliente = new ConsultasCliente(emf);
                                            List<Object[]> listaCliente = conCliente.clientes();

                                            for (Object[] cli : listaCliente) {
                                                out.println("<tr>");
                                                out.println("<td>" + String.valueOf(cli[0]) + "</td>");
                                                out.println("<td>" + String.valueOf(cli[1]) + "</td>");
                                                out.println("<td>" + String.valueOf(cli[2]) + "</td>");
                                                out.println("<td>" + String.valueOf(cli[3]) + "</td>");
                                                out.println("<td>" + String.valueOf(cli[4]) + "</td>");
                                                out.println("<td>" + String.valueOf(cli[5]) + "</td>");
                                                out.println("<td class='text-center'>"
                                                        + "<a class='btn btn-warning btn-sm mr-1' href='ActualizaCliente.jsp?id=" + String.valueOf(cli[0]) + "'>Modificar</a>"
                                                        + "<a class='btn btn-danger btn-sm mr-1' href='../EliminarCliente?id=" + String.valueOf(cli[0]) + "'>Eliminar</a>"
                                                        + "</td>");
                                                out.println("</tr>");
                                                
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col text-right">
                                <button class="btn btn-primary" data-toggle="modal" data-target="#modal-cliente">Registrar nuevo cliente</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Inicio de modal-->
        <div class="modal" id="modal-cliente" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <form class="modal-content" action="../InsertarCliente">
                    <div class="modal-header">
                        <h5 class="modal-title">Detalle de cliente</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row px-3">
                            <div class="col">
                                <div class="form-row">
                                    <label class="font-weight-bold">Nombre completo</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="nombre" placeholder="Nombre">
                                        <input type="text" class="form-control" name="apellido" placeholder="Apellido">
                                    </div>
                                    <label class="font-weight-bold mt-2">Datos personales</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="direccion" placeholder="Dirección">
                                        <input type="text" class="form-control" name="correo" placeholder="Correo">
                                        <input type="text" class="form-control" name="telefono" placeholder="Teléfono">
                                    </div>
                                    <label class="font-weight-bold mt-2">Credenciales</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="pass" placeholder="Contraseña">
                                        <input type="text" class="form-control" name="repPass" placeholder="Repetir contraseña">
                                    </div>
                                    <!--

                                    <label class="font-weight-bold mt-2">Detalles de creación</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="Fecha alta">
                                        <input type="text" class="form-control" placeholder="Usuario alta">
                                    </div>
                                    <label class="font-weight-bold mt-2">Detalles de modificación</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="Fecha de modificación">
                                        <input type="text" class="form-control" placeholder="Usuario de modificación">
                                    </div>
                                    -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="row px-3">
                            <div class="col text-right mt-3">
                                <input class="btn btn-success" type="submit" value="Guardar" name="tipo_op"></input>
                            </div>
                        </div>	
                    </div>
                </form>
            </div>
        </div>
        <!--Fin de modal-->
        <script src="../lib/jquery-3.4.1.min.js"></script>
        <script src="../lib/popper.min.js"></script>
        <script src="../lib/bootstrap.min.js"></script>
    </body>
</html>
