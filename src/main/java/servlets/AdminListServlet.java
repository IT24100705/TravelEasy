package servlets;

import dao.AdminDAO;
import entities.User;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/list")
public class AdminListServlet extends HttpServlet {
    private AdminDAO adminDao;

    @Override
    public void init() throws ServletException {
        String contextPath = getServletContext().getRealPath("/");
        this.adminDao = new AdminDAO(contextPath);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<User> admins = adminDao.getAllAdmins();
        request.setAttribute("admins", admins);
        request.getRequestDispatcher("/listadmin.jsp").forward(request, response);
    }
}