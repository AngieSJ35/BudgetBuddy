/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package budgetbuddy.controller;

/**
 *
 * @author lica-
 */
import budgetbuddy.model.Usuario;
import budgetbuddy.model.UsuarioDAO;
import budgetbuddy.util.DBConnection;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lógica de procesamiento adicional
        // ...

        // Redirección a login.jsp
        response.sendRedirect("jsp/login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Recupera los parámetros del formulario
        String nombre = request.getParameter("nombre");
        String correo = request.getParameter("correo");
        String contrasena = request.getParameter("contrasena");
        Usuario nuevoUsuario = new Usuario(0, nombre, correo, contrasena, "");
        Connection coneccion;

        // Verifica las credenciales (esto es solo un ejemplo, implementa tu lógica de autenticación real)
        if (request.getParameter("login") != null) {

            try {
                coneccion = DBConnection.getConnection();
                UsuarioDAO usuarioDAO = new UsuarioDAO(coneccion);
                UsuarioDAO.AutenticacionResult  credencialesValidas = usuarioDAO.validarCredenciales(correo, contrasena);
                if (credencialesValidas.isCredencialesValidas()) {
                    // Redirige a una página de inicio exitoso
                    HttpSession session = request.getSession(true);
                    session.setAttribute("usuarioId",  credencialesValidas.getUsuarioId());
                    response.sendRedirect("jsp/inicio.jsp");
                    
                } else {
                    // Redirige a una página de error de inicio de sesión
                    response.sendRedirect("errorInicioSesion.jsp");
                }
            } catch (SQLException ex) {
                Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        } else {

            try {
                coneccion = DBConnection.getConnection();
                UsuarioDAO usuarioDAO = new UsuarioDAO(coneccion);
                boolean registroExitoso = usuarioDAO.insertarUsuario(nuevoUsuario);

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
