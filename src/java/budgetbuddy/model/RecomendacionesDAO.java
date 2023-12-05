/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package budgetbuddy.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

/**
 *
 * @author lica-
 */
public class RecomendacionesDAO {

    private Connection connection;

    public RecomendacionesDAO(Connection connection) {
        this.connection = connection;
    }

    public boolean insertarRecomendacion(Recomendacion recomendacion) throws SQLException {
        String sql = "INSERT INTO recomendacion (nombre, ingredientes, usuario) VALUES (?, ?, ?, ?)";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, recomendacion.getNombrePlatillo());
            statement.setString(2, recomendacion.getIngredientes());
            statement.setInt(4, recomendacion.getUsuario());
            statement.executeUpdate();
        }
        return true;
    }

    public Recomendacion obtenerUltimaRecomendacion() {
        Recomendacion ultimaRecomendacion = null;

        try {
            String sql = "SELECT * FROM recomendacion ORDER BY fecha DESC LIMIT 1";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        String ingredientes = resultSet.getString("ingredientes");
                        String nombrePlatillo = resultSet.getString("nombrePlatillo");
                        double similitud = resultSet.getDouble("similitud");
                        ultimaRecomendacion = new Recomendacion(ingredientes, nombrePlatillo, similitud);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return ultimaRecomendacion;
    }
    
    public Recomendacion obtenerUltimoRecomendacionPorUsuario(int usuarioC) {
    Recomendacion ultimaRec= null;

    try {
        String sql = "SELECT * FROM recomendacion WHERE usuario = ? ORDER BY id DESC LIMIT 1";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, usuarioC);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    String nombre = resultSet.getString("nombre");
                    String ingredientes = resultSet.getString("ingredientes");
                    // Otros campos según tu tabla

                    ultimaRec= new Recomendacion(ingredientes, nombre /*, otros campos */);
                }
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return ultimaRec;
}


}
