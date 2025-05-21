package servlets;

import com.packagemanagement.PackageBST;
import com.packagemanagement.PackageFileHandler;
import com.packagemanagement.TravelPackage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "addPackageServlet", value = "/addPackageServlet")
public class addPackageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/addPackage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String title = request.getParameter("title");
        String durationStr = request.getParameter("duration");
        String priceStr = request.getParameter("price");
        String category = request.getParameter("category");
        String destination = request.getParameter("destination");
        String seatsStr = request.getParameter("availableSeats");

        try {
            int duration = Integer.parseInt(durationStr);
            double price = Double.parseDouble(priceStr);
            int availableSeats = Integer.parseInt(seatsStr);

            TravelPackage tp = new TravelPackage(id, title, duration, price, category, destination, availableSeats);

            List<String> validationErrors = tp.validate();
            if (!validationErrors.isEmpty()) {
                request.setAttribute("errorList", validationErrors);
                request.getRequestDispatcher("/addPackage.jsp").forward(request, response);
                return;
            }

            PackageBST bst = (PackageBST) getServletContext().getAttribute("packageBST");
            if (bst == null) {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "PackageBST is not initialized.");
                return;
            }

            if (bst.searchById(id) != null) {
                request.setAttribute("error", "Package ID already exists!");
                request.getRequestDispatcher("/addPackage.jsp").forward(request, response);
                return;
            }

            String filePath = getServletContext().getRealPath("/packages.txt");
            PackageFileHandler.setFilePath(filePath);
            PackageFileHandler.writePackageToFile(tp);
            bst.insert(tp);

            response.sendRedirect("ViewPackages.jsp");

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid numeric input: " + e.getMessage());
            request.getRequestDispatcher("/addPackage.jsp").forward(request, response);
        }
    }
}
