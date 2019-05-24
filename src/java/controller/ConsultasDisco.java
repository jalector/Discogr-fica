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
public class ConsultasDisco implements Serializable{
    
    public ConsultasDisco(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
    
    public List<Object[]> discos(){
        String Discos = "SELECT id, titulo, artista, precio, existencia, genero, ubicacion FROM Disco";
        EntityManager em = getEntityManager();
        Query consulta = em.createNativeQuery(Discos);
        List<Object[]> listaDisco = consulta.getResultList();
        return listaDisco;
    }
    
    public List<Object[]> infoGralDisco(){
        String Discos = "SELECT id, titulo, imagen, descripcion FROM Disco";
        EntityManager em = getEntityManager();
        Query consulta = em.createNativeQuery(Discos);
        List<Object[]> listaDisco = consulta.getResultList();
        return listaDisco;
    }
    
    public List<Object[]> ontenerUnDisco(int id){
        String Discos = "SELECT id, titulo, artista, imagen, genero, descripcion FROM Disco where id="+id;
        EntityManager em = getEntityManager();
        Query consulta = em.createNativeQuery(Discos);
        List<Object[]> listaDisco = consulta.getResultList();
        return listaDisco;
    }
    
}
