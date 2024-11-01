import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class RegistrarEmpleado {
    public void registrarEmpleado(String nombre, String usuario, String contrasena) {
        Connection conexion = ConexionSQL.conectar();
        if (conexion != null) {
            try {
                String sql = "INSERT INTO Usuario (nombre, usuario, contrasena_hash, rol) VALUES (?, ?, ?, ?)";
                PreparedStatement stmt = conexion.prepareStatement(sql);
                stmt.setString(1, nombre);
                stmt.setString(2, usuario);
                stmt.setString(3, contrasena); // En producción, cifra la contraseña
                stmt.setString(4, "empleado");

                int filasInsertadas = stmt.executeUpdate();
                if (filasInsertadas > 0) {
                    System.out.println("Empleado registrado exitosamente.");
                }
            } catch (SQLException e) {
                System.out.println("Error al registrar empleado: " + e.getMessage());
            } finally {
                try {
                    conexion.close();
                } catch (SQLException e) {
                    System.out.println("Error al cerrar la conexión: " + e.getMessage());
                }
            }
        }
    }
}
