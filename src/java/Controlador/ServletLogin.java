/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.*;
import Modelo.ServicioLogin;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Asus
 */
public class ServletLogin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String nombre = request.getParameter("nombreInicio");
        String clave = request.getParameter("claveInicio");

        Usuario usuario = ServicioLogin.instance().buscarUsuarioPorNombre(nombre);
        
        boolean resultado = ServicioLogin.instance().autenticacion(nombre, clave);
        
        List<Usuario> lista = ServicioAdmin.instance().listaUsuarios();
        List<CarroCompras> listacarritos = ServicioLogin.instance().listaCarritos(usuario);
        List<Producto> catalogo = ServicioLogin.instance().listarCatalogo();
        
        if (resultado) {
            
            if (usuario.getRolUsuario().getTipo().equalsIgnoreCase("admin")) {
                
                request.getSession().setAttribute("nombreUsuario", usuario.getNombre());
                request.getSession().setAttribute("Usuario", usuario);
                request.getSession().setAttribute("catalogo", catalogo);
                request.getSession().setAttribute("lista", lista);
                response.sendRedirect("admin.jsp");
                request.getSession().setAttribute("mensaje", "Sesion cerrada.");       
                
            }else{
                request.getSession().setAttribute("nombreUsuario", usuario.getNombre());
                request.getSession().setAttribute("listaCarritos", listacarritos);
                request.getSession().setAttribute("Usuario", usuario);
                request.getSession().setAttribute("catalogo", catalogo);
                response.sendRedirect("paginaInicio.jsp");
                request.getSession().setAttribute("mensaje", "Sesion cerrada.");
            }
            
            
        } else {
            request.getSession().setAttribute("mensaje", "Acceso incorrecto");
            response.sendRedirect("inicioSesion.jsp");
            
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
