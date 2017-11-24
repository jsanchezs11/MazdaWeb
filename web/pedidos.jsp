<%-- 
    Document   : pedidos
    Created on : 23/11/2017, 12:42:43 PM
    Author     : Ts
--%>

<%@page import="java.util.Set"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="Modelo.*"%>
<%@page import="Modelo.CarroCompras"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carrito de Compras</title>
    </head>
    <body>
        
    <center>
        
        <table border="1" cellpadding="8" cellspacing="0" > 
        
        <tr>
            <th colspan="5" align="center">CARRITO DE COMPRAS</th>
        </tr>

        <tr>
            <th>Id Producto</th>
            <th>Tipo de Producto</th>
            <th>Nombre</th>
            <th>Fecha</th>
            <th>Precio</th>
        </tr>

        <%
            
        List<CarroCompras> carritos = (List<CarroCompras>) request.getSession().getAttribute("lista");
        double total = new Double(request.getSession().getAttribute("total").toString());
        DecimalFormat d = new DecimalFormat("$###,###.###");
        
        String fecha = "dd/MM/yyyy  HH:mm:ss";
        SimpleDateFormat f = new SimpleDateFormat(fecha);
        Date date = new Date();
        
        
        for (CarroCompras c : carritos){
        
        if (c.getEstado().equalsIgnoreCase("activo")) {
        
        Set<Producto> pCarrito = c.getProductos(); 
        
            for (Producto p : pCarrito){%>
            
            <tr>
                <td><%= p.getIdProducto() %></td>
                
                <% if (p.getVehiculo() != null){%>
                
                
                
                    <td>Vehiculo</td>
                    <td><%= p.getVehiculo().getMarca() +" "+ p.getVehiculo().getModelo() %></td>
                    <td><%= f.format(date) %></td>
                    <td><%= d.format(p.getVehiculo().getPrecio()) %></td>
                <%}%>
                
                <% if (p.getAccesorio() != null){%>
                
                
                
                    <td>Accesorio</td>
                    <td><%= p.getAccesorio().getNombre() %></td>
                    <td><%= f.format(date) %></td>
                    <td><%= d.format(p.getAccesorio().getPrecio()) %></td>
                <%}%>
                
            </tr>

            <% 
                //total = total1 + total2; 
            %>
               
            <%}%>
            
        <tr> 
            <th colspan="4" align="right">Total</th>
            <td><%= d.format(total) %></td>   
        </tr>
        <%}%>
        <%}%>
        
        </table>
        
        <br>
        <form method="POST" action="ServletPedido">
           
            <input type="text" name="medioPago" id="medioPago" style="font-family: Arial; font-size: 12pt;width:170px;height:20px;text-align:left">
            <input type="Submit" name="hacerPedido" value="Hacer Pedido">
            
        </form>
        
    </center>
    </body>
</html>
