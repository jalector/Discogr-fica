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
import model.Disco;

/**
 *
 * @author Saul
 */
public class ConsultasDisco implements Serializable{
    
    EntityManagerFactory emf;
    EntityManager em;
    public ConsultasDisco() {
        this.emf = Persistence.createEntityManagerFactory("DiscograficaPU");
        this.em = emf.createEntityManager();
    }
    
    public List<Object[]> discos(){
        String Discos = "SELECT id, titulo, artista, precio, existencia, genero, ubicacion FROM Disco";
        Query consulta = em.createNativeQuery(Discos);
        List<Object[]> listaDisco = consulta.getResultList();
        return listaDisco;
    }
    
    public List<Object[]> infoGralDisco(){
        String Discos = "SELECT id, titulo, imagen, descripcion, precio FROM Disco";
        Query consulta = em.createNativeQuery(Discos);
        List<Object[]> listaDisco = consulta.getResultList();
        return listaDisco;
    }
    
    public List<Object[]> ontenerUnDisco(int id){
        String Discos = "SELECT id, titulo, artista, imagen, genero, descripcion, precio, existencia FROM Disco where id="+id;
        Query consulta = em.createNativeQuery(Discos);
        List<Object[]> listaDisco = consulta.getResultList();
        return listaDisco;
    }
    
    
    public List<Object[]> ontenerDetallesDisco(int id){
        String Discos = "SELECT * FROM Disco where id="+id;
        Query consulta = em.createNativeQuery(Discos);
        List<Object[]> listaDisco = consulta.getResultList();
        return listaDisco;
    }
    
    public List<Object[]> buscarDisco(String titulo){
        String Discos = "SELECT id, titulo, artista, precio, existencia, genero, ubicacion FROM Disco where titulo LIKE '%"+titulo +"%'";
        Query consulta = em.createNativeQuery(Discos);
        List<Object[]> listaDisco = consulta.getResultList();
        return listaDisco;
    }
    
    public List<Object[]> buscarDiscoDashboard(String titulo){
        String Discos = "SELECT id, titulo, imagen, descripcion, precio FROM Disco where titulo LIKE '%"+titulo +"%'";
        Query consulta = em.createNativeQuery(Discos);
        List<Object[]> listaDisco = consulta.getResultList();
        return listaDisco;
    }
}
