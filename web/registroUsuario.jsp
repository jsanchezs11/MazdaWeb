<%-- 
    Document   : registroUsuario
    Created on : 23/11/2017, 12:43:36 PM
    Author     : Ts
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear Usuario</title>
    </head>
    <body>   
        
        <form method="POST" action="ServletRegistro">
            
            <h1>Crear Usuario</h1>
            Nombre de usuario: 
            <br><input type="Text" name="nombreUsuario" style="font-family: Arial; font-size: 12pt;width:210px;height:20px;text-align:left"><br><br>
            Nombre:
            <br><input type="Text" name="nombre" style="font-family: Arial; font-size: 12pt;width:210px;height:20px;text-align:left"><br><br>
            Apellido:
            <br><input type="Text" name="apellido" style="font-family: Arial; font-size: 12pt;width:210px;height:20px;text-align:left"><br><br>
            Clave:
            <br><input type="Password" name="clave" style="font-family: Arial; font-size: 12pt;width:210px;height:20px;text-align:left"><br><br>
            <input type="Submit" name="crear" value="Crear Usuario">
            
        </form>
        
        <% if(request.getSession().getAttribute("mensaje3") != null) { %>
            <h1 style="color: red">
            <%= request.getSession().getAttribute("mensaje3") %>
            </h1>
        <% } %>
        
    </body>
</html>
