/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Asus
 */
public class ServletPedido extends HttpServlet {

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
        
        Usuario usuario = (Usuario) request.getSession().getAttribute("Usuario");
        
        List<CarroCompras> carritos = ServicioLogin.instance().listaCarritos(usuario);
        
        String medioPago = request.getParameter("medioPago");
        
        Date fecha = new Date();
        
        
        for (CarroCompras carrito : carritos) {
            if (carrito.getEstado().equalsIgnoreCase("activo")) {
                
                Set<Producto> productos = carrito.getProductos();
                
                double total;
                double total1 = 0;
                double total2 = 0;
                
                for (Producto p : productos){
                    
                    if(p.getAccesorio() != null){
                        total1 = total1+ p.getAccesorio().getPrecio();
                    }
                    
                    if(p.getVehiculo() != null){
                        total2 = total2 + p.getVehiculo().getPrecio();
                    }
                    
                }
                
                total = total1 + total2;
                
                Pedido pedido = new Pedido(carrito, total, fecha, medioPago);
                
                ServicioRegistro.instance().nuevoPedido(pedido);
                
                
            }
        }
        
        response.sendRedirect("pedidos.jsp");
        
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
