<%-- 
    Document   : Admin
    Created on : 16/05/2019, 11:32:37 PM
    Author     : Saul
--%>

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
                        <a href="Almacen.jsp" class="list-group-item list-group-item-action">Almacen</a>
                    </div>
                    <a href="#" class="list-group-item list-group-item-action" style="position:absolute;bottom: 0px">Cerrar sesión</a>
                </div>
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
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-cliente-ini">Go somewhere</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal" id="modal-cliente-ini" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Bienvenido</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>Consulta todos tus movimientos, compras o devoluciones</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-success" id="mensaje">Aceptar</button>
                    </div>
                </div>
            </div>
        </div>
        <script src="../lib/jquery-3.4.1.min.js"></script>
        <script src="../lib/popper.min.js"></script>
        <script src="../lib/bootstrap.min.js"></script>
    </body>
</html>
