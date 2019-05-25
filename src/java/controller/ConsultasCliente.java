/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

/**
 *
 * @author Saul
 */
public class ConsultasCliente implements Serializable{
    
    public ConsultasCliente(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
    
    public List<Object[]> clientes(){
        String clientes = "SELECT id, nombre, apellidos, telefono, direccion, correo FROM Usuario where tipo_usuario='Cliente'";
        EntityManager em = getEntityManager();
        Query consulta = em.createNativeQuery(clientes);
        List<Object[]> listaCliente = consulta.getResultList();
        return listaCliente;
    }
    
    public List<Object[]> obtenerDetallesCliente(int id){
        String clientes = "SELECT id, nombre, apellidos, contrasenia, telefono, direccion, correo, id_usuario_alta, fecha_alta, id_usuario_modificacion, fecha_modificacion FROM Usuario where id="+id;
        EntityManager em = getEntityManager();
        Query consulta = em.createNativeQuery(clientes);
        List<Object[]> listaCliente = consulta.getResultList();
        return listaCliente;
    }
    
}
