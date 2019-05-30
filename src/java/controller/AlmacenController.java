/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import model.Almacen;
import model.Usuario;
/**
 *
 * @author judaa
 */

public class AlmacenController implements Serializable {
    private EntityManagerFactory emf;
    private EntityManager em;
    
    public AlmacenController(){
        
    }
    
    public void openEntityManager(){
        this.emf = Persistence.createEntityManagerFactory("DiscograficaPU");
        this.em = emf.createEntityManager();
    }
    
    public void closeEntityManager(){
        this.em.close();
        this.emf.close();
    }
    
    public List<Almacen> getRegistrosAlmacen(){
        String query = "select a.id, a.tipo_movimiento, a.fecha_movimiento, a.descripcion, cliente.nombre, usuario.nombre " +
                "from Almacen a " +
                "join Usuario cliente " +
                "on cliente.id = id_cliente " +
                "join Usuario usuario " +
                "on usuario.id = id_usuario;";
        this.openEntityManager();
        
        Query consulta = em.createNativeQuery(query);
        
        List<Object[]> rawMovimientos = consulta.getResultList();
        
        // Un Almacen está conformado por movimientos 
        List<Almacen> movimientos = new ArrayList<Almacen>();
        
        for (Object[] rawMovimiento : rawMovimientos) {
            Almacen almacen = new Almacen();
            almacen.setId(Integer.parseInt(String.valueOf(rawMovimiento[0])));
            almacen.setTipoMovimiento(String.valueOf(rawMovimiento[1]));
            almacen.setFechaMovimiento(String.valueOf(rawMovimiento[2]));
            almacen.setDescripcion(String.valueOf(rawMovimiento[3]));
            
            Usuario cliente = new Usuario();
            cliente.setNombre(String.valueOf(rawMovimiento[4]));            
            almacen.setIdCliente(cliente);
            
            Usuario usuario = new Usuario();
            usuario.setNombre(String.valueOf(rawMovimiento[5]));            
            almacen.setIdUsuario(usuario);
            
            movimientos.add(almacen);
        }
        
        this.closeEntityManager();
        
        return movimientos;
    }
    
    public Almacen getMovimientoAlmacen(String idMovimiento){
        String query = "select a.id, a.tipo_movimiento, a.fecha_movimiento, a.descripcion, cliente.nombre, usuario.nombre " +
                "from Almacen a " +
                "join Usuario cliente " +
                "on cliente.id = id_cliente " +
                "join Usuario usuario " +
                "on usuario.id = id_usuario "
                + "where a.id = " + idMovimiento + " and devuelto = false;";
        this.openEntityManager();
        
        Query consulta = em.createNativeQuery(query);
        
        Object[] rawMovimiento = (Object[]) consulta.getSingleResult();
        
        Almacen movimiento = new Almacen();
        
        movimiento.setId(Integer.parseInt(String.valueOf(rawMovimiento[0])));
        movimiento.setTipoMovimiento(String.valueOf(rawMovimiento[1]));
        movimiento.setFechaMovimiento(String.valueOf(rawMovimiento[2]));
        movimiento.setDescripcion(String.valueOf(rawMovimiento[3]));
        
        Usuario cliente = new Usuario();
        cliente.setNombre(String.valueOf(rawMovimiento[4]));
        movimiento.setIdCliente(cliente);
        
        Usuario usuario = new Usuario();
        usuario.setNombre(String.valueOf(rawMovimiento[5]));
        movimiento.setIdUsuario(usuario);
        
        this.closeEntityManager();
        return movimiento;
    }
       
    public List<Object[]> getDetalleAlmacen(String idMovimiento){
        String query = "select detalle.id, detalle.cantidad, disco.titulo, disco.precio from Detalle detalle " +
            "join Disco disco " +
            "on disco.id = detalle.id_disco " +
            "where id_movimiento = "+ idMovimiento +";";
        this.openEntityManager();
        Query result =  em.createNativeQuery(query);
        List <Object[]> detalle = result.getResultList();
        
        this.closeEntityManager();
        return detalle;
    }
    
    
    public int devolucion(String idMovimiento){        
        this.openEntityManager();
        Query q1 = em.createNativeQuery("select detalle.id_disco, detalle.cantidad from Detalle detalle where detalle.id_movimiento = "+ idMovimiento+";");
        List <Object[]> detalles = q1.getResultList();
        
        for (Object[] detalle : detalles) {
            int idDisco = Integer.parseInt(String.valueOf(detalle[0]));
            int discoCantidadDevuelta = Integer.parseInt(String.valueOf(detalle[1]));
            
            Query q2 = em.createNativeQuery("select disco.existencia from Disco where id = "+idDisco+";");
            Object disco =  q2.getSingleResult();
            int discoCantidad = Integer.parseInt(String.valueOf(disco));
            
            Query q3 = em.createNativeQuery("update Disco set existencia = " + (discoCantidad + discoCantidadDevuelta) + " where id = " + idDisco + ";");
            q3.executeUpdate();
        }
        
        Query q4 = em.createNativeQuery("update Almacen set devuelto = true where id = " + idMovimiento + ";");
        int i = q4.executeUpdate();
        this.closeEntityManager();
        
        return i;
    }
    
   
}
