/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package budgetbuddy.model;

/**
 *
 * @author lica-
 */
import budgetbuddy.controller.LoginServlet;
import budgetbuddy.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class IngresosDAO {

    private Connection connection;

    public IngresosDAO(Connection connection) {
        this.connection = connection;
    }
    
    public int obtenerTotalIngresosPorUsuario(int usuarioC) {
    int totalIngresos = 0;

    try {
        String sql = "SELECT SUM(valor) as total FROM ingresos WHERE usuario = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, usuarioC);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    totalIngresos = resultSet.getInt("total");
                }
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return totalIngresos;
}

    public List<Ingresos> obtenerIngresosPorUsuario(int usuarioC) {
        List<Ingresos> listaIngresos = new ArrayList<>();

        try {
            String sql = "SELECT * FROM ingresos WHERE usuario = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, usuarioC);

                try (ResultSet resultSet = statement.executeQuery()) {
                    while (resultSet.next()) {
                        int id = resultSet.getInt("id");
                        String nombre = resultSet.getString("nombre");
                        int valor = resultSet.getInt("valor");
                        boolean pagado = resultSet.getBoolean("pagado");
                        int usuario = resultSet.getInt("usuario");
                        Ingresos ingreso = new Ingresos(id, nombre, valor, pagado, usuario);
                        listaIngresos.add(ingreso);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return listaIngresos;
    }

    public boolean insertarIngreso(Ingresos ingreso) {
        try {
            String sql = "INSERT INTO ingresos (nombre, valor, pagado, usuario) VALUES (?, ?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, ingreso.getNombre());
                statement.setInt(2, ingreso.getValor());
                statement.setBoolean(3, ingreso.isPagado());
                // Suponiendo que hay un atributo "nombreUsuario" en la clase Gastos
                statement.setInt(4, ingreso.getUsuario());

                int filasAfectadas = statement.executeUpdate();
                return filasAfectadas > 0;
            }
        } catch (SQLException e) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, e);
            return false;
        }
    }

    public boolean actualizarIngreso(Ingresos ingreso) {
        try {
            String sql = "UPDATE ingreso SET nombre = ?, valor = ?, pagado = ? WHERE id = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, ingreso.getNombre());
                statement.setInt(2, ingreso.getValor());
                statement.setBoolean(3, ingreso.isPagado());
                statement.setInt(4, ingreso.getId());

                int filasAfectadas = statement.executeUpdate();
                return filasAfectadas > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean eliminarIngreso(int id) {
        try {
            String sql = "DELETE FROM ingresos WHERE id = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, id);

                int filasAfectadas = statement.executeUpdate();
                return filasAfectadas > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
