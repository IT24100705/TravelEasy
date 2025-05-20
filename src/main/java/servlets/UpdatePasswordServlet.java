package servlets;

import utils.FileUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

@WebServlet(name = "UpdatePasswordServlet", value = "/update")
public class UpdatePasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String email = (String) req.getSession().getAttribute("email");
        String newPassword = req.getParameter("newPassword");

        if (email == null) {
            res.sendRedirect("login.jsp?message=Please+log+in+first");
            return;
        }

        try {
            if (FileUtils.updateUserPassword(req.getServletContext(), email, newPassword)) {
                res.sendRedirect("dashboard.jsp?message=Password+updated+successfully");
            } else {
                res.sendRedirect("dashboard.jsp?message=Failed+to+update+password");
            }
        } catch (IOException e) {
            e.printStackTrace();
            res.sendRedirect("dashboard.jsp?message=Error+updating+password");
        }
    }
}
