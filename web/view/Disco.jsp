<%-- 
    Document   : Disco
    Created on : 12/05/2019, 07:23:11 PM
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
                        <a href="#" class="list-group-item list-group-item-action">Discos</a>
                        <a href="#" class="list-group-item list-group-item-action">Carrito</a>
                        <a href="#" class="list-group-item list-group-item-action">Usuarios</a>
                        <a href="#" class="list-group-item list-group-item-action">Clientes</a>
                        <a href="#" class="list-group-item list-group-item-action">Almacen</a>
                    </div>
                    <a href="#" class="list-group-item list-group-item-action" style="position:absolute;bottom: 0px">Cerrar sesión</a>
                </div>
                <div class="row col-10 mt-3">
                    <div class="col-4">
                        <img src="https://images-na.ssl-images-amazon.com/images/I/812EgYpATnL._SL1500_.jpg" width="300px" height="300px" alt="Imagen de disco">
                    </div>
                    <div class="col-8">
                        <h1>Off the wall</h1><span>(pop)</span>
                    </div>
                </div>
            </div>
        </div>
        <script src="../lib/jquery-3.4.1.min.js"></script>
        <script src="../lib/popper.min.js"></script>
        <script src="../lib/bootstrap.min.js"></script>
    </body>
</html>
