<%@ page session="true" %>
<% 
    String rol = (String) session.getAttribute("rol");
    if (rol == null || !rol.equals("admin")) {
        response.sendRedirect("login.jsp?error=No tienes permiso para acceder a esta página");
        return;
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menú Administrador</title>
    <link rel="stylesheet" href="estilos.css">
</head>
<body>

    <header class="header">
        <h1>Jardín Infantil - Menú del Administrador</h1>
        <nav>
            <a href="registro_empleado.html">Registrar Empleado</a>
            <a href="registro_alumno.html">Registrar Alumno</a>
            <a href="eliminar_empleado.html">Eliminar Empleado</a>
            <a href="eliminar_alumno.html">Eliminar Alumno</a>
            <a href="asignar_curso.html">Asignar Curso a Alumno</a>
            <a href="asignar_curso_empleado.html">Asignar Curso a Empleado</a>
        </nav>
    </header>

    <div class="container">
        <h2>Opciones Administrativas</h2>
        <p>Seleccione una opción del menú para gestionar empleados y alumnos.</p>
    </div>

</body>
</html>
