<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.DriverManager" %>

<%
    // Configuración de conexión a SQL Server
    String url = "jdbc:sqlserver://localhost:1433;databaseName=jardin_infantil"; // Cambia el nombre de la base de datos si es necesario
    Connection conexion = null;
    String mensaje = "";

    if (request.getParameter("nombre") != null) {
        String nombre = request.getParameter("nombre");
        String usuario = request.getParameter("usuario");
        String contrasena = request.getParameter("contrasena"); // En producción, cifra la contraseña
        String rol = "empleado";

        try {
            // Cargar el controlador JDBC de SQL Server
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            // Establecer la conexión
            conexion = DriverManager.getConnection(url);

            // Preparar la consulta de inserción
            String sql = "INSERT INTO Usuario (nombre, usuario, contrasena_hash, rol) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = conexion.prepareStatement(sql);
            stmt.setString(1, nombre);
            stmt.setString(2, usuario);
            stmt.setString(3, contrasena);
            stmt.setString(4, rol);

            // Ejecutar la inserción
            int filasInsertadas = stmt.executeUpdate();
            if (filasInsertadas > 0) {
                mensaje = "Empleado registrado exitosamente.";
            }
        } catch (ClassNotFoundException e) {
            mensaje = "Error al cargar el controlador JDBC: " + e.getMessage();
        } catch (SQLException e) {
            mensaje = "Error al registrar el empleado: " + e.getMessage();
        } finally {
            if (conexion != null) {
                try {
                    conexion.close();
                } catch (SQLException e) {
                    mensaje += " Error al cerrar la conexión: " + e.getMessage();
                }
            }
        }
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registrar Empleado</title>
</head>
<body>
    <h2>Registro de Empleado</h2>

    <% if (!mensaje.isEmpty()) { %>
        <p><%= mensaje %></p>
    <% } %>

    <form action="registrar_empleado.jsp" method="POST">
        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" name="nombre" required>

        <label for="usuario">Usuario:</label>
        <input type="text" id="usuario" name="usuario" required>

        <label for="contrasena">Contraseña:</label>
        <input type="password" id="contrasena" name="contrasena" required>

        <button type="submit">Registrar</button>
    </form>
</body>
</html>