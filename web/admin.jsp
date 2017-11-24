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
        
      
        <h2> <font face="arial black">usuarios </font></h2>
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
            <h3><font face="arial black">Ingrese nombre</font></h3>
            <input type="text" name="elimUsuario" id="claveInicio" style="font-family: Arial; font-size: 12pt;width:210px;height:20px;text-align:left">
            <input type="Submit" name="eliminar" value="Eliminar">
            
        </form>

        <h2> <font face="arial black">Catalogo</font></h2>
        <div style="width:100%; overflow:auto">
        <table  border="1" cellpadding="0" cellspacing="0" > <colgroup><col span="7" > </colgroup>
        <tbody>
       

            <%
            List<Producto> productos = (List<Producto>) request.getSession().getAttribute("catalogo");
            DecimalFormat df = new DecimalFormat("$###,###.###");
            
            
            for (Producto p : productos){%>
            
            <% if (p.getVehiculo() != null){%>
            
            <% if (p.getVehiculo().getModelo().equalsIgnoreCase("1")){%>
            <tr > <td rowspan="2"><img src="mazda1.png" width="300px" height="160px"/></td>
            <%}%>
            
            <% if (p.getVehiculo().getModelo().equalsIgnoreCase("2")){%>
                <tr> <td rowspan="2"><img src="mazda2.png" width="300px" height="160px"/></td>
            <%}%>
                    
            <% if (p.getVehiculo().getModelo().equalsIgnoreCase("3")){%>
                <tr> <td rowspan="2"><img src="mazda3.png" width="300px" height="160px"/></td>
            <%}%>
                    
            <% if (p.getVehiculo().getModelo().equalsIgnoreCase("4")){%>
                <tr><td rowspan="2"><img src="mazda4.png" width="300px" height="160px"/></td>
            <%}%>
                    
                <th style="width:10%" >id</th>
                <th style="width:10%">marca</th>
                <th style="width:10%">modelo</th>
                <th style="width:10%">año</th>
                <th style="width:10%">cantidad</th>
                <th style="width:10%">precio</th>
                </tr>

            
            <td align="center"><%= p.getIdProducto() %></td>
            <td align="center"><%= p.getVehiculo().getMarca() %></td>
            <td align="center"><%= p.getVehiculo().getModelo() %></td>
            <td align="center"><%= p.getVehiculo().getAnio() %></td>
            <td align="center"><%= p.getVehiculo().getStock() %></td>
            <td align="center"><%= df.format(p.getVehiculo().getPrecio()) %></td>
            </tr>
            
            <%}%>
               
            <%}
            %>

            </tbody>
            
        </table>
        </div>
        
        <br><br>
        <a href="inicioSesion.jsp">Cerrar Sesion</a>
        
    </body>
</html>

