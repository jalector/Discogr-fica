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
                                        %>                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <button class="btn btn-warning">Agregar disco</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Inicio de modal-->
        <div class="modal" id="modal-almacen" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Detalle de almacén</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row px-3">
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
                    <div class="modal-footer">
                        <div class="row px-3">
                            <div class="col text-right mt-3">
                                <button class="btn btn-success">Guardar usuario</button>
                            </div>
                        </div>	
                    </div>
                </div>
            </div>
        </div>
        <!--Fin de modal-->
        <!--Inicio de modal agregar producto-->
        <div class="modal" id="modal-usuario-mod" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <form class="modal-content" action="../ModificarUsuario">
                    <div class="modal-header">
                        <h5 class="modal-title">Detalle de usuario</h5>
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
                                        <input type="text" class="form-control" name="nombre_mod" placeholder="Nombre">
                                        <input type="text" class="form-control" name="apellido_mod" placeholder="Apellido">
                                    </div>
                                    <label class="font-weight-bold mt-2">Datos personales</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="direccion_mod" placeholder="Dirección">
                                        <input type="text" class="form-control" name="correo_mod" placeholder="Correo">
                                        <input type="text" class="form-control" name="telefono_mod" placeholder="Teléfono">
                                    </div>
                                    <label class="font-weight-bold mt-2">Credenciales</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="tipo_mod" placeholder="Tipo usuario">
                                        <input type="text" class="form-control" name="pass_mod" placeholder="Contraseña">
                                        <input type="text" class="form-control" name="repPass_mod" placeholder="Repetir contraseña">
                                    </div>

                                    <label class="font-weight-bold mt-2">Detalles de creación</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="fecAlta_mod" placeholder="Fecha alta">
                                        <input type="text" class="form-control" name="usrAlta_mod" placeholder="Usuario alta">
                                    </div>
                                    <label class="font-weight-bold mt-2">Detalles de modificación</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="fecMod_mod" placeholder="Fecha de modificación">
                                        <input type="text" class="form-control" name="usrMod_mod" placeholder="Usuario de modificación">
                                    </div>
                                    <% request.setAttribute("tipo_operacion", 1);%>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="row px-3">
                            <div class="col text-right mt-3">
                                <input class="btn btn-success" type="submit" value="Modificar" name="tipo_op"></input>
                            </div>
                        </div>	
                    </div>
                </form>
            </div>
        </div>
        
        <script src="../lib/jquery-3.4.1.min.js"></script>
        <script src="../lib/popper.min.js"></script>
        <script src="../lib/bootstrap.min.js"></script>
    </body>
</html>