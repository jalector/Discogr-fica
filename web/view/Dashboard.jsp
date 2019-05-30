<%-- 
    Document   : Dashboard
    Created on : 12/05/2019, 02:19:23 PM
    Author     : Saul
--%>

<%@page import="java.util.List"%>
<%@page import="controller.ConsultasDisco"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
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
                <div class="row col-10 mt-3">
                    <div class="container-fluid p-3">
                        <div class="row">
                            <div class="col">
                                <h3>Discos</h3>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <form class="form-inline col-7 offset-5" action="../BuscarDiscoPrincipal" method="GET">
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
                            <%  
                                ConsultasDisco conDisco = new ConsultasDisco();
                                List<Object[]> listaDisco = conDisco.infoGralDisco();

                                //Obtener el nombre de la URL
                                String registros = request.getParameter("titulo");
                                //Si no hay ningún nombre en la URL cargar todos los registros
                                if (registros == null) {
                                    listaDisco = conDisco.infoGralDisco();
                                } else {
                                    listaDisco = conDisco.buscarDiscoDashboard(registros);
                                }

                                int contRow = 0;
                                for (Object[] disco : listaDisco) {

                    out.println("<div class='col-3 mb-3'>");
                    out.println("<div class='card'>");
                    out.println("<img src='../resources/images/"+String.valueOf(disco[2])+"' class='card-img-top'>");
                    out.println("<div class='card-body'>");
                    out.println("<h5 class='card-title'>"+String.valueOf(disco[1])+"</h5>");
                    out.println("<p class='card-text'>"+String.valueOf(disco[3])+"</p>");
                    out.println("<p class='card-text'>$"+String.valueOf(disco[4])+"</p>");
                    out.println("<a href='Disco.jsp?id="+String.valueOf(disco[0])+"' class='btn btn-primary'>Más detalles</a>");
                    out.println("</div>");
                    out.println("</div>");
                    out.println("</div>");
                                }
                            %>
                        </div>        
                    </div>

                </div>
                <!--
                <div class="row col-10 mt-3">

                    <div class="col-3">
                        <div class="card">
                            <img src="http://icons.iconarchive.com/icons/double-j-design/origami-colored-pencil/256/green-cd-icon.png" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title">Card title</h5>
                                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                <a href="Disco.jsp" class="btn btn-primary">Go somewhere</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="card">
                            <img src="http://icons.iconarchive.com/icons/double-j-design/origami-colored-pencil/256/green-cd-icon.png" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title">Card title</h5>
                                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                <a href="Disco.jsp" class="btn btn-primary">Go somewhere</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="card">
                            <img src="http://icons.iconarchive.com/icons/double-j-design/origami-colored-pencil/256/green-cd-icon.png" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title">Card title</h5>
                                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                <a href="Disco.jsp" class="btn btn-primary">Go somewhere</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="card">
                            <img src="http://icons.iconarchive.com/icons/double-j-design/origami-colored-pencil/256/green-cd-icon.png" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title">Card title</h5>
                                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                <a href="Disco.jsp" class="btn btn-primary">Go somewhere</a>
                            </div>
                        </div>
                    </div>
                </div>
                -->
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
