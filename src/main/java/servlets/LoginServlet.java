package Servlet;

import entities.User;
import utils.PasswordUtils;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;

@WebServlet(name = "LoginServlet",value = "/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        System.out.println(req.getSession().getAttribute("role"));

        if (req.getSession().getAttribute("email") != null) {
            if (req.getSession().getAttribute("role").equals("user")) {
                res.sendRedirect("dashboard.jsp");
                return;

            }else{
                req.getRequestDispatcher("adminDashboard.jsp").forward(req, res);
                return;
            }
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
            req.getRequestDispatcher("login.jsp").forward(req, res);
            return;
        }

        try {
            File file = new File(req.getServletContext().getRealPath("/users.txt"));
            if (!file.exists()) {
                req.setAttribute("error", "No users found");
                req.getRequestDispatcher("login.jsp").forward(req, res);
                return;
            }

            String passwordHash = PasswordUtils.hashPassword(password);
            try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    User user = User.fromFileString(line);
                    if (user == null) continue;  // Skip invalid lines

                    // Debug prints
                    System.out.println("Checking user: " + user.getEmail());
                    System.out.println("Stored hash: " + user.getPasswordHash());
                    System.out.println("Input hash: " + passwordHash);

                    if (user.getEmail().equals(email) && user.getPasswordHash().equals(passwordHash)) {
                        HttpSession session = req.getSession();
                        session.setAttribute("name", user.getName());
                        session.setAttribute("email", email);
                        session.setAttribute("role", user.getRole());

                        // Redirect based on role
                        if ("admin".equalsIgnoreCase(user.getRole())) {
                            res.sendRedirect(req.getContextPath() + "/MainDashboard.jsp");
                        } else {
                            res.sendRedirect(req.getContextPath() + "/dashboard.jsp");
                        }
                        return;
                    }
                }
            }

            req.setAttribute("error", "Invalid email or password");
            req.getRequestDispatcher("login.jsp").forward(req, res);
        } catch (Exception e) {
            req.setAttribute("error", "Error during login: " + e.getMessage());
            req.getRequestDispatcher("login.jsp").forward(req, res);
            e.printStackTrace();
        }
    }
}
