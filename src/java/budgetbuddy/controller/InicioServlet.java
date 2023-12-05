/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package budgetbuddy.controller;

import budgetbuddy.model.Gastos;
import budgetbuddy.model.GastosDAO;
import budgetbuddy.model.Ingresos;
import budgetbuddy.model.IngresosDAO;
import budgetbuddy.model.Recomendacion;
import budgetbuddy.model.RecomendacionesDAO;
import budgetbuddy.util.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author lica-
 */
public class InicioServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet InicioServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InicioServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Puedes realizar lógica adicional si es necesario antes de mostrar el JSP
        HttpSession session = request.getSession(false); // Si la sesión no existe, no la crea

        int usuarioId = 0;

        if (session != null) {
            // Obtener información sobre el usuario desde la sesión
            usuarioId = (int) session.getAttribute("usuarioId");

            // Realizar operaciones basadas en la información del usuario
        }
        System.out.println("budgetbuddy.controller.InicioServlet.doGet()");
        Connection coneccion;
         try {
            coneccion = DBConnection.getConnection();
            GastosDAO gastosDao = new GastosDAO(coneccion);
            IngresosDAO ingresosDao = new IngresosDAO(coneccion);
            RecomendacionesDAO recomDao = new RecomendacionesDAO(coneccion);
            Recomendacion recomendacion = recomDao.obtenerUltimoRecomendacionPorUsuario(usuarioId);
            int gastosTotal = gastosDao.obtenerTotalGastosPorUsuario(usuarioId);
            int ingresosTotal = ingresosDao.obtenerTotalIngresosPorUsuario(usuarioId);
            int saldo = ingresosTotal - gastosTotal;
            
            // Puedes almacenar la lista de gastos en el objeto request para que esté disponible en el JSP
            request.setAttribute("totalGastos", gastosTotal);
            System.out.println(gastosTotal + ' ' +  ingresosTotal + ' ' + saldo);
            request.setAttribute("totalIngresos", ingresosTotal);
            request.setAttribute("saldoInicio", saldo);
            request.setAttribute("recomendacion", recomendacion.toString());
            // Despachar a la página JSP para mostrar los resultados
            RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/inicio.jsp");
            dispatcher.forward(request, response);
            //dispatcher.forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
            // Manejar errores
        }
        // Luego, redirige a la página de inicio (inicio.jsp)
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
