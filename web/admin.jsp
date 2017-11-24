<%-- 
    Document   : admin
    Created on : 23/11/2017, 12:42:14 PM
    Author     : Ts
--%>


<%@page import="Modelo.Producto"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
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
        
        <h1><font face="arial black" color="">Bienvenido <%= request.getSession().getAttribute("nombreUsuario") %> </font></h1><br>
        <h2> <font face="arial black">Lista de usuarios registrados</font></h2>
        <table border="1" cellspacing="0">
            <tr>
            <th>Id</th>
            <th>Rol</th>
            <th>Usuario</th>
            <th>Nombre</th>
            <th>Apellido</th>
            <th>Clave</th>
            
            </tr>
            <%
            List<Usuario> lista = (List<Usuario>) request.getSession().getAttribute("lista");
            for (Usuario u : lista){%>
               <tr>
               <td><%= u.getIdUsuario() %></td>
               <td><%= u.getRolUsuario().getTipo() %></td>
               <td><%= u.getNombreUsuario() %></td>
               <td><%= u.getNombre() %></td>
               <td><%= u.getApellido() %></td>
               <td><%= u.getClave() %></td>
               
               </tr>
            <%}%>
        </table>
        
        <form method="POST" action="ServletAdmin">
            <br>
            <h3><font face="arial black">Ingrese un nombre de usuario:</font></h3>
            <input type="text" name="elimUsuario" id="claveInicio" style="font-family: Arial; font-size: 12pt;width:210px;height:20px;text-align:left">
            <input type="Submit" name="eliminar" value="Eliminar">
            
        </form>

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
        
        <br><br>
        <a href="inicioSesion.jsp">Cerrar Sesion</a>
        
    </body>
</html>

