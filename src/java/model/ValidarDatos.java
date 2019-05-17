package model;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class ValidarDatos {
    
    public String validar(String user, String password){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("DiscograficaPU");
        EntityManager em = emf.createEntityManager();
        
        try{
            Usuario usuario = em.find(Usuario.class, Integer.parseInt(user));
            
            if(usuario.getContrasenia().equals(password)){
                return usuario.getTipoUsuario();
            }else{
                return "Incorrecto";
            }
        }catch(Exception e){
            return "Incorrecto";
        }
    }
}