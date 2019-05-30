
package model; 

import java.sql.Connection; 
import java.sql.DriverManager; 
import java.sql.ResultSet;
import java.sql.Statement;

 public class ConectaBD {    
     public static Connection con=null;
     private static String bd = "discografica"; 
     public static String usuario = "root";   
     public static String passw = ""; 
     public static String url = "jdbc:mysql://localhost/"+bd; 
     
     public static Connection abrir(){      
         try{             
             Class.forName("com.mysql.jdbc.Driver");
             con = DriverManager.getConnection(url,usuario,passw); 
             System.out.println("Conexión exitosa:"+con);                      
         } catch (Exception e) {         
             System.out.println("Error en la conexion...");  
             e.printStackTrace();            
             return null;        
         }       
         return con;  
     }        
     
     public static void cerrar(){     
         try{            
             if(con != null) 
                 con.close(); 
         } catch (Exception e){ 
             System.out.println("Error: No se logro cerrar la conexion:\n"+e);
         }
     }
     
      public boolean registrarSalida (int cantidad, int id_disco, int id_mov ) { 
      int resultUpdate = 0;
      Connection conn = null;
      Statement stm=null;  
      ResultSet usuarioResultSet;
      try{
          if(cantidad>0){
          conn = ConectaBD.abrir();
          stm = conn.createStatement();
          resultUpdate=stm.executeUpdate
        ("insert into Detalle values(0,"+cantidad+","+id_disco+","+id_mov+")");
          if(resultUpdate != 0){   
             ConectaBD.cerrar();  
             return true;
          }else{        
             ConectaBD.cerrar();  
             return false;      
          }
        }return false;  
      } catch (Exception e) {  
          System.out.println("Error en la base de datos."); 
          e.printStackTrace();          
          return false; 
      } 
  }
      public boolean actualizarDisco (int existencia,int id ) { 
      int resultUpdate = 0;
      Connection conn = null;
      Statement stm=null;  
      ResultSet usuarioResultSet;
      try{
          
          conn = ConectaBD.abrir();
          stm = conn.createStatement();
          resultUpdate=stm.executeUpdate
        ("UPDATE Disco SET existencia ="+existencia+" WHERE id="+id+"");
          if(resultUpdate != 0){   
             ConectaBD.cerrar();  
             return true;
          }else{        
             ConectaBD.cerrar();  
             return false;      
          }
          
         
      } catch (Exception e) {  
          System.out.println("Error en la base de datos."); 
          e.printStackTrace();          
          return false; 
      } 
  }
  
      
        public boolean registrarAlmacen (String tipo, String fecha,String descripcion,int id_usuario,int id_cliente) { 
      int resultUpdate = 0;
      Connection conn = null;
      Statement stm=null;  
      ResultSet usuarioResultSet;
      try{
          
          conn = ConectaBD.abrir();
          stm = conn.createStatement();
          resultUpdate=stm.executeUpdate
        ("insert into Almacen values(0,'"+tipo+"','"+fecha+"','"+descripcion+"',"+id_usuario+","+id_cliente+")");
          if(resultUpdate != 0){   
             ConectaBD.cerrar();  
             return true;
          }else{        
             ConectaBD.cerrar();  
             return false;      
          }
         
      } catch (Exception e) {  
          System.out.println("Error en la base de datos."); 
          e.printStackTrace();          
          return false; 
      } 
  }
         public int lastAlmacen(){  
      int resultUpdate = 0;
      Connection conn = null;
      Statement stm=null;  
      ResultSet usuarioResultSet;
      try{ 
          conn = ConectaBD.abrir();
          stm = conn.createStatement();                      
            usuarioResultSet = stm.executeQuery("SELECT MAX(id) id FROM Almacen");  
          if(!usuarioResultSet.next()){     
              System.out.println(" No se encontraron registros");
              ConectaBD.cerrar();  
              return 0;    
          }else{        
                  
              int a =  usuarioResultSet.getInt("id");                                                            
              ConectaBD.cerrar();  
              System.out.println(a);
              return a;   
          }   
      }catch(Exception e){    
          System.out.println("Error en la base de datos.");
          e.printStackTrace(); 
          return 0;  
      } 
  }
          public int getDiscoExistencia(int id_disco){  
      int resultUpdate = 0;
      Connection conn = null;
      Statement stm=null;  
      ResultSet usuarioResultSet;
      try{ 
          conn = ConectaBD.abrir();
          stm = conn.createStatement();                      
            usuarioResultSet = stm.executeQuery("SELECT existencia FROM Disco WHERE id="+id_disco+"");  
          if(!usuarioResultSet.next()){     
              System.out.println(" No se encontraron registros");
              ConectaBD.cerrar();  
              return 0;    
          }else{        
                  
              int a =  usuarioResultSet.getInt("existencia");                                                            
              ConectaBD.cerrar();  
              System.out.println(a);
              return a;   
          }   
      }catch(Exception e){    
          System.out.println("Error en la base de datos.");
          e.printStackTrace(); 
          return 0;  
      } 
  }
  
 } 