/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Usuario;

/**
 *
 * @author Saul
 */
public class InsertarCliente extends HttpServlet {

    EntityManagerFactory emf;
    EntityManager em;
    Usuario usuario;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Date date = new Date();
        DateFormat hourdateFormat = new SimpleDateFormat("yyyy-MM-dd");
        emf = Persistence.createEntityManagerFactory("DiscograficaPU");
        em = emf.createEntityManager();
        //tx = em.getTransaction();

        //tipoOperacion = request.getParameter("tipo_op");
        usuario = new Usuario();
         try {
                //System.out.println(DateTimeFormatter.ofPattern("yyyy-MM-dd", Locale.ENGLISH).format(ldt));
                
                usuario.setNombre(request.getParameter("nombre"));
                usuario.setApellidos(request.getParameter("apellido"));
                usuario.setDireccion(request.getParameter("direccion"));
                usuario.setCorreo(request.getParameter("correo"));
                usuario.setTelefono(request.getParameter("telefono"));
                usuario.setTipoUsuario("Cliente");
                usuario.setContrasenia(request.getParameter("repPass"));
                usuario.setIdUsuarioAlta(Integer.parseInt(request.getSession().getAttribute("idUsuario").toString()));
                usuario.setFechaAlta(String.valueOf(hourdateFormat.format(date)));
                usuario.setIdUsuarioModificacion(Integer.parseInt(request.getSession().getAttribute("idUsuario").toString()));
                usuario.setFechaModificacion(String.valueOf(hourdateFormat.format(date)));

                em.getTransaction().begin();
                em.persist(usuario);
                em.flush();
                em.getTransaction().commit();
                response.sendRedirect("view/Cliente.jsp");
            } catch (Exception e) {
                e.printStackTrace();
                //response.sendRedirect("view/Usuario.jsp");
            }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}