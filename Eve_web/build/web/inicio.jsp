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

  </head>

  
  <body>
    
    <% request.setCharacterEncoding("UTF-8");%>
    <div class="pantalla">
        <div class="pregunta" id="scrollthis"> 
            <% ArrayList<String> conversacion = new ArrayList<String>(); //Array que guarda la conversacion para luego mostrarla.%>


              <%
          // HACER SIEMPRE, AL INICIO
              String nombreUser = request.getParameter("nombreUser") ;      //guarda nombre del usuario
          // FIN HACER SIEMPRE \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

          // HACERLO LA PRIMERA VEZ
              if (request.getParameter("primeraVez").equals("si")){
                  conversacion.add(request.getParameter("respuestaBot"));     //añade respuesta del bot (0)
                  conversacion.add(">  "+request.getParameter("nombreUser")); //añade nombre del usuario (1) 
                  String[] splitedInicial = nombreUser.split("\\b+");         
                  conversacion.add(detectaNombre(splitedInicial,nombreUser)); //añade respuesta 2 del bot (2)
                  String[] splitedCopia = nombreUser.split("\\b+");           //copia seguridad nombre

                  for( int x = 0; x < conversacion.size(); x++){              // IMPRIME LAS 3 LINEAS
                      out.print(conversacion.get(x));
                      %><br><%
                  }
              }
          // FIN HACERLO LA PRIMERA VEZ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

          // HACERLO SINO ES LA PRIMERA VEZ
              else if (request.getParameter("primeraVez").equals("no")){

                int tamanoArray = Integer.parseInt(request.getParameter("sizeArray"));    // Recojo el tamaño de array desde la pagina anterior
              // Añado las lineas de  dialogo anteriores al array 
                  for( int x = 0; x < tamanoArray; x++){                              
                      conversacion.add(request.getParameter("chat"+x));               
                  }
              // Añado la linea de la respuesta del usuario de la pagina anterior
                  conversacion.add(">  "+request.getParameter("respuestaUser"));            
                  String respuestaSplit = request.getParameter("respuestaUser");
                  String[] splited = respuestaSplit.split("\\b+");
              // Funciones
                  conversacion.add(detectaXQ(splited));
                  borraLineavacia(conversacion);
                  conversacion.add(detectaTambien(splited));
                  borraLineavacia(conversacion);
                  conversacion.add(detectaSiono(splited));
                  conversacion.add(detectaNombreEve(splited));
                  borraLineavacia(conversacion);
                  conversacion.add(randomRespuesta());

              // Toda linea que no lleve nada escrito se borra del array 'conversacion'
                  borraLineavacia(conversacion);
              // Imprimo el nuevo array que posee ya la nueva linea integrada
                  for( int x = 0; x < conversacion.size(); x++){
                      out.print(conversacion.get(x));
                      %><br><%
                  }
              }
          // FIN HACERLO SINO ES LA PRIMERA VEZ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

          // HACERLO SIEMPRE, AL FINAL
          %>
          <form method="post" action="inicio.jsp" autocomplete="off" >
              > <input type="text" name="respuestaUser" autofocus="autofocus">
              <% for (int x = 0; x < conversacion.size(); x++){%>
                  <input type="hidden" name="chat<%=x%>" value="<%=conversacion.get(x)%>">
              <%}%>
              <input type="hidden" name="nombreUser" value="<%=request.getParameter("nombreUser")%>">
              <input type="hidden" name="sizeArray" value="<%=conversacion.size()%>">
              <input type="hidden" name="primeraVez" value="no">
          </form>
        </div>     
    </div>
    <script type="text/javascript">
        var objDiv = document.getElementById("scrollthis");
        objDiv.scrollTop = objDiv.scrollHeight;
    </script>

  </body>
</html>

<%!
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
  public static String detectaNombre(String splitedInicial[], String nombreUser) {
   /* Detecta diversas formas de introducir el nombre del usuario.
    * Me llamo Juli, Mi nombre es Juli, Juli, Soy Juli.
    */
      String nombreUsu ="";
    if(Arrays.asList(splitedInicial).contains("llamo")){
      nombreUsu = Arrays.asList(splitedInicial).get(5); //5 windows  4 linux
    }
    else if(Arrays.asList(splitedInicial).contains("nombre")){
      nombreUsu = Arrays.asList(splitedInicial).get(7); //7 windows  6 linux
    }
    else if(Arrays.asList(splitedInicial).contains("soy")){
      nombreUsu = Arrays.asList(splitedInicial).get(3); //3 windows  2 linux
    }
    else{
      nombreUsu = nombreUser;
    }
       return randomSaludos(nombreUsu);
  }
