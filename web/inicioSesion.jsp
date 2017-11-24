<%-- 
    Document   : index
    Created on : 23/11/2017, 12:33:59 PM
    Author     : Ts
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>:: Registro ::</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        
        <img src="http://www.novaeragc.com/wp-content/uploads/2011/11/logoactualMazdadesde1997.jpg" width="300px" height="200px"/>
                <form method="POST" action="ServletLogin">
                    
                    Usuario:
                    <input type="Text" name="nombreInicio" id="nombreInicio" style="font-family: Arial; font-size: 12pt;width:210px;height:20px;text-align:left"><br><br>
                    Clave:&nbsp;&nbsp; &nbsp;
                    <input type="Password" name="claveInicio" id="claveInicio" style="font-family: Arial; font-size: 12pt;width:210px;height:20px;text-align:left"><br><br>
                    &nbsp;&nbsp&nbsp; &nbsp&nbsp; &nbsp&nbsp; &nbsp&nbsp; &nbsp&nbsp; &nbsp<input type="Submit" name="iniciarSesion" value="Iniciar Sesion">
                </form>

                <form method="POST" action="registroUsuario.jsp">
                    <br>&nbsp; &nbsp&nbsp; &nbsp&nbsp; &nbsp&nbsp; &nbsp&nbsp;&nbsp;&nbsp;&nbsp<input type="Submit" name="registrar" value="Registrarse">
                </form>
        
        <% if(request.getSession().getAttribute("mensaje") != null) { %>
            <h1 style="color: red">
            <%= request.getSession().getAttribute("mensaje") %>
            </h1>
        <% } %>
        
    </body>
</html>
