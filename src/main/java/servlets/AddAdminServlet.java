package Servlet;

import dao.AdminDAO;
import entities.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.PasswordUtils;

@WebServlet("/add")
public class AddAdminServlet extends HttpServlet {
    private AdminDAO adminDao;

    @Override
    public void init() throws ServletException {
        String contextPath = getServletContext().getRealPath("/");
        this.adminDao = new AdminDAO(contextPath);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("addadmin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String telephone = request.getParameter("telephone");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Hash the password before creating the User object
        String hashedPassword = PasswordUtils.hashPassword(password);

        User newAdmin = new User(name, telephone, email, hashedPassword, "admin");

        if (adminDao.addAdmin(newAdmin)) {
            response.sendRedirect(request.getContextPath() + "/admin/list?success=added");
        } else {
            request.setAttribute("error", "Admin with this email already exists");
            request.getRequestDispatcher("addadmin.jsp").forward(request, response);
        }
    }
}
