package servlets;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

import customPackage.CustomPackage;
import customPackage.CustomPackageFileHandler;

@WebServlet(name = "ViewCustomPackagesServlet", value = "/ViewCustomPackagesServlet")
public class ViewCustomPackagesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("email") == null) {
            // If not logged in, redirect to login page
            response.sendRedirect("login.jsp");
            return;
        }

        String loggedInEmail = (String) session.getAttribute("email");

        // Load all custom packages
        List<CustomPackage> allPackages = CustomPackageFileHandler.loadAllCustomPackages();

        // Filter only packages created by logged in user
        List<CustomPackage> userPackages = allPackages.stream()
                .filter(pkg -> pkg.getUser().getEmail().equalsIgnoreCase(loggedInEmail))
                .collect(Collectors.toList());

        // Set filtered packages as request attribute
        request.setAttribute("customPackages", userPackages);
        request.getRequestDispatcher("viewCustomPackages.jsp").forward(request, response);
    }
}
