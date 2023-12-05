/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package budgetbuddy.controller;

import budgetbuddy.model.Recomendacion;
import budgetbuddy.model.RecomendacionesDAO;
import budgetbuddy.util.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;

import java.util.HashMap;
import javax.servlet.http.HttpSession;
import org.json.JSONException;

/**
 *
 * @author lica-
 */
@WebServlet(name = "Mercado", urlPatterns = {"/Mercado"})
public class MercadoServlet extends HttpServlet {

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
            out.println("<title>Servlet MercadoServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MercadoServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

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
        RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/mercado.jsp");
        dispatcher.forward(request, response);

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
        String ingrediente1 = request.getParameter("ingrediente1");
        String ingrediente2 = request.getParameter("ingrediente2");
        String ingrediente3 = request.getParameter("ingrediente3");

        // Llama al método de la clase ApiConnection
        List<Object> resultList = ApiConnection.consultarAPI(ingrediente1, ingrediente2, ingrediente3);
        System.out.println(resultList.get(0).toString());
        System.out.println("budgetbuddy.controller.MercadoServlet.doPost()");
        // Puedes ajustar la lógica según la estructura de datos que hayas decidido devolver
        try {
            JSONObject jsonObject = new JSONObject(resultList.get(0).toString());
            
            // Puedes acceder a los elementos del JSON utilizando el objeto JSONObject
            Map<String, Recomendacion> recomendacionesMap = new TreeMap<>();
            Connection coneccion;
            // Iterar sobre las claves del JSONObject y agregar las recomendaciones al TreeMap
            for (String key : jsonObject.keySet()) {
               
                JSONObject recomendacionJson = jsonObject.getJSONObject(key);
                Recomendacion recomendacion = new Recomendacion();
                recomendacion.setIngredientes(recomendacionJson.getString("Ingredientes"));
                recomendacion.setNombrePlatillo(recomendacionJson.getString("Nombre Platillo"));
                recomendacion.setSimilitud(recomendacionJson.getDouble("Similitud"));
                HttpSession session = request.getSession(false);
                int usuarioId = (int) session.getAttribute("usuarioId");
                recomendacion.setUsuario(usuarioId);
                coneccion = DBConnection.getConnection();
                RecomendacionesDAO recomendao = new RecomendacionesDAO(coneccion);
                recomendao.insertarRecomendacion(recomendacion);
                recomendacionesMap.put(key, recomendacion);
            }

            // Ahora tienes un TreeMap ordenado por las claves (Recomendacion 1, 2, ..., 10)
            // Puedes imprimir o hacer lo que necesites con las recomendaciones


            request.setAttribute("recomendacionesMap", recomendacionesMap);
            response.setContentType("text/html");
            response.setCharacterEncoding("UTF-8");

            RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/resultados.jsp");
            dispatcher.forward(request, response);
        } catch (JSONException e) {
            e.printStackTrace();
        }  catch (Exception e) {
        e.printStackTrace();
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
