/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package budgetbuddy.model;

/**
 *
 * @author lica-
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO {

    private Connection connection;

    public UsuarioDAO(Connection connection) {
        this.connection = connection;
    }

    // Método para insertar un usuario en la base de datos
    public boolean insertarUsuario(Usuario usuario) throws SQLException {
        String sql = "INSERT INTO usuarios (nombre, correo_electronico, contrasena, preferencias) VALUES (?, ?, ?, ?)";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, usuario.getNombre());
            statement.setString(2, usuario.getCorreo());
            statement.setString(3, usuario.getContraseña());
            statement.setString(4, usuario.getPreferencias());
            statement.executeUpdate();
        }
        return true;
    }

    // Método para actualizar un usuario en la base de datos
    public void actualizarUsuario(Usuario usuario) throws SQLException {
        String sql = "UPDATE usuarios SET nombre=?, correo_electronico=?, contrasena=?, preferencias=? WHERE id=?";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, usuario.getNombre());
            statement.setString(2, usuario.getCorreo());
            statement.setString(3, usuario.getContraseña());
            statement.setString(4, usuario.getPreferencias());
            statement.setInt(5, usuario.getId());
            statement.executeUpdate();
        }
    }

    // Método para recuperar todos los usuarios de la base de datos
    public List<Usuario> obtenerTodosUsuarios() throws SQLException {
        List<Usuario> usuarios = new ArrayList<>();
        String sql = "SELECT * FROM usuarios";

        try (PreparedStatement statement = connection.prepareStatement(sql); ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String nombre = resultSet.getString("nombre");
                String correo = resultSet.getString("correo");
                String contraseña = resultSet.getString("contraseña");
                String preferencias = resultSet.getString("preferencias");

                Usuario usuario = new Usuario(id, nombre, correo, contraseña, preferencias);
                usuarios.add(usuario);
            }
        }

        return usuarios;
    }

    // Método para obtener un usuario por su ID
    public Usuario obtenerUsuarioPorId(int id) throws SQLException {
        String sql = "SELECT * FROM usuarios WHERE id=?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    String nombre = resultSet.getString("nombre");
                    String correo = resultSet.getString("correo");
                    String contraseña = resultSet.getString("contraseña");
                    String preferencias = resultSet.getString("preferencias");

                    return new Usuario(id, nombre, correo, contraseña, preferencias);
                }
            }
        }
        return null;
    }

    public boolean validarCredenciales(String correo, String contrasena) throws SQLException {
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            String sql = "SELECT * FROM usuarios WHERE correo_electronico = ? AND contrasena = ?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, correo);
            statement.setString(2, contrasena);
            resultSet = statement.executeQuery();

            return resultSet.next();

        } finally {
            if (resultSet != null) {
                resultSet.close();
            }
            if (statement != null) {
                statement.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
    }

    // Método para eliminar un usuario por su ID
    public void eliminarUsuario(int id) throws SQLException {
        String sql = "DELETE FROM usuarios WHERE id=?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        }
    }
}