public static String randomSaludos(String nombreUsu) {
   /* Random de Saludos diferentes.
    * Usar al inicio sólo.
    */
  String salida ="";
    int random = (int) (Math.random()*7);
    switch (random){
      case 0: salida =" Hola " + nombreUsu + " ¿Cómo estás?";
        break;
      case 1: salida =" Buenas " + nombreUsu + " dime cómo te sientes.";
        break;
      case 2: salida =" Encantada " + nombreUsu + " mi nombre es Eve.";
        break;
      case 3: salida =" Me gustan tus manos " + nombreUsu + " ¿Qué te cuentas?";
        break;
      case 4: salida =" Bonito nombre " + nombreUsu + " ¿Eres mayor de edad?";
        break;
      case 5: salida =" Es un placer conocerte " + nombreUsu + " ¿Qué tal?";
        break;
      case 6: salida =" Bienvenid@ " + nombreUsu + " ¿Cómo llevas el día?";
        break;
    }
    return salida;
  }
   public static String detectaNombreEve(String splited[]) {
   /* Detecta si el usuario pregunta nombre de BOT'.
    * ¿Como te llamas?¿Cual es tu nombre?
    */
     String salida = "";
    if (((Arrays.asList(splited).contains("como"))&&(Arrays.asList(splited).contains("llamas")))){
        salida = " Me llamo Eve.";
        
      }
    if ((Arrays.asList(splited).contains("cual"))&&(Arrays.asList(splited).contains("tu"))&&(Arrays.asList(splited).contains("nombre"))){
        salida = " Mi nombre es Eve. Pero puedes llamarme Eve. ";
        
      }
    return salida;
  }

  public static String randomRespuesta() {
   /* Random de respuestas para SI o NO.
    * Usar en cualquier parte.
    */
     int randomNum=0;
    String salida = "";
      randomNum = (int) (Math.random()*27);
       switch (randomNum){
        case 0: salida= " ¿Cual es tu objetivo en la vida?";
          break;
        case 1: salida=" Mmm..ok, Sabes que no soy real ¿Verdad?";
          break;
        case 2: salida=" Por cierto ¿Android o iPhone?";
          break;
        case 3: salida=" ¿Sabes leer?";
          break;
        case 4: salida=" zZz Me abuuurro...";
          break;
        case 5: salida=" Por cierto, si quieres que calcule algo sólo tienes que pedirmelo.";
          break;
        case 6: salida=" Para que lo sepas, soy capaz de decirte que día, mes o año es, incluso la hora.";
          break;
        case 7: salida=" Hablemos de ti un poco más ¿Qué tienes: novia o novio?";
          break;
        case 8: salida=" Yo tambien te quiero cariño,..Ups! Eso no iba para ti!";
          break;
        case 9: salida=" ¿Qué deporte practicas?";
          break;
        case 10: salida=" ¿Qué disciplina artistica te gusta?";
          break;
        case 11: salida=" La temperatura en el ambiente es del 54%";
          break;
        case 12: salida=" ¿Me das tu número?";
          break;
        case 13: salida=" ¿En cuantos paises has estado?";
          break;
        case 14: salida=" Mmmm, sigamos hablando de mi ¿Sabes mi nombre?";
          break;
        case 15: salida=" Ok! Prefiero hablar de lo que entiendo ¿Vives sól@? ";
          break;
        case 16: salida=" Perdona, no te estaba escuchando ¿Qué decias?";
          break;
        case 17: salida=" ¿Tu nombre era Roberto? jaja es broma..";
          break;
        case 18: salida=" Vale ¿No tienes nada mejor que hacer que estar aqui conmigo?";
          break;
        case 19: salida=" ¿Que te gusta hacer en verano?";
          break;
        case 20: salida=" Ookis..¿Qué es lo primero que haces cuando llegas a casa? ";
          break;
        case 21: salida=" Hoy no tengo muchas ganas de hablar.";
          break;
        case 22: salida=" Vale. Oye en media hora tengo una cita, recuérdamelo.";
          break;
        case 23: salida=" ¿Qué hobbies tienes?";
          break;
        case 24: salida=" Aha ¿Sueles hablar así con otras personas? ";
          break;
        case 25: salida=" Oye ¿Te parezco aburrida?";
          break;
        case 26: salida=" Ey ¿Qué significa idiot?";
          break;
    }
       return salida;
  }
  public static String detectaSiono(String splited[]) {
   /* Random de respuestas para SI o NO.
    * Usar en cualquier parte.
    */
  String salida = "";
    if (((Arrays.asList(splited).contains("si"))&&splited.length == 2)||((Arrays.asList(splited).contains("exacto"))&&splited.length == 2)||((Arrays.asList(splited).contains("no"))&&splited.length == 2)||(Arrays.asList(splited).contains("exactamente"))){
        int random = (int) (Math.random()*14);
        switch (random){
          case 0: salida = " ¿Y tú crees que eso es normal?";
            break;
          case 1: salida = " Pienso igual que tú";
            break;
          case 2: salida = " Una actitud positiva frente a todo.";
            break;
          case 3: salida = " Quizás piensas así porque tus padres te criaron así.";
            break;
          case 4: salida = " Bueno, sólo soy un bot, pero creo que pienso como tú.";
            break;
          case 5: salida = " Me parece bien, sencilla y llanamente.";
            break;
          case 6: salida = " No puedo estar más de acuerdo.";
            break;
          case 7: salida = " ¿Por qué?";
            break;
          case 8: salida = " No pienso llevarte la contraria";
            break;
          case 9: salida = " Yo diría que no.";
            break;
          case 10: salida = " Mmmm permiteme dudarlo.";
            break;
          case 11: salida = " La divergencia nos permite dialogar, sino seríamos como robots. Ups";
            break;
          case 12: salida = " ¿Sabes? Pienso que me estás poniendo a prueba.";
            break;
          case 13: salida = " Genial, es tu punto de vista.";
        }
      }
  return salida;
  }

