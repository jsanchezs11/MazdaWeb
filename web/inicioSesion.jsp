<%-- 
    Document   : index
    Created on : 23/11/2017, 12:33:59 PM
    Author     : Ts
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>:: Login ::</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        
        <h1>Iniciar Sesion</h1>
                
                <form method="POST" action="ServletLogin">
                    
                    Usuario:<br>
                    <input type="Text" name="nombreInicio" id="nombreInicio" style="font-family: Arial; font-size: 12pt;width:210px;height:20px;text-align:left"><br><br>
                    Clave:<br>
                    <input type="Password" name="claveInicio" id="claveInicio" style="font-family: Arial; font-size: 12pt;width:210px;height:20px;text-align:left"><br><br>
                    <input type="Submit" name="iniciarSesion" value="Iniciar Sesion">
                </form>

                <form method="POST" action="registroUsuario.jsp">
                    <br><input type="Submit" name="registrar" value="Registrarse">
                </form>
        
        <% if(request.getSession().getAttribute("mensaje") != null) { %>
            <h1 style="color: red">
            <%= request.getSession().getAttribute("mensaje") %>
            </h1>
        <% } %>
        
    </body>
</html>
