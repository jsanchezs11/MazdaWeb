/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Hibernate.HibernateUtil;
import Hibernate.HibernateUtil;
import Hibernate.HibernateUtil;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Sala_04
 */
public class ServicioAdmin {
    
    public static ServicioAdmin instance = null;

    public static ServicioAdmin instance() {

        if (instance == null) {
            instance = new ServicioAdmin();
        }

        return instance;
    }
    
    public List<Usuario> listaUsuarios() {

        List<Usuario> listaUsuarios = new ArrayList<>();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tr = null;

        try {
            tr = session.getTransaction();
            tr.begin();
            listaUsuarios = session.createQuery("from Usuario").list();
            tr.commit();
        } catch (Exception e) {
            if (tr != null) {
                tr.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return listaUsuarios;
    }
    
    public void eliminarUsuario(Usuario usuario) {

        Session sesion = HibernateUtil.getSessionFactory().openSession();

        Transaction tr = null;
        try {
            if (!usuario.getNombreUsuario().isEmpty() && !usuario.getClave().isEmpty()) {
                tr = sesion.getTransaction();
                tr.begin();
                sesion.delete(usuario);
                tr.commit();
            }

        } catch (Exception ex) {
            if (tr != null) {
                tr.rollback();
            }
            ex.printStackTrace();
        } finally {
            sesion.close();
        }

    }
    
    public boolean registrarProducto(Producto producto) {

        boolean reg = false;

        Session sesion = HibernateUtil.getSessionFactory().openSession();
        if (existeProducto(producto)) {
            reg = false;
        }

        Transaction tr = null;
        try {
            if (producto != null) {
                tr = sesion.getTransaction();
                tr.begin();
                sesion.saveOrUpdate(producto.getIdProducto());
                tr.commit();
                reg = true;
            }

        } catch (Exception e) {
            if (tr != null) {
                tr.rollback();
            }
            e.printStackTrace();
        } finally {
            sesion.close();
        }
        return reg;
    }

    public boolean existeProducto(Producto producto) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        boolean resultado = false;
        Transaction tr = null;

        try {
            tr = session.getTransaction();
            tr.begin();
            Query query = session.createQuery("from Producto where idProducto='" + producto.getIdProducto() + "'");
            Producto p = (Producto) query.uniqueResult();
            tr.commit();
            if (p != null) {
                resultado = true;
            }
        } catch (Exception ex) {
            if (tr != null) {
                tr.rollback();
            }
        } finally {
            session.close();
        }
        return resultado;
    }

}
