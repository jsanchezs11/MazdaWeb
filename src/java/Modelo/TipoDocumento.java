package Modelo;
// Generated 24-nov-2017 2:45:09 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * TipoDocumento generated by hbm2java
 */
public class TipoDocumento  implements java.io.Serializable {


     private Integer idTipoDocumento;
     private String nombre;
     private Set documentos = new HashSet(0);

    public TipoDocumento() {
    }

	
    public TipoDocumento(String nombre) {
        this.nombre = nombre;
    }
    public TipoDocumento(String nombre, Set documentos) {
       this.nombre = nombre;
       this.documentos = documentos;
    }
   
    public Integer getIdTipoDocumento() {
        return this.idTipoDocumento;
    }
    
    public void setIdTipoDocumento(Integer idTipoDocumento) {
        this.idTipoDocumento = idTipoDocumento;
    }
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public Set getDocumentos() {
        return this.documentos;
    }
    
    public void setDocumentos(Set documentos) {
        this.documentos = documentos;
    }




}


