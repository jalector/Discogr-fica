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
import javax.persistence.Persistence;
import javax.persistence.Query;

/**
 *
 * @author Saul
 */
public class ConsultasCliente implements Serializable{
    
    EntityManagerFactory emf;
    EntityManager em;
    public ConsultasCliente() {
        this.emf = Persistence.createEntityManagerFactory("DiscograficaPU");
        this.em = emf.createEntityManager();
    }
    
    public List<Object[]> clientes(){
        String clientes = "SELECT id, nombre, apellidos, telefono, direccion, correo FROM Usuario where tipo_usuario='Cliente'";
        Query consulta = em.createNativeQuery(clientes);
        List<Object[]> listaCliente = consulta.getResultList();
        return listaCliente;
    }
    
    public List<Object[]> obtenerDetallesCliente(int id){
        String clientes = "SELECT id, nombre, apellidos, contrasenia, telefono, direccion, correo, id_usuario_alta, fecha_alta, id_usuario_modificacion, fecha_modificacion FROM Usuario where id="+id;
        Query consulta = em.createNativeQuery(clientes);
        List<Object[]> listaCliente = consulta.getResultList();
        return listaCliente;
    }
    
    public List<Object[]> buscarCliente(String nombre){
        String Discos = "SELECT id, nombre, apellidos, telefono, direccion, correo FROM Usuario where nombre LIKE '%"+nombre +"%' and tipo_usuario='Cliente'";
        Query consulta = em.createNativeQuery(Discos);
        List<Object[]> listaDisco = consulta.getResultList();
        return listaDisco;
    }
    
}
