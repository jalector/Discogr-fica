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
}
