package servlets;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

import customPackage.CustomPackage;
import customPackage.CustomPackageFileHandler;
import entities.User;

import java.util.List;
import java.util.Arrays;
import java.util.Random;

@WebServlet(name = "CustomPackageBuilderServlet", value = "/CustomPackageBuilderServlet")
public class CustomPackageBuilderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Pass the category list from Category class to the JSP
        request.setAttribute("categories", com.packagemanagement.Category.predefinedCategories());

        // Forward request to the JSP page to show the form
        request.getRequestDispatcher("customPackageBuilder.jsp").forward(request, response);



    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Auto-generate a unique Friendship package ID
            Random random = new Random();
            int numericId = 10000000 + random.nextInt(90000000);

            String packageId = "PKG-" + String.format("%08d", numericId);
            String title = request.getParameter("title");
            int duration = Integer.parseInt(request.getParameter("duration"));
            String category = request.getParameter("category");
            String destination = request.getParameter("destination");
            int availableSeats = Integer.parseInt(request.getParameter("availableSeats"));
            List<String> selectedActivities = Arrays.asList(request.getParameterValues("activities"));
            String selectedHotelClass = request.getParameter("hotelClass");
            String selectedVehicleType = request.getParameter("vehicleType");
            boolean driverStatus = Boolean.parseBoolean(request.getParameter("driverStatus"));

            // --- PRICE CALCULATION STARTS HERE ---
            final double BASE_COST_PER_PERSON = 1000.0;
            final double ACTIVITY_COST_PER_PERSON = 4000.0;

            double hotelClassCostPerPerson = 0.0;
            switch (selectedHotelClass) {
                case "5-star":
                    hotelClassCostPerPerson = 3000.0;
                    break;
                case "3-star":
                    hotelClassCostPerPerson = 2000.0;
                    break;
                case "Budget":
                    hotelClassCostPerPerson = 1000.0;
                    break;
            }

            int numberOfActivities = selectedActivities != null ? selectedActivities.size() : 0;

            double pricePerPerson = BASE_COST_PER_PERSON + (numberOfActivities * ACTIVITY_COST_PER_PERSON) + hotelClassCostPerPerson;
            double totalPrice = availableSeats * pricePerPerson;


            // Retrieve logged-in user from session
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("email") == null) {
                request.setAttribute("error", "User not logged in.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }

            //  Create a User object using session values
            String userName = (String) session.getAttribute("name");
            String userEmail = (String) session.getAttribute("email");
            String userRole = (String) session.getAttribute("role");
            User user = new User(userName, "", userEmail, "", userRole); // phone/password not needed here



            CustomPackage customPackage = new CustomPackage(
                    packageId, title, duration, totalPrice, category, destination, availableSeats,
                    selectedActivities, selectedHotelClass, selectedVehicleType, driverStatus, user
            );

            // Save to file
            CustomPackageFileHandler.saveCustomPackage(customPackage);

            request.setAttribute("customPackage", customPackage);
            request.getRequestDispatcher("customPackageConfirmation.jsp").forward(request, response);

        } catch (Exception e) {
            request.setAttribute("error", "Error building custom package: " + e.getMessage());
            request.getRequestDispatcher("customPackageBuilder.jsp").forward(request, response);
        }

    }
}
