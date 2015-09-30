<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- META QUE AJUSTA LA ESCALA DE VISIONADO EN MOVILES --%> 
    <meta name="viewport" content="width=device-width, initial-scale=20" />
    <title>EVE - Bot Conversacional</title>
<%-- AÑADO LINEA PARA HOJA CSS escritorio/movil --%>
    <link href="escritorio.css" rel="stylesheet" type="text/css" media="screen" />
    <link href="movil.css" rel="stylesheet" type="text/css" media="handheld, only screen and (max-device-width: 480px)" />
  </head>

  
  <body>
    <% request.setCharacterEncoding("UTF-8");%>
    <div class="pantalla">
          <div class="pregunta"> 
              <%ArrayList<String> conversacion = new ArrayList<String>();%>
              <%
            String nombreUsu ="";
                // PANTALLA INICIAL PRIMERA VEZ
                conversacion.add(randomPideNombre());
                out.print(">"+conversacion.get(0));
                %><br>
                <form method="post" action="inicio.jsp"  autocomplete="off">
                > <input type="text" name="nombreUser" autofocus="autofocus">
                <input type="hidden" name="respuestaBot" value="<%=conversacion.get(0)%>">
                <input type="hidden" name="primeraVez" value="si">
                </form>
              <%// FIN PANTALLA INICIAL PRIMERA VEZ%>      
          </div>     
    </div>
  </body>
</html>
<%!
// FUNCIONES A USAR
public static String randomPideNombre() {
      String salida ="";
        int random = (int) (Math.random()*14);
        switch (random){
          case 0: salida =" ¿Cómo te llamas?";
            break;
          case 1: salida =" No nos han presentado, escribe tu nombre.";
            break;
          case 2: salida =" Saludos humano, dime tu nombre.";
            break;
          case 3: salida =" Escribe tu nombre usuario humano.";
            break;
          case 4: salida =" Ey! ¿Cómo te llamas?";
            break;
          case 5: salida =" Hola,...¿Cual es tu nombre?.";
            break;
          case 6: salida =" Dame tu nombre y quizás te daré el mio.";
            break;
          case 7: salida =" Necesito tu nombre de humano ¿Cual es?";
            break;
          case 8: salida =" Como en toda conversación normal, necesito tu nombre.";
            break;
          case 9: salida =" Para dirigerme a tí, necesito tu nombre.";
            break;
          case 10: salida =" ¿Cual es tu nombre?";
            break;
          case 11: salida =" Hello! Dame tu nombre por favor";
            break;
          case 12: salida =" Escribe el nombre con el que quieres que te llame.";
            break;
          case 13: salida =" Me gustaría saber tu nombre: ";
        }
        return salida;
}             
    %>
