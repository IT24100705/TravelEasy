package servlets;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "PaymentServlet", value = "/PaymentServlet")
public class PaymentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get payment details from request
        String cardNumber = request.getParameter("cardNumber");
        String cardHolder = request.getParameter("cardHolder");
        String expMonth = request.getParameter("expMonth");
        String expYear = request.getParameter("expYear");
        String cvv = request.getParameter("cvv");
        String amount = request.getParameter("amount");

        // Basic validation
        if (cardNumber == null || cardNumber.replaceAll("\\s", "").length() != 16 ||
                cardHolder == null || cardHolder.trim().isEmpty() ||
                expMonth == null || expMonth.length() != 2 ||
                expYear == null || expYear.length() != 4 ||
                cvv == null || cvv.length() != 3 ||
                amount == null || Double.parseDouble(amount) <= 0) {

            request.setAttribute("errorMessage", "Invalid payment details. Please check your inputs.");
            request.getRequestDispatcher("paymentForm.jsp").forward(request, response);
            return;
        }

        try {
            // In a real application, you would:
            // 1. Create a payment request to your payment gateway (Stripe, PayPal, etc.)
            // 2. Process the payment
            // 3. Handle the response

            // For simulation purposes, we'll just log the details
            System.out.println("Processing payment:");
            System.out.println("Card: " + cardNumber);
            System.out.println("Holder: " + cardHolder);
            System.out.println("Exp: " + expMonth + "/" + expYear);
            System.out.println("Amount: $" + amount);

            // Set payment attributes for the success page
            request.setAttribute("cardLastFour", cardNumber.substring(cardNumber.length() - 4));
            request.setAttribute("amount", amount);

            // Forward to success page
            request.getRequestDispatcher("paymentSuccess.jsp").forward(request, response);

        } catch (Exception e) {
            // Handle payment processing errors
            request.setAttribute("errorMessage", "Payment failed: " + e.getMessage());
            request.getRequestDispatcher("paymentForm.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // For GET requests, show the payment form
        request.getRequestDispatcher("paymentForm.jsp").forward(request, response);
    }
}