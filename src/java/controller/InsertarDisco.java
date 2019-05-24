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
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Disco;

public class InsertarDisco extends HttpServlet {

    EntityManagerFactory emf;
    EntityManager em;
    Disco disco;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Date date = new Date();
        DateFormat hourdateFormat = new SimpleDateFormat("yyyy-MM-dd");
        emf = Persistence.createEntityManagerFactory("DiscograficaPU");
        em = emf.createEntityManager();
        disco = new Disco();
        try {
            disco.setTitulo(request.getParameter("titulo"));
            disco.setArtista(request.getParameter("artista"));
            disco.setPrecio(Float.parseFloat(request.getParameter("precio")));
            disco.setImagen(request.getParameter("imagen"));
            disco.setExistencia(Integer.parseInt(request.getParameter("existencia")));
            disco.setGenero(request.getParameter("genero"));
            disco.setUbicacion(request.getParameter("ubicacion"));
            disco.setDescripcion(request.getParameter("descripcion"));
            disco.setIdUsuarioAlta(1);
            disco.setFechaAlta(String.valueOf(hourdateFormat.format(date)));
            disco.setIdUsuarioModificacion(1);
            disco.setFechaModificacion(String.valueOf(hourdateFormat.format(date)));

            em.getTransaction().begin();
            em.persist(disco);
            em.flush();
            em.getTransaction().commit();
            response.sendRedirect("view/Producto.jsp");
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

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
