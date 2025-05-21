package servlets;

import customPackage.CustomPackageFileHandler;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/DeleteCustomPackageServlet")
public class DeleteCustomPackageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String packageId = request.getParameter("packageId");

        if (packageId != null && !packageId.isEmpty()) {
            boolean success = CustomPackageFileHandler.deletePackage(packageId);
            if (success) {
                System.out.println("Package deleted: " + packageId);
            } else {
                System.out.println("Failed to delete package: " + packageId);
            }
        }

        response.sendRedirect("ViewCustomPackagesServlet");
    }
}
