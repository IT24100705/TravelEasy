package servlets;

import model.Booking;
import model.BookingManager;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet(name = "ConfirmBookingServlet", value = "/ConfirmBookingServlet")
public class ConfirmBookingServlet extends HttpServlet {
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
                try {
                        String userName = request.getParameter("userName");
                        String contact = request.getParameter("contact");
                        String packageId = request.getParameter("packageId");
                        String packageTitle = request.getParameter("packageTitle");
                        double price = Double.parseDouble(request.getParameter("price"));
                        String date = LocalDate.now().toString();

                        String bookingId = "BK" + System.currentTimeMillis();
                        Booking booking = new Booking(bookingId, userName, contact, packageId, packageTitle, date, price);

                        // Save to text file using the servlet context
                        BookingManager.saveBooking(booking, request.getServletContext());

                        request.setAttribute("booking", booking);
                        request.getRequestDispatcher("bookingSuccess.jsp").forward(request, response);

                } catch (Exception e) {
                        e.printStackTrace(); // Log the error
                        request.setAttribute("error", "Failed to process booking: " + e.getMessage());
                        request.getRequestDispatcher("error.jsp").forward(request, response);
                }
        }
}