package servlets;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

import com.packagemanagement.TravelPackage;
import com.packagemanagement.PackageSorter;
import java.util.List;
import com.packagemanagement.PackageBST;

@WebServlet(name = "TravelPackageServlet", value = "/TravelPackages")
public class TravelPackageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get shared BST from context
        PackageBST bst = (PackageBST) getServletContext().getAttribute("packageBST");

        List<TravelPackage> packages = bst.inOrder();  // or use preOrder/postOrder as needed


        // Check for sort parameter.
        String sort = request.getParameter("sort");
        if ("price".equals(sort)) {
            PackageSorter.quickSort(packages);
        }

        // Pass the sorted or unsorted list of packages.txt to the JSP.
        request.setAttribute("packages", packages);
        System.out.println("Number of packages.txt read: " + packages.size());

        getServletContext().getRequestDispatcher("/TravelPackages.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}