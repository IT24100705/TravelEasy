package servlets;

import utils.FileUtils;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;

public class DeleteUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String username = (String) req.getSession().getAttribute("username");

        if (username == null) {
            res.sendRedirect("login.jsp?message=Please+log+in+first");
            return;
        }

        try {
            if (FileUtils.deleteUser(req.getServletContext(), username)) {
                req.getSession().invalidate();
                res.sendRedirect("index.jsp?message=Delete+successful");
            } else {
                res.sendRedirect("account.jsp?message=Failed+to+delete+account");
            }
        } catch (IOException e) {
            e.printStackTrace(); // Log for debugging
            res.sendRedirect("account.jsp?message=Error+deleting+account");
        }
    }
}
