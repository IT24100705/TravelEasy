package servlets;

import cart.CartItem;
import cart.CartFileManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/deleteCartItem")
public class DeleteCartItemServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String packageId = request.getParameter("packageId");

        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart != null) {
            cart.removeIf(item -> item.getTravelPackage().getPackageId().equals(packageId));

            // Save the updated cart to file
            CartFileManager.saveCartToFile(cart);
        }

        session.setAttribute("cart", cart);
        response.sendRedirect("cart.jsp");
    }
}
