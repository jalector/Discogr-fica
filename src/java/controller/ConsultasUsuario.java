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
public class ConsultasUsuario implements Serializable{
    
    EntityManagerFactory emf;
    EntityManager em;
    public ConsultasUsuario() {
        this.emf = Persistence.createEntityManagerFactory("DiscograficaPU");
        this.em = emf.createEntityManager();
    }
    
    public List<Object[]> usuarios(){
        String usuarios = "SELECT id, nombre, apellidos, telefono, direccion, correo, tipo_usuario FROM Usuario where tipo_usuario!='Cliente'";
        Query consulta = em.createNativeQuery(usuarios);
        List<Object[]> listaUsuario = consulta.getResultList();
        return listaUsuario;
    }
    
    public List<Object[]> obtenerDetallesUsuario(int id){
        String Discos = "SELECT * FROM Usuario where id="+id +" and tipo_usuario!='Cliente'";
        Query consulta = em.createNativeQuery(Discos);
        List<Object[]> listaDisco = consulta.getResultList();
        return listaDisco;
    }
    
    public List<Object[]> buscarUsuario(String nombre){
        String Discos = "SELECT id, nombre, apellidos, telefono, direccion, correo, tipo_usuario FROM Usuario where nombre LIKE '%"+nombre +"%' and tipo_usuario!='Cliente'";
        Query consulta = em.createNativeQuery(Discos);
        List<Object[]> listaDisco = consulta.getResultList();
        return listaDisco;
    }
    
}
