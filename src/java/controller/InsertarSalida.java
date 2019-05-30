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
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import model.Almacen;
import model.Carrito;
import model.ConectaBD;
import model.Detalle;
import model.Disco;
import model.Usuario;

/**
 *
 * @author Armando
 */
public class InsertarSalida extends HttpServlet {

     EntityManagerFactory emf;
    EntityManager em;
    Almacen almacen;
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet InsertarSalida</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InsertarSalida at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        HttpSession session= request.getSession(true);
        int usuario = 1;        
        int idDisco = Integer.parseInt(request.getParameter("IdDisco"));
         if(session.getAttribute("Cesta"+Integer.toString(usuario))!=null){
        ArrayList<Carrito> cesta = (ArrayList<Carrito>) session.getAttribute("Cesta"+Integer.toString(usuario));
        Iterator<Carrito> it = cesta.iterator();  
        Carrito objCarrito;
        
             for (int j = 0; j < cesta.size(); j++) {
                 if(cesta.get(j).getIdDisco()==idDisco){
                     cesta.remove(j);
                 }
             }
             
       session.setAttribute("Cesta"+Integer.toString(usuario),cesta);   
       response.sendRedirect("view/Carrito.jsp");
             
         }
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
         HttpSession session= request.getSession(true);
        //int usuario = Integer.parseInt(session.getAttribute("idUsuario").toString());        
        int usuario = 1;
        int cantidad;
        int existencia;
         if(session.getAttribute("Cesta"+Integer.toString(usuario))!=null){
        ArrayList<Carrito> cesta = (ArrayList<Carrito>) session.getAttribute("Cesta"+Integer.toString(usuario));              
        float  total       = Float.parseFloat(request.getParameter("total"));
        String descripcion = (String) request.getParameter("descripcion");
        int    idCliente   = Integer.parseInt(request.getParameter("idCliente"));
        Usuario user  = new Usuario (usuario);        
        Usuario cliente = new Usuario(idCliente);
        Carrito objCarrito;
        Disco disco;            
        
        
        Date date = new Date();
        DateFormat hourdateFormat = new SimpleDateFormat("yyyy-MM-dd");
                  
         ConectaBD cn = new ConectaBD();
        almacen = new Almacen(1);       
        almacen.setId(1);
        almacen.setTipoMovimiento("Salida");
        almacen.setFechaMovimiento(String.valueOf(hourdateFormat.format(date)));
        almacen.setDescripcion(descripcion);
        almacen.setIdUsuario(user);
        almacen.setIdCliente(cliente);           
        
         cn.registrarAlmacen("Salida",String.valueOf(hourdateFormat.format(date)),descripcion,user.getId(),cliente.getId());    
        
//               em.getTransaction().begin();
//               em.persist(almacen);
//               em.flush();
//               em.getTransaction().commit();                    
        int idAlmacen = cn.lastAlmacen();
            Iterator<Carrito> it = cesta.iterator();   
            int i=0;
            while(it.hasNext()){ 
               
                
                objCarrito = (Carrito) it.next();
                cn.registrarSalida(objCarrito.getExistencia(),objCarrito.getIdDisco(),idAlmacen);                                                  
                                      
//                      Disco disk;
//                       emf = Persistence.createEntityManagerFactory("DiscograficaPU");
//                      em = emf.createEntityManager();    
//                      em.getTransaction().begin(); //Abrir la transaccion                                               
//                      disk = em.find(Disco.class,objCarrito.getIdDisco()); 
//                      em.close();
//                      
                      existencia = cn.getDiscoExistencia(objCarrito.getIdDisco());

                      cantidad = objCarrito.getExistencia();               
                      //existencia = disk.getExistencia();
                      System.out.println(existencia+" - "+cantidad);

                      existencia = existencia - cantidad;     
                      System.out.println(existencia+" despues del calculo");
                      cn.actualizarDisco(existencia,objCarrito.getIdDisco());   
                      i++;
//                      
//                      disk.setExistencia(existencia);
//                      em.merge(disk);
////                      em.getTransaction().commit();   
                
                }
            PrintWriter out = response.getWriter();
            out.println("<script>window.print();</script>");
               session.removeAttribute("Cesta"+Integer.toString(usuario));
               
               response.sendRedirect("view/Dashboard.jsp");
           
            
        }else{
             // no se pudo efectuar la venta
         }
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