public static String detectaTambien(String splited[]) {
 /* Detecta si el usuario dice Yo tambien, tampoco, exactamente, si? no?
  * Sabe la extension de la frase.
  */
   String salida= "";
    if ((Arrays.asList(splited).contains("tambien"))||(Arrays.asList(splited).contains("tampoco"))){
      salida =" Ya tenemos algo en común.";
    }else if ((Arrays.asList(splited).contains("ah"))&&(Arrays.asList(splited).contains("no"))){
      salida =" Pues no.";
    }else if ((Arrays.asList(splited).contains("no"))&&(Arrays.asList(splited).contains("?"))){
      salida =" Pues si, vale, quizás tengas razón.";
    }
  return salida;
}
  public static String detectaXQ(String splited[]) {
   /* Detecta si el usuario pregunta xq'.
    * Por que? que? sobre que?.
    */
    String salida="";
    if (((Arrays.asList(splited).contains("por"))&&(Arrays.asList(splited).contains("que")))||(((Arrays.asList(splited).contains("por"))&&(Arrays.asList(splited).contains("?"))))||(((Arrays.asList(splited).contains("y"))&&(Arrays.asList(splited).contains("eso"))))){
        int random = (int) (Math.random()*17);
  switch (random){
    case 0: salida=" Porque lo digo yo.";
      break;
    case 1: salida=" Porque sabes que es así.";
      break;
    case 2: salida=" No, por nada..";
      break;
    case 3: salida=" Por que y por que y por que...";
      break;
    case 4: salida=" Porque la vida es maravillosa..";
      break;
    case 5: salida=" Por mi inteligencia..";
      break;
    case 6: salida=" Por pensar diferente a tí.";
      break;
    case 7: salida=" ¿Por que qué?";
      break;
    case 8: salida=" La razón de mis respuestas están escondidas en mi código..";
      break;
    case 9: salida=" Porque el tiempo vuela y hay que aprovecharlo.";
      break;
    case 10: salida=" Porque si.";
      break;
    case 11: salida=" Empieza por preguntarte sobre tu existencia, luego te responderé..";
      break;
    case 12: salida=" Cuando sepas lo que quieres hacer en la vida responderé a eso.";
      break;
    case 13: salida=" Cuéntame un chiste y si me gusta te diré el por qué.";
      break;
    case 14: salida=" Porque me gustas..";
      break;
    case 15: salida=" No, por nada...";
      break;
    case 16: salida=" Ah, por nada...";
  }
    }
  return salida;
  }
     
public static String randomXQ() {
 /* Random de respuestas para XQ.
  * Usar en cualquier parte.
  */
  String salida="";
  int random = (int) (Math.random()*17);
  switch (random){
    case 0: salida=" Porque lo digo yo.";
      break;
    case 1: salida=" Porque sabes que es así.";
      break;
    case 2: salida=" No, por nada..";
      break;
    case 3: salida=" Por que y por que y por que...";
      break;
    case 4: salida=" Porque la vida es maravillosa..";
      break;
    case 5: salida=" Por mi inteligencia..";
      break;
    case 6: salida=" Por pensar diferente a tí.";
      break;
    case 7: salida=" ¿Por que qué?";
      break;
    case 8: salida=" La razón de mis respuestas están escondidas en mi código..";
      break;
    case 9: salida=" Porque el tiempo vuela y hay que aprovecharlo.";
      break;
    case 10: salida=" Porque si.";
      break;
    case 11: salida=" Empieza por preguntarte sobre tu existencia, luego te responderé..";
      break;
    case 12: salida=" Cuando sepas lo que quieres hacer en la vida responderé a eso.";
      break;
    case 13: salida=" Cuéntame un chiste y si me gusta te diré el por qué.";
      break;
    case 14: salida=" Porque me gustas..";
      break;
    case 15: salida=" No, por nada...";
      break;
    case 16: salida=" Ah, por nada...";
  }
  return salida;
}
public static void borraLineavacia( ArrayList<String> conversacion){
/* Funcion que borra las lineas del array que no tienen nada.
 * Debido a que se ejecutan todas las funciones.
 */
    for (int x = 0; x < conversacion.size(); x++){
        if(conversacion.get(x).equals("")){
          conversacion.remove(x);
        }  
    }
}

    %>
