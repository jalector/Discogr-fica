<%-- 
    Document   : IndexAdministrador
    Created on : 16/05/2019, 07:26:54 PM
    Author     : Rafa Paniagua
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String var ="";
            
            if(request.getSession().getAttribute("idUsuario") != null){
                var = request.getSession().getAttribute("idUsuario").toString();
            }
            
            if(!var.equals("")){
        %>
        <h1>Si hay</h1>
        <br><br>
        <%
            }else{
        %>
        <h1>No hay</h1>
        <br><br>
        <%
            response.sendRedirect("../index.html");
            }
        %>
        <h1>Se a iniciado la sesion</h1>
        <!--Archivo .jsp recibe la solicitud del cliente, que le fue reenviada por el ServletSalida
            mediante el método getRequestDispatcher("salida.jsp").forward-->
        <b>Id: <%=request.getSession().getAttribute("idUsuario")%></b>
        <br>
        <b>Nombre: <%=request.getSession().getAttribute("nombreUsuario")%></b>
        <br>
        <b>Tipo: <%=request.getSession().getAttribute("tipoUsuario")%></b>
        <br><br>
        <a href="../CerrarSesion">Cerrar Sesion</a>
    </body>
</html>
