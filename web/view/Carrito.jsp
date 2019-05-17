<%-- 
    Document   : Carrito
    Created on : 16/05/2019, 10:32:47 PM
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
                <div class="col-10 mt-3">
                    <div class="container-fluid p-3">
                        <div class="row">
                            <div class="col">
                                <h3>Carrito de compras</h3>
                                <p>Realiza la compra de tus éxitos musicales en la mejor Discográfica del país.</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <table class="table table-hover table-sm table-bordered">
                                    <theader>
                                        <tr class="text-center">
                                            <th>#</th>
                                            <th>Producto</th>
                                            <th>Cantidad</th>
                                            <th>Precio unitario</th>
                                            <th>Precio Total</th>
                                            <th></th>
                                        </tr>
                                    </theader>
                                    <tbody>
                                        <tr class="text-center">
                                            <td>1</td>
                                            <td>Of The wall</td>
                                            <td>2</td>
                                            <td>70$</td>
                                            <td>140$</td>
                                            <th><button class="btn btn-warning btn-sm">Eliminar</button></th>
                                        </tr>
                                        <tr class="text-center">
                                            <td>2</td>
                                            <td>Of The wall</td>
                                            <td>2</td>
                                            <td>70$</td>
                                            <td>140$</td>
                                            <th><button class="btn btn-warning btn-sm">Eliminar</button></th>
                                        </tr>
                                        <tr class="text-center">
                                            <td>3</td>
                                            <td>Of The wall</td>
                                            <td>2</td>
                                            <td>70$</td>
                                            <td>140$</td>
                                            <th><button class="btn btn-warning btn-sm">Eliminar</button></th>
                                        </tr>
                                        <tr class="text-center">
                                            <td>4</td>
                                            <td>Of The wall</td>
                                            <td>2</td>
                                            <td>70$</td>
                                            <td>140$</td>
                                            <th><button class="btn btn-warning btn-sm">Eliminar</button></th>
                                        </tr>
                                        <tr class="text-center">
                                            <td>5</td>
                                            <td>Of The wall</td>
                                            <td>2</td>
                                            <td>70$</td>
                                            <td>140$</td>
                                            <th><button class="btn btn-warning btn-sm">Eliminar</button></th>
                                        </tr>
                                        <tr class="text-center">
                                            <td>6</td>
                                            <td>Of The wall</td>
                                            <td>2</td>
                                            <td>70$</td>
                                            <td>140$</td>
                                            <th><button class="btn btn-warning btn-sm">Eliminar</button></th>
                                        </tr>
                                        <tr class="text-center">
                                            <td>7</td>
                                            <td>Of The wall</td>
                                            <td>2</td>
                                            <td>70$</td>
                                            <td>140$</td>
                                            <th><button class="btn btn-warning btn-sm">Eliminar</button></th>
                                        </tr>
                                        <tr class="text-center">
                                            <td>8</td>
                                            <td colspan="3">Total</td>
                                            <td>840$</td>
                                            <td><button class="btn btn-danger btn-sm">Cancelar compra</button></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col text-right px-3">
                                <button class="btn btn-primary">Comprar</button>
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

