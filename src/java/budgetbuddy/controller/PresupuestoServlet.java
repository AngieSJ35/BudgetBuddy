/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package budgetbuddy.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

import budgetbuddy.util.DBConnection;
import java.sql.Connection;
import java.sql.SQLException;
import budgetbuddy.model.GastosDAO;
import budgetbuddy.model.Gastos;
import budgetbuddy.model.Ingresos;
import budgetbuddy.model.IngresosDAO;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;

/**
 *
 * @author lica-
 */
@WebServlet(name = "Presupuesto", urlPatterns = {"/Presupuesto"})
public class PresupuestoServlet extends HttpServlet {

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
            out.println("<title>Servlet Presupuesto</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Presupuesto at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession(false); // Si la sesión no existe, no la crea

        int usuarioId = 0;

        if (session != null) {
            // Obtener información sobre el usuario desde la sesión
            usuarioId = (int) session.getAttribute("usuarioId");

            // Realizar operaciones basadas en la información del usuario
        }
        Connection coneccion;
        // Aquí deberías manejar la lógica para obtener la conexión a la base de datos
        // y crear una instancia de tu DAO
        try {
            coneccion = DBConnection.getConnection();
            GastosDAO gastosDao = new GastosDAO(coneccion);
            IngresosDAO ingresosDao = new IngresosDAO(coneccion);
            System.out.println("hola" + usuarioId);
            List<Gastos> listaGastos = gastosDao.obtenerGastosPorUsuario(usuarioId);
            List<Ingresos> listaIngresos = ingresosDao.obtenerIngresosPorUsuario(usuarioId);
            int totalIngresos = listaIngresos.stream().mapToInt(Ingresos::getValor).sum();
            int totalGastos = listaGastos.stream().mapToInt(Gastos::getValor).sum();
            int saldo = totalIngresos - totalGastos;
            // Puedes almacenar la lista de gastos en el objeto request para que esté disponible en el JSP
            request.setAttribute("listaGastos", listaGastos);
            request.setAttribute("listaIngresos", listaIngresos);
            request.setAttribute("saldo", saldo);
            // Despachar a la página JSP para mostrar los resultados
            RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/presupuesto.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
            // Manejar errores
        }
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
        System.out.println("budgetbuddy.controller.PresupuestoServlet.doPost()");
        String nombre = request.getParameter("nombre");
        int valor = Integer.parseInt(request.getParameter("valor"));
        HttpSession session = request.getSession(false); // Si la sesión no existe, no la crea
        Connection coneccion;
        int usuarioId = 0;

        if (session != null) {
            // Obtener información sobre el usuario desde la sesión
            usuarioId = (int) session.getAttribute("usuarioId");
            System.out.println(usuarioId);
            if (request.getParameter("gasto") != null) {
                try {
                    Gastos gasto = new Gastos(0, nombre, valor, false, usuarioId);
                    coneccion = DBConnection.getConnection();
                    GastosDAO gastoDAO = new GastosDAO(coneccion);
                    boolean registroExitoso = gastoDAO.insertarGasto(gasto);
                    if (registroExitoso) {
                        // Redirige a una página de registro exitoso
                        System.out.println("GastoExitoso");
                        response.sendRedirect("inicio");
                    } else {
                        // Redirige a una página de error de registro
                        response.sendRedirect("errorRegistro.jsp");
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
                try {
                    Ingresos ingreso = new Ingresos(0, nombre, valor, false, usuarioId);
                    coneccion = DBConnection.getConnection();
                    IngresosDAO ingresoDAO = new IngresosDAO(coneccion);
                    boolean registroExitoso = ingresoDAO.insertarIngreso(ingreso);
                    if (registroExitoso) {
                        // Redirige a una página de registro exitoso
                        response.sendRedirect("inicio");
                    } else {
                        // Redirige a una página de error de registro
                        response.sendRedirect("errorRegistro.jsp");
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

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
