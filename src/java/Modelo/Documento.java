package Modelo;
// Generated 24-nov-2017 2:45:09 by Hibernate Tools 4.3.1



/**
 * Documento generated by hbm2java
 */
public class Documento  implements java.io.Serializable {


     private Integer idDocumento;
     private Pedido pedido;
     private TipoDocumento tipoDocumento;
     private String formato;

    public Documento() {
    }

    public Documento(Pedido pedido, TipoDocumento tipoDocumento, String formato) {
       this.pedido = pedido;
       this.tipoDocumento = tipoDocumento;
       this.formato = formato;
    }
   
    public Integer getIdDocumento() {
        return this.idDocumento;
    }
    
    public void setIdDocumento(Integer idDocumento) {
        this.idDocumento = idDocumento;
    }
    public Pedido getPedido() {
        return this.pedido;
    }
    
    public void setPedido(Pedido pedido) {
        this.pedido = pedido;
    }
    public TipoDocumento getTipoDocumento() {
        return this.tipoDocumento;
    }
    
    public void setTipoDocumento(TipoDocumento tipoDocumento) {
        this.tipoDocumento = tipoDocumento;
    }
    public String getFormato() {
        return this.formato;
    }
    
    public void setFormato(String formato) {
        this.formato = formato;
    }




}


