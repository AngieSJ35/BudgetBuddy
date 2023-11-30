/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package budgetbuddy.util;

/**
 *
 * @author lica-
 */
import budgetbuddy.util.DBConfig;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection(DBConfig.URL, DBConfig.USER, DBConfig.PASSWORD);
        } catch (ClassNotFoundException ex) {
            throw new SQLException("Error al cargar el controlador de MySQL", ex);
        }
    }
}
