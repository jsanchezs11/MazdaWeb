/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Asus
 */
@WebServlet(name = "ServletRegistro", urlPatterns = {"/ServletRegistro"})
public class ServletRegistro extends HttpServlet {

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
        
        String nombreUsuario = request.getParameter("nombreUsuario");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String clave = request.getParameter("clave");
        RolUsuario rolCliente = ServicioLogin.instance().solicitarRolUsuario("cliente");
        Catalogo catalogo = ServicioLogin.instance().solicitarCatalogo("md");
        
        Usuario usuario = new Usuario(catalogo, rolCliente, nombreUsuario, nombre, apellido, clave);

        CarroCompras carro = new CarroCompras(usuario, "activo");
        
        boolean autenticacion = ServicioRegistro.instance().registrarUsuario(usuario);
        boolean nuevoCarro = ServicioRegistro.instance().nuevoCarrito(carro);

        if (autenticacion && nuevoCarro) {
            response.sendRedirect("inicioSesion.jsp");
        } else{
            response.sendRedirect("registroUsuario.jsp");
            request.getSession().setAttribute("mensaje3", "No fue posible registrar su usuario.");
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
