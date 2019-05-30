<%-- 
    Document   : Producto
    Created on : 23/05/2019, 11:32:40 PM
    Author     : Saul
--%>

<%@page import="controller.ConsultasDisco"%>
<%@page import="model.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page import="javax.persistence.Query"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Principal</title>
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
                                <h3>Productos</h3>
                                
                            </div>
                        </div>
                        <div class="row mb-3">
                            <form class="form-inline col-7 offset-5" action="../BuscarDisco" method="GET">
                                <input type="text" class="form-control col-8 mx-4" id="titulo" name="titulo" placeholder="Título" value="<%
                                    String titulo = request.getParameter("titulo");

                                    if (titulo == null) {
                                        out.println("");
                                    } else {
                                        out.println(request.getParameter("titulo"));
                                    }

                                       %>">
                                <button type="submit" class="btn btn-success col-3">Buscar</button>
                            </form>
                        </div>
                        <div class="row">
                            <div class="col">
                                <p>Para ver más detalles acerca de un producto, pulsa en el botón de ver detalle</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <table class="table table-sm table-hover">
                                    <thead class="thead-dark">
                                        <tr>
                                            <td>Id</td>
                                            <td>Titulo</td>
                                            <td>Artista</td>
                                            <td>Precio</td>
                                            <td>Existencia</td>
                                            <td>Genero</td>
                                            <td>Ubicación</td>
                                            <td class="text-center">Opciones</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            ConsultasDisco conDisco = new ConsultasDisco();
                                            List<Object[]> listaDisco;
                                            
                                            //Obtener el nombre de la URL
                                            String registros = request.getParameter("titulo");
                                            //Si no hay ningún nombre en la URL cargar todos los registros
                                            if (registros == null) {
                                                listaDisco = conDisco.discos();
                                            } else {
                                                listaDisco = conDisco.buscarDisco(registros);
                                            }

                                            for (Object[] disco : listaDisco) {
                                                out.println("<tr>");
                                                out.println("<td><span id='id" + String.valueOf(disco[0]) + "'>" + String.valueOf(disco[0]) + "</span></td>");
                                                out.println("<td><span id='titulo" + String.valueOf(disco[0]) + "'>" + String.valueOf(disco[1]) + "</span></td>");
                                                out.println("<td><span id='artista" + String.valueOf(disco[0]) + "'>" + String.valueOf(disco[2]) + "</span></td>");
                                                out.println("<td><span id='precio" + String.valueOf(disco[0]) + "'>" + String.valueOf(disco[3]) + "</span></td>");
                                                out.println("<td><span id='existencia" + String.valueOf(disco[0]) + "'>" + String.valueOf(disco[4]) + "</span></td>");
                                                out.println("<td><span id='genero" + String.valueOf(disco[0]) + "'>" + String.valueOf(disco[5]) + "</span></td>");
                                                out.println("<td><span id='ubicacion" + String.valueOf(disco[0]) + "'>" + String.valueOf(disco[6]) + "</span></td>");
                                                out.println("<td class='text-center'>"
                                                        + "<a class='btn btn-warning btn-sm mr-1' href='ActualizaProducto.jsp?id=" + String.valueOf(disco[0]) + "'>Modificar</a>");
                                                if(!session.getAttribute("tipoUsuario").equals("Cliente")){
                                                    out.println("<a class='btn btn-danger btn-sm mr-1' href='../EliminarDisco?id=" + String.valueOf(disco[0]) + "'>Eliminar</a>");
                                                }
                                                out.println("</td>");
                                                out.println("</tr>");
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <%
                            if(!session.getAttribute("tipoUsuario").equals("Cliente")){
                        %>
                        <div class="row">
                            <div class="col text-right">
                                <button class="btn btn-primary" data-toggle="modal" data-target="#modal-disco-ins">Registrar nuevo disco</button>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
        <!--Inicio de modal insertar-->
        <div class="modal" id="modal-disco-ins" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <form class="modal-content" action="../InsertarDisco">
                    <div class="modal-header">
                        <h5 class="modal-title">Insertar disco</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row px-3">
                            <div class="col">
                                <div class="form-row">
                                    <label class="font-weight-bold">Características de disco</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="titulo" placeholder="Titulo">
                                        <input type="text" class="form-control" name="artista" placeholder="Artista">
                                    </div>
                                    <div class="input-group mt-3">
                                        <input type="text" class="form-control" name="precio" placeholder="Precio">
                                        <input type="text" class="form-control" name="genero" placeholder="Genero">
                                    </div>
                                    <div class="input-group mt-3">
                                        <input type="file" class="form-control" name="imagen" placeholder="URL de imagen">
                                    </div>
                                    <div class="input-group mt-3">
                                        <input type="text" class="form-control" name="descripcion" placeholder="Descricpción">
                                    </div>
                                    <label class="font-weight-bold mt-2">Datos de almacén</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="existencia" placeholder="Existencia">
                                        <input type="text" class="form-control" name="ubicacion" placeholder="Ubicación">
                                    </div>
                                    <!--
                                    <label class="font-weight-bold mt-2">Detalles de creación</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="fecAlta_ins" placeholder="Fecha alta">
                                        <input type="text" class="form-control" name="usrAlta_ins" placeholder="Usuario alta">
                                    </div>
                                    <label class="font-weight-bold mt-2">Detalles de modificación</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="fecMod_ins" placeholder="Fecha de modificación">
                                        <input type="text" class="form-control" name="usrMod_ins" placeholder="Usuario de modificación">
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
        <!--Fin de modal insertar-->

        <!--Inicio de modal modificar-->
        <div class="modal" id="modal-disco-mod" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <form class="modal-content" action="../ModificarDisco">
                    <div class="modal-header">
                        <h5 class="modal-title">Insertar disco</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row px-3">
                            <div class="col">
                                <div class="form-row">
                                    <label class="font-weight-bold">Características de disco</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="titulo_mod" placeholder="Titulo">
                                        <input type="text" class="form-control" name="artista_mod" placeholder="Artista">
                                    </div>
                                    <div class="input-group mt-3">
                                        <input type="text" class="form-control" name="precio_mod" placeholder="Precio">
                                        <input type="text" class="form-control" name="genero_mod" placeholder="Genero">
                                    </div>
                                    <div class="input-group mt-3">
                                        <input type="text" class="form-control" name="imagen_mod" placeholder="URL de imagen">
                                    </div>
                                    <div class="input-group mt-3">
                                        <input type="text" class="form-control" name="descripcion_mod" placeholder="Descricpción">
                                    </div>
                                    <label class="font-weight-bold mt-2">Datos de almacén</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="existencia_mod" placeholder="Existencia">
                                        <input type="text" class="form-control" name="ubicacion_mod" placeholder="Ubicación">
                                    </div>
                                    <label class="font-weight-bold mt-2">Detalles de creación</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="fecAlta_mod" placeholder="Fecha alta" disabled="disabled">
                                        <input type="text" class="form-control" name="usrAlta_mod" placeholder="Usuario alta" disabled="disabled">
                                    </div>
                                    <label class="font-weight-bold mt-2">Detalles de modificación</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="fecMod_mod" placeholder="Fecha de modificación" disabled="disabled">
                                        <input type="text" class="form-control" name="usrMod_mod" placeholder="Usuario de modificación" disabled="disabled">
                                    </div>

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
        <!--Fin de modal modificar-->

        <!--Inicio de modal de eliminar-->
        <div class="modal" id="modal-usuario-eli" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <form class="modal-content" action="../">
                    <div class="modal-header">
                        <h5 class="modal-title">Eliminar usuario</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row px-3">
                            <div class="col">
                                <div class="form-row">
                                    <p>¿Esta seguro que desea eliminar el registro?</p>
                                    <p id="iddisco"></p>
                                    <p id="titulo"></p>
                                    <p id="artista"></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="row px-3">
                            <div class="col text-right mt-3">
                                <input class="btn btn-danger" type="submit" value="Eliminar" name="tipo_op"></input>
                            </div>
                        </div>	
                    </div>
                </form>
            </div>
        </div>
        <script language="JavaScript" type="text/javascript">

            console.log("id sdsadsadsda");

            $(document).ready(function () {
                $(document).on('click', '.eliminar', function () {
                    var id = $(this).val();
                    console.log('id' + id);
                    var iddisco = $('#id' + id).text();
                    var titulo = $('#titulo' + id).text();
                    var artista = $('#artista' + id).text();

                    $('#modal-usuario-eli').modal('show');
                    $('#iddisco').val(iddisco);
                    $('#titulo').val(titulo);
                    $('#artista').val(artista);
                });
            });

            var boton = document.getElementById("eliminar");
            boton.onclick = function (e) {
                var id = $(this).val();
                console.log("preasdsadsa");
                var iddisco = $('#id' + id).text();
                var titulo = $('#titulo' + id).text();
                var artista = $('#artista' + id).text();

                $('#modal-usuario-eli').modal('show');
                $('#iddisco').val(iddisco);
                $('#titulo').val(titulo);
                $('#artista').val(artista);
            }
        </script>

        <!--Fin de modal de eliminar-->
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