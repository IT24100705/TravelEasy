package servlets;

import dao.AdminDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/delete")
public class DeleteAdminServlet extends HttpServlet {
    private AdminDAO adminDao;

    @Override
    public void init() throws ServletException {
        String contextPath = getServletContext().getRealPath("/");
        this.adminDao = new AdminDAO(contextPath);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");

        if (adminDao.deleteAdmin(email)) {
            response.sendRedirect(request.getContextPath() + "/admin/list?success=deleted");
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/list?error=delete_failed");
        }
    }
}