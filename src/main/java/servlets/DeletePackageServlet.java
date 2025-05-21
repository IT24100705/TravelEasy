package servlets;

import com.packagemanagement.PackageBST;
import com.packagemanagement.PackageFileHandler;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeletePackageServlet", value = "/DeletePackageServlet")
public class DeletePackageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/deletePackage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String packageId = request.getParameter("packageId");

            if (packageId == null || packageId.trim().isEmpty()) {
                request.setAttribute("error", "Package ID cannot be empty.");
                getServletContext().getRequestDispatcher("/deletePackage.jsp").forward(request, response);
                return;
            }

            String filePath = getServletContext().getRealPath("/packages.txt");
            PackageFileHandler.setFilePath(filePath);

            // Delete from file and BST
            boolean deletedFromFile = PackageFileHandler.deletePackageFromFile(packageId);
            boolean deletedFromBST = false;

            PackageBST bst = (PackageBST) getServletContext().getAttribute("packageBST");
            if (bst != null) {
                deletedFromBST = bst.delete(packageId);
            }

            // Set appropriate message
            if (deletedFromFile && deletedFromBST) {
                request.setAttribute("message", "Package successfully deleted from both file and BST.");
            } else if (deletedFromFile) {
                request.setAttribute("message", "Package deleted from file, but not found in BST.");
            } else if (deletedFromBST) {
                request.setAttribute("message", "Package deleted from BST, but not found in file.");
            } else {
                request.setAttribute("error", "Package not found in either file or BST.");
            }

        } catch (Exception e) {
            request.setAttribute("error", "An error occurred: " + e.getMessage());
        }

        // Always forward to JSP after handling
        getServletContext().getRequestDispatcher("/deletePackage.jsp").forward(request, response);
    }
}
