import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class AuthenticationService {

    public String authenticate(String username, String password) {
        String role = null;
        try {
            // Obtener el recurso DataSource
            Context initContext = new InitialContext();
            DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/JardinInfantilDB");
            try (Connection conn = ds.getConnection()) {
                // Consulta para verificar las credenciales y obtener el rol del usuario
                String query = "SELECT r.nombre FROM Usuario u JOIN Rol r ON u.rol_id = r.id WHERE u.nombre_usuario = ? AND u.contraseña = ?";
                PreparedStatement stmt = conn.prepareStatement(query);
                stmt.setString(1, username);
                stmt.setString(2, password);
                ResultSet rs = stmt.executeQuery();
                
                if (rs.next()) {
                    role = rs.getString("nombre");  // Obtiene el rol del usuario (admin o empleado)
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return role;  // Retorna el rol o null si no se encuentra
    }
}