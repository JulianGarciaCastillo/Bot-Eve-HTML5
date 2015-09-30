package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import java.util.Arrays;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


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
    
  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("  <head>\n");
      out.write("    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write(" \n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=20\" />\n");
      out.write("    <title>EVE - Bot Conversacional</title>\n");
      out.write("\n");
      out.write("    <link href=\"escritorio.css\" rel=\"stylesheet\" type=\"text/css\" media=\"screen\" />\n");
      out.write("    <link href=\"movil.css\" rel=\"stylesheet\" type=\"text/css\" media=\"handheld, only screen and (max-device-width: 480px)\" />\n");
      out.write("  </head>\n");
      out.write("\n");
      out.write("  \n");
      out.write("  <body>\n");
      out.write("    ");
 request.setCharacterEncoding("UTF-8");
      out.write("\n");
      out.write("    <div class=\"pantalla\">\n");
      out.write("          <div class=\"pregunta\"> \n");
      out.write("              ");
ArrayList<String> conversacion = new ArrayList<String>();
      out.write("\n");
      out.write("              ");

            String nombreUsu ="";
                // PANTALLA INICIAL PRIMERA VEZ
                conversacion.add(randomPideNombre());
                out.print(conversacion.get(0));
                
      out.write("<br>\n");
      out.write("                <form method=\"post\" action=\"inicio.jsp\"  autocomplete=\"off\">\n");
      out.write("                > <input type=\"text\" name=\"nombreUser\" autofocus=\"autofocus\">\n");
      out.write("                <input type=\"hidden\" name=\"respuestaBot\" value=\"");
      out.print(conversacion.get(0));
      out.write("\">\n");
      out.write("                <input type=\"hidden\" name=\"primeraVez\" value=\"si\">\n");
      out.write("                </form>\n");
      out.write("              ");
// FIN PANTALLA INICIAL PRIMERA VEZ
      out.write("      \n");
      out.write("          </div>     \n");
      out.write("    </div>\n");
      out.write("  </body>\n");
      out.write("</html>\n");
      out.write('\n');
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
