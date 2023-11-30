/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package budgetbuddy.model;

/**
 *
 * @author lica-
 */
import budgetbuddy.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GastosDAO {

    private Connection connection;

    public GastosDAO(Connection connection) {
        this.connection = connection;
    }

    public List<Gastos> obtenerGastosPorUsuario(String nombreUsuario) {
        List<Gastos> listaGastos = new ArrayList<>();

        try {
            String sql = "SELECT * FROM gastos WHERE nombre_usuario = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, nombreUsuario);

                try (ResultSet resultSet = statement.executeQuery()) {
                    while (resultSet.next()) {
                        int id = resultSet.getInt("id");
                        String nombre = resultSet.getString("nombre");
                        int valor = resultSet.getInt("valor");
                        boolean pagado = resultSet.getBoolean("pagado");
                        int usuario = resultSet.getInt("usuario");
                        Gastos gasto = new Gastos(id, nombre, valor, pagado, usuario);
                        listaGastos.add(gasto);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return listaGastos;
    }

    public boolean insertarGasto(Gastos gasto) {
        try {
            String sql = "INSERT INTO gastos (nombre, valor, pagado, usuario) VALUES (?, ?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, gasto.getNombre());
                statement.setInt(2, gasto.getValor());
                statement.setBoolean(3, gasto.isPagado());
                // Suponiendo que hay un atributo "nombreUsuario" en la clase Gastos
                statement.setInt(4, gasto.getUsuario());

                int filasAfectadas = statement.executeUpdate();
                return filasAfectadas > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean actualizarGasto(Gastos gasto) {
        try {
            String sql = "UPDATE gastos SET nombre = ?, valor = ?, pagado = ? WHERE id = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, gasto.getNombre());
                statement.setInt(2, gasto.getValor());
                statement.setBoolean(3, gasto.isPagado());
                statement.setInt(4, gasto.getId());

                int filasAfectadas = statement.executeUpdate();
                return filasAfectadas > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean eliminarGasto(int id) {
        try {
            String sql = "DELETE FROM gastos WHERE id = ?";
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
