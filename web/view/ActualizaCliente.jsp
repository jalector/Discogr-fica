<%-- 
    Document   : ActualizaCliente
    Created on : 25/05/2019, 04:17:53 PM
    Author     : Saul
--%>

<%@page import="controller.ConsultasCliente"%>
<%@page import="controller.ConsultasUsuario"%>
<%@page import="java.util.List"%>
<%@page import="controller.ConsultasDisco"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Cliente</title>
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
                <div class="row col-10 mt-3">
                    <div class="container-fluid">
                        <h3 class="text-center mt-3">Modificar cliente</h3>
                        <div class="row mx-5 mb-5">

                            <%
                                //Código para obtener toda la información del cliente

                                ConsultasCliente conCliente = new ConsultasCliente();
                                List<Object[]> usr = conCliente.obtenerDetallesCliente(Integer.parseInt(request.getParameter("id")));
                                String id = "";
                                String nombre = "";
                                String apellidos = "";
                                String contrasenia = "";
                                String telefono = "";
                                String direccion = "";
                                String correo = "";
                                String idUsrAlta = "";
                                String fechaAlta = "";
                                String idUsrMod = "";
                                String fechaMod = "";
                                for (Object[] usuario : usr) {
                                    id = String.valueOf(usuario[0]);
                                    nombre = String.valueOf(usuario[1]);
                                    apellidos = String.valueOf(usuario[2]);
                                    contrasenia = String.valueOf(usuario[3]);
                                    telefono = String.valueOf(usuario[4]);
                                    direccion = String.valueOf(usuario[5]);
                                    correo = String.valueOf(usuario[6]);
                                    idUsrAlta = String.valueOf(usuario[7]);
                                    fechaAlta = String.valueOf(usuario[8]);
                                    idUsrMod = String.valueOf(usuario[9]);
                                    fechaMod = String.valueOf(usuario[10]);
                                }
                            %>
                            <div class="col">
                                <form class="form-row" action="../ModificarCliente">
                                    <label class="font-weight-bold">Nombre completo</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="id_mod" placeholder="Id" value="<%= id%>">
                                        <input type="text" class="form-control" name="nombre_mod" placeholder="Nombre" value="<%= nombre%>">
                                        <input type="text" class="form-control" name="apellido_mod" placeholder="Apellido" value="<%= apellidos%>">
                                    </div>
                                    <label class="font-weight-bold mt-2">Datos personales</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="direccion_mod" placeholder="Dirección" value="<%= direccion%>">
                                        <input type="text" class="form-control" name="correo_mod" placeholder="Correo" value="<%= correo%>">
                                        <input type="text" class="form-control" name="telefono_mod" placeholder="Teléfono" value="<%= telefono%>">
                                    </div>
                                    <label class="font-weight-bold mt-2">Credenciales</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="repPass_mod" placeholder="Repetir contraseña" value="<%= contrasenia%>">
                                    </div>
                                    <label class="font-weight-bold mt-2">Detalles de creación</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="usrAlta_mod" placeholder="Usuario alta" disabled="disabled" value="<%= idUsrAlta%>">
                                        <input type="text" class="form-control" name="fecAlta_mod" placeholder="Fecha alta" disabled="disabled" value="<%= fechaAlta%>">
                                    </div>
                                    <label class="font-weight-bold mt-2">Detalles de modificación</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="usrMod_mod" placeholder="Usuario de modificación" disabled="disabled" value="<%= idUsrMod%>">
                                        <input type="text" class="form-control" name="fecMod_mod" placeholder="Fecha de modificación" disabled="disabled" value="<%= fechaMod%>">
                                    </div>
                                    <div class="row justify-content-end">
                                        <div class="col mt-3">
                                            <input class="btn btn-warning" type="submit" value="Modificar"></input>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="../lib/jquery-3.4.1.min.js"></script>
        <script src="../lib/popper.min.js"></script>
        <script src="../lib/bootstrap.min.js"></script>
    </body>
</html>