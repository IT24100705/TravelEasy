package servlets;

import entities.User;
import utils.PasswordUtils;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        if (req.getSession().getAttribute("email") != null) {
            res.sendRedirect("dashboard.jsp");
            return;
        }
        RequestDispatcher dispatcher = req.getRequestDispatcher("login.jsp");
        dispatcher.forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        if (email == null || password == null || email.isEmpty() || password.isEmpty()) {
            req.setAttribute("error", "Email and password are required");
            RequestDispatcher dispatcher = req.getRequestDispatcher("login.jsp");
            dispatcher.forward(req, res);
            return;
        }

        try {
            File file = new File(req.getServletContext().getRealPath("/WEB-INF/users.txt"));
            if (!file.exists()) {
                req.setAttribute("error", "No users found");
                RequestDispatcher dispatcher = req.getRequestDispatcher("login.jsp");
                dispatcher.forward(req, res);
                return;
            }

            String passwordHash = PasswordUtils.hashPassword(password);
            try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    User user = User.fromFileString(line);
                    if (user != null && user.getEmail().equals(email) && user.getPasswordHash().equals(passwordHash)) {
                        HttpSession session = req.getSession();
                        session.setAttribute("name", user.getName());
                        session.setAttribute("email", email);
                        session.setAttribute("role", user.getRole());
                        if ("admin".equals(user.getRole())) {
                            res.sendRedirect("adminDashboard.jsp");
                        } else {
                            res.sendRedirect("dashboard.jsp");
                        }
                        return;
                    }
                }
            }

            req.setAttribute("error", "Invalid email or password");
            RequestDispatcher dispatcher = req.getRequestDispatcher("login.jsp");
            dispatcher.forward(req, res);
        } catch (IOException e) {
            req.setAttribute("error", "Error accessing user data. Please try again later.");
            RequestDispatcher dispatcher = req.getRequestDispatcher("login.jsp");
            dispatcher.forward(req, res);
            e.printStackTrace();
        } catch (RuntimeException e) {
            req.setAttribute("error", "Error processing login: " + e.getMessage());
            RequestDispatcher dispatcher = req.getRequestDispatcher("login.jsp");
            dispatcher.forward(req, res);
            e.printStackTrace();
        }
    }
}