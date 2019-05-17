package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ValidarDatos;

public class ServletPrueba extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            ValidarDatos validarDatos = new ValidarDatos();

            String usuario = request.getParameter("usuario");
            String password = request.getParameter("password");

            //out.println("Hola " + usuario + " con contraseña " + password);
            String tipoUsuario = validarDatos.validar(usuario, password);

            //out.println(tipoUsuario);

            switch (tipoUsuario) {
                case "Administrador":
                    request.getRequestDispatcher("/view/IndexAdministrador.jsp").forward(request, response);
                    //response.sendRedirect("/Discografica/view/IndexAdministrador.jsp"); 
                    break;
                case "Empleado":
                    request.getRequestDispatcher("/view/IndexEmpleado.jsp").forward(request, response);
                    break;
                case "Cliente":
                    request.getRequestDispatcher("/view/IndexCliente.jsp").forward(request, response);
                    break;
                case "Incorrecto":
                    /*out.println("<script type=\"text/javascript\">");
                    out.println("alert('Inicio de Sesión Incorrecto');");
                    out.println("location='index.html';");
                    out.println("</script>");*/
                    //response.sendRedirect("index.html");
                    out.println("<meta http-equiv='refresh' content='3;URL=index.html'>");//redirects after 3 seconds
                    out.println("<h1 style='color:red; text-align:center;'>Inicio de Sesión Incorrecto</h1>");
                    /*out.println("<script type=\"text/javascript\">");
                    out.println("alert('User or password incorrect');");
                    out.println("</script>");
                    response.sendRedirect("index.html");*/
                    break;
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
