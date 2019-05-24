/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Usuario;

public class ModificarUsuario extends HttpServlet {

    EntityManagerFactory emf;
    EntityManager em;
    EntityTransaction tx;
    Usuario usuario;
    String tipoOperacion;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        emf = Persistence.createEntityManagerFactory("DiscograficaPU");
        em = emf.createEntityManager();
        usuario = new Usuario();
        
        try {
                int idUsuario = Integer.parseInt("1");
                usuario = em.find(Usuario.class,idUsuario);
                usuario.setNombre(request.getParameter("nombre_mod"));
                usuario.setApellidos(request.getParameter("apellido_mod"));
                usuario.setDireccion(request.getParameter("direccion_mod"));
                usuario.setCorreo(request.getParameter("correo_mod"));
                usuario.setTelefono(request.getParameter("telefono_mod"));
                usuario.setTipoUsuario(request.getParameter("tipo_mod"));
                usuario.setContrasenia(request.getParameter("repPass_mod"));
                usuario.setIdUsuarioModificacion(2);
                usuario.setFechaModificacion(null);

                em.getTransaction().begin();
                em.persist(usuario);
                em.flush();
                em.getTransaction().commit();
                response.sendRedirect("view/Usuario.jsp");
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
