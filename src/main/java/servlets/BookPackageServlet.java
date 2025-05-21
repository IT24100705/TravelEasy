package servlets;

import com.packagemanagement.PackageBST;
import customPackage.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "BookPackageServlet", value = "/BookPackageServlet")
public class BookPackageServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Do not allow direct access without ID
        response.sendRedirect("TravelPackages"); // Or a safer fallback
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String packageId = request.getParameter("packageId");
        String packageType = request.getParameter("packageType");

        System.out.println("Received package ID: " + packageId);
        System.out.println("Package type: " + packageType);

        Object selectedPackage = null;

        if ("default".equalsIgnoreCase(packageType)) {
            // Load from BST
            PackageBST bst = (PackageBST) getServletContext().getAttribute("packageBST");
            selectedPackage = (bst != null) ? bst.searchById(packageId) : null;

        } else if ("custom".equalsIgnoreCase(packageType)) {
            // Load from file
            selectedPackage = CustomPackageFileHandler.searchById(packageId); // you need to implement this
        }

        if (selectedPackage == null) {
            request.setAttribute("error", "Package not found");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }

        request.setAttribute("selectedPackage", selectedPackage);

        // Forward to booking form (can use the same JSP for both types, or separate if needed)
        request.getRequestDispatcher("bookPackage.jsp").forward(request, response);
    }

}
