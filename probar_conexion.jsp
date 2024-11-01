<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>

<%
    String url = "jdbc:sqlserver://localhost:1433;databaseName=jardin_infantil"; // Cambia si es necesario
    Connection conexion = null;
    String mensaje = "";

    try {
        // Cargar el controlador JDBC de SQL Server
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

        // Establecer la conexión
        conexion = DriverManager.getConnection(url);

        mensaje = "Conexión exitosa a SQL Server";
    } catch (ClassNotFoundException e) {
        mensaje = "Error al cargar el controlador JDBC: " + e.getMessage();
    } catch (SQLException e) {
        mensaje = "Error de conexión a la base de datos: " + e.getMessage();
    } finally {
        if (conexion != null) {
            try {
                conexion.close();
            } catch (SQLException e) {
                mensaje += " Error al cerrar la conexión: " + e.getMessage();
            }
        }
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Prueba de Conexión</title>
</head>
<body>
    <h2>Resultado de la Prueba de Conexión</h2>
    <p><%= mensaje %></p>
</body>
</html>