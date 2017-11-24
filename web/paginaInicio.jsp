<%-- 
    Document   : paginaInicio
    Created on : 23/11/2017, 12:43:20 PM
    Author     : Ts
--%>

<%@page import="Modelo.ServicioLogin"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Set"%>
<%@page import="Modelo.CarroCompras"%>
<%@page import="Modelo.Producto"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="Modelo.Vehiculo"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= request.getSession().getAttribute("nombreUsuario") %></title>
    </head>

    <body>
        
    <center>
        <h1>Bienvenido <%= request.getSession().getAttribute("nombreUsuario") %> </h1>
        
        <h2> <font face="arial black">Catalogo Mazda</font></h2>
        <div style="overflow: scroll; height: 225px; width:45%; overflow:auto">
        <table border="1" CELLSPACING="0" cellpadding="8">
            
            <tr> <th>Producto</th>
            <th colspan="2" >Detalle</th>
            </tr>
            
            <%
            List<Producto> productos = (List<Producto>) request.getSession().getAttribute("catalogo");
            DecimalFormat df = new DecimalFormat("$###,###.###");
            
            
            for (Producto p : productos){%>
            
            <% if (p.getVehiculo() != null){%>
            
            <% if (p.getVehiculo().getModelo().equalsIgnoreCase("6")){%>
                <tr> <td rowspan="6" ><img src="mazda6.png" width="300px" height="160px"/></td>
            <%}%>
            
            <% if (p.getVehiculo().getModelo().equalsIgnoreCase("cx-5")){%>
                <tr> <td rowspan="6" ><img src="cx-5.png" width="300px" height="160px"/></td>
            <%}%>
                    
            <% if (p.getVehiculo().getModelo().equalsIgnoreCase("2")){%>
                <tr> <td rowspan="6" ><img src="mazda2.png" width="300px" height="160px"/></td>
            <%}%>
                    
            <% if (p.getVehiculo().getModelo().equalsIgnoreCase("3")){%>
                <tr><td rowspan="6" ><img src="mazda3.jpg" width="300px" height="160px"/></td>
            <%}%>
                    
            <% if (p.getVehiculo().getModelo().equalsIgnoreCase("cx-9")){%>
                <tr > <td rowspan="6" ><img src="cx-9.png" width="300px" height="160px"/></td>
            <%}%>
            
            <th>Id</th>
            <td><%= p.getIdProducto() %></td>
            </tr>

            <tr> <th>Marca</th>
            <td><%= p.getVehiculo().getMarca() %></td>
            </tr>

            <tr><th>Modelo</th>
            <td><%= p.getVehiculo().getModelo() %></td>
            </tr>

            <tr><th>Año</th>
            <td><%= p.getVehiculo().getAnio() %></td>
            </tr>

            <tr> <th>Precio</th>
            <td><%= df.format(p.getVehiculo().getPrecio()) %></td>
            </tr>

            <tr> <th>Stock</th>
            <td><%= p.getVehiculo().getStock() %></td>
            </tr>
            
            <%}%>
            
               
               <% if (p.getAccesorio() != null){%>
                    <tr><td rowspan="4"><img src="logo mazda.png" width="300px" height="160px"/></td>
                    <th>Id</th>
                    <td><%= p.getIdProducto() %></td>
                    </tr>

                    <tr><th>Accesorio</th>
                    <td><%= p.getAccesorio().getNombre() %></td>
                    </tr>

                    <tr> <th>Precio</th>
                    <td><%= df.format(p.getAccesorio().getPrecio()) %></td>
                    </tr>

                    <tr> <th>Stock</th>
                    <td><%= p.getAccesorio().getStock() %></td>
                    </tr>
               <%}%>
               
            <%}
            %>
        </table>
        </div>
        
        <form method="POST" action="ServletCarrito">
            
            <h3><font face="arial black">Ingrese el Id del producto</font></h3>
            <input type="text" name="producto" id="producto" style="font-family: Arial; font-size: 12pt;width:70px;height:20px;text-align:left">
            <input type="Submit" name="agregarProducto" value="Agregar al carrito">
            
        </form>
       
        <br>
        <a href="pedidos.jsp"><h4><font face="arial">Ver Carro de Compras</font></h4></a>
        
    </center>
        <a href="inicioSesion.jsp"><h4><font face="arial">Cerrar Sesion</font></h4></a>
        
    </body>
</html>
