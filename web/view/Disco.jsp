<%-- 
    Document   : Disco
    Created on : 12/05/2019, 07:23:11 PM
    Author     : Saul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Disco</title>
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
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-4">
                                <div class="row">
                                    <div class="col-12">
                                        <img src="https://images-na.ssl-images-amazon.com/images/I/812EgYpATnL._SL1500_.jpg" width="100%" style="border-radius:15px" alt="Imagen de disco">
                                    </div>
                                    <div class="col-12 mt-3">
                                        <div class="row">
                                            <div class="col-6">
                                                <button type="button" class="btn btn-success col-12">Success</button>
                                            </div>
                                            <div class="col-6">
                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="basic-addon3">Cantidad</span>
                                                    </div>
                                                    <input type="text" class="form-control" id="basic-url" aria-describedby="basic-addon3">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="col-7">
                                <h1 style="display:inline">Off the wall </h1><span>(pop)</span><br>
                                <h4 class="text-muted">Michael Jackson</h4>
                                <p class="mt-5">Michael Jackson wasn't merely the biggest pop star of his era, shaping the sound and style of the '70s and '80s; he was one of the defining stars of the 20th century, a musician who changed the contours of American culture.</p>
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
