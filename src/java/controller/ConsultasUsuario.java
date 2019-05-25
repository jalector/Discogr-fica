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
public class ConsultasUsuario implements Serializable{
    
    public ConsultasUsuario(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
    
    public List<Object[]> usuarios(){
        String usuarios = "SELECT id, nombre, apellidos, telefono, direccion, correo, tipo_usuario FROM Usuario where tipo_usuario!='Cliente'";
        EntityManager em = getEntityManager();
        Query consulta = em.createNativeQuery(usuarios);
        List<Object[]> listaUsuario = consulta.getResultList();
        return listaUsuario;
    }
    
    public List<Object[]> ontenerDetallesUsuario(int id){
        String Discos = "SELECT * FROM Usuario where id="+id +" and tipo_usuario!='Cliente'";
        EntityManager em = getEntityManager();
        Query consulta = em.createNativeQuery(Discos);
        List<Object[]> listaDisco = consulta.getResultList();
        return listaDisco;
    }
    
}
