import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    
    private AuthenticationService authService = new AuthenticationService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Llamar al servicio de autenticación
        String role = authService.authenticate(username, password);

        if (role != null) {
            // Almacenar el rol en la sesión
            request.getSession().setAttribute("rol", role);

            // Redirigir según el rol
            if (role.equals("admin")) {
    response.sendRedirect("Admin_menu.jsp"); // Redirige al menú de administrador
} else if (role.equals("empleado")) {
    response.sendRedirect("empleado_menu.jsp"); // Redirige al menú de empleado
}
        } else {
            // Redirige al login con un mensaje de error
            response.sendRedirect("login.jsp?error=Credenciales inválidas");
        }
    }
}
