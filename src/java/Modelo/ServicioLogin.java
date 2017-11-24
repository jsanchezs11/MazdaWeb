/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;


import Hibernate.HibernateUtil;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Asus
 */
public class ServicioLogin {

    public static ServicioLogin instance = null;

    public static ServicioLogin instance() {

        if (instance == null) {
            instance = new ServicioLogin();
        }

        return instance;
    }

    public boolean autenticacion(String nombre, String clave) {

        boolean aut = false;

        Usuario usuario = buscarUsuarioPorNombre(nombre);
        if (usuario != null && usuario.getNombreUsuario().equals(nombre) && usuario.getClave().equals(clave)) {
            aut = true;
        }

        return aut;
    }

    public Usuario buscarUsuarioPorNombre(String nombre) {

        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Transaction tr = null;
        Usuario usuario = null;

        try {
            tr = sesion.getTransaction();
            tr.begin();
            Query query = sesion.createQuery("from Usuario where nombreUsuario='" + nombre + "'");
            usuario = (Usuario) query.uniqueResult();
            tr.commit();
        } catch (Exception e) {
            if (tr != null) {
                tr.rollback();
            }
            e.printStackTrace();
        } finally {
            sesion.close();
        }
        return usuario;
    }

    public Catalogo solicitarCatalogo(String nombre) {

        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Transaction tr = null;
        Catalogo catalogo = null;

        try {
            tr = sesion.getTransaction();
            tr.begin();
            Query query = sesion.createQuery("from Catalogo where nombre='" + nombre + "'");
            catalogo = (Catalogo) query.uniqueResult();
            tr.commit();
        } catch (Exception e) {
            if (tr != null) {
                tr.rollback();
            }
            e.printStackTrace();
        } finally {
            sesion.close();
        }
        return catalogo;
    }

    public RolUsuario solicitarRolUsuario(String tipo) {

        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Transaction tr = null;
        RolUsuario rol = null;

        try {
            tr = sesion.getTransaction();
            tr.begin();
            Query query = sesion.createQuery("from RolUsuario where tipo='" + tipo + "'");
            rol = (RolUsuario) query.uniqueResult();
            tr.commit();
        } catch (Exception e) {
            if (tr != null) {
                tr.rollback();
            }
            e.printStackTrace();
        } finally {
            sesion.close();
        }
        return rol;
    }
    
    public Producto solicitarProducto(int idProducto) {

        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Transaction tr = null;
        Producto producto = null;

        try {
            tr = sesion.getTransaction();
            tr.begin();
            Query query = sesion.createQuery("from Producto where idProducto='" + idProducto + "'");
            producto = (Producto) query.uniqueResult();
            tr.commit();
        } catch (Exception e) {
            if (tr != null) {
                tr.rollback();
            }
            e.printStackTrace();
        } finally {
            sesion.close();
        }
        return producto;
    }

    public List<CarroCompras> listaCarritos(Usuario usuario) {
        
        List<CarroCompras> listaCarritos = new ArrayList<>();
        Session session = HibernateUtil.getSessionFactory().openSession();
        //Transaction tr = null;

        try {
            //tr = session.getTransaction();
            //tr.begin();
            listaCarritos = session.createQuery("from CarroCompras where Usuario_idUsuario='"+usuario.getIdUsuario()+"'").list();
            //tr.commit();
        } catch (Exception e) {
            /*if (tr != null) {
                tr.rollback();
            }*/
            e.printStackTrace();
        } finally {
            session.close();
        }
        return listaCarritos;
    }
    
    public List<Producto> listarCatalogo() {

        List<Producto> listaProductos = new ArrayList<>();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tr = null;

        try {
            tr = session.getTransaction();
            tr.begin();
            listaProductos = session.createQuery("from Producto").list();
            tr.commit();
        } catch (Exception e) {
            if (tr != null) {
                tr.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return listaProductos;
    }

    
    
}
