<%-- 
    Document   : Carrito
    Created on : 16/05/2019, 10:32:47 PM
    Author     : Saul
--%>

<%@page import="java.util.Iterator"%>
<%@page import="model.Disco"%>
<%@page import="model.Carrito"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
     session= request.getSession(true);
    //int usuario = Integer.parseInt(session.getAttribute("idUsuario").toString());        
    int usuario = 1; 
   ArrayList <Carrito> cesta;
   Carrito objCarrito = new Carrito();
     cesta = (ArrayList <Carrito>)  session.getAttribute("Cesta"+Integer.toString(usuario));                    
     float subtotal;
     float total= 0;
     int idCarrito;
     String titulo;
     int cantidad;
     float precio;
     int i=0;
%>
<html>
    <head>
        <title>Carrito</title>
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
                                <h3>Carrito de compras</h3>
                                <p>Realiza la compra de tus éxitos musicales en la mejor Discográfica del país.</p>
                            </div>
                        </div>                                                          
                        <%
                        if(cesta!=null){
                            %>
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
                                            <%
                                        Iterator<Carrito> it = cesta.iterator();                                        
                                                while(it.hasNext()){
                                                 objCarrito = (Carrito) it.next();
                                                 idCarrito = objCarrito.getIdDisco();
                                                 titulo = objCarrito.getTitulo();
                                                 cantidad = objCarrito.getExistencia();
                                                 precio = objCarrito.getPrecio();
                                                 subtotal = precio * cantidad;
                                                 total = total + subtotal;
                                                 i++;
                                                 %>
                                             <tr class="text-center">
                                            <td><%=i%></td>
                                            <td><%=titulo%></td>
                                            <td><%=cantidad%></td>
                                            <td><%=precio%>$</td>
                                            <td><%=subtotal%>$</td>
                                            <th><a href="../InsertarSalida?IdDisco=<%=idCarrito%>"><button type="submit" class="btn btn-warning btn-sm">Eliminar</button></a></th>
                                        </tr>           

                                               <%                                           
                                              }//fin del while
                                                %>
                                        <tr class="text-center">
                                            <td><%=++i%></td>
                                            <td colspan="3">Total</td>
                                            <td><%=total%>$</td>
                                            <td><button class="btn btn-danger btn-sm">Cancelar compra</button></td>
                                        </tr>                                             
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col text-right px-3">
                                <button class="btn btn-primary" data-toggle="modal" data-target="#modal-carrito">Comprar</button>
                            </div>
                        </div> 
                        </div>                                            
                    <% // fin del if                                               
                    }else{
                    %>
                    <div class="row">
                            <div class="col">
                                <br><br><br><br>
                                <h1>No se ha agregado nada al carrito</h1>                                
                            </div>
                        </div>
                    
                    <%
                    }                      
                   %>                                            
                    </div>
                </div>
            </div>
        </div>
        
         <!--Inicio de modal-->
        <div class="modal" id="modal-carrito" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <form class="modal-content" action="../InsertarSalida" method="post">
                    <div class="modal-header">
                        <h5 class="modal-title">Detalle de Venta</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row px-3">
                            <div class="col">
                                <div class="form-row">
                                    <label class="font-weight-bold">Datos del Cliente</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="idCliente" placeholder="Id" required>
                                        <input type="text" class="form-control" name="nombre" placeholder="Nombre" required>
                                        <input type="text" class="form-control" name="apellido" placeholder="Apellido" required>
                                    </div>
                                    <label class="font-weight-bold mt-2">Descripción de la Venta</label>
                                    <div class="input-group">
                                         <textarea class="form-control" name="descripcion" id="descripcion" required rows="3"></textarea>                                       
                                    </div>
                                    <label class="font-weight-bold mt-2">Total a Pagar</label>
                                    <div class="input-group">                                        
                                        <input type="text" class="form-control" name="total" value="<%=total%>">
                                    </div>                                   
                                    <label class="font-weight-bold mt-2">Forma de Pago</label>
                                    <div class="input-group">                                        
                                     <select class="form-control form-control-sm">
                                    <option>Efectivo</option>
                                    <option>Tarjeta Debito</option>
                                    <option>Tarjeta Credito</option>
                                    </select>
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

