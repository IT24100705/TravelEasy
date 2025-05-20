package servlets;

import entities.User;
import utils.FileUtils;
import utils.PasswordUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

@WebServlet(name = "RegisterServlet", value = "/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        if (req.getSession().getAttribute("email") != null) {
            res.sendRedirect("dashboard.jsp");
            return;
        }
        RequestDispatcher dispatcher = req.getRequestDispatcher("register.jsp");
        dispatcher.forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String name = req.getParameter("name");
        String telephone = req.getParameter("telephone");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        if (name == null || telephone == null || email == null || password == null ||
                name.isEmpty() || telephone.isEmpty() || email.isEmpty() || password.isEmpty()) {
            req.setAttribute("message", "All fields are required");
            RequestDispatcher dispatcher = req.getRequestDispatcher("register.jsp");
            dispatcher.forward(req, res);
            return;
        }

        try {
            if (FileUtils.emailExists(req.getServletContext(), email)) {
                req.setAttribute("message", "Email already exists");
                RequestDispatcher dispatcher = req.getRequestDispatcher("register.jsp");
                dispatcher.forward(req, res);
                return;
            }

            String passwordHash = PasswordUtils.hashPassword(password);
            User user = new User(name, telephone, email, passwordHash, "user");
            FileUtils.saveUser(req.getServletContext(), user);
            res.sendRedirect("login.jsp?message=Registration+successful");
        } catch (IOException e) {
            req.setAttribute("message", "Error saving user data. Please try again.");
            RequestDispatcher dispatcher = req.getRequestDispatcher("register.jsp");
            dispatcher.forward(req, res);
        } catch (RuntimeException e) {
            req.setAttribute("message", "Error processing registration: " + e.getMessage());
            RequestDispatcher dispatcher = req.getRequestDispatcher("register.jsp");
            dispatcher.forward(req, res);
        }
    }
}
