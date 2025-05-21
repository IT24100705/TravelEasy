package servlets;

import cart.CartItem;
import cart.CartFileManager;
import com.packagemanagement.PackageBST;
import com.packagemanagement.TravelPackage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/addToCart")
public class CartServlet extends HttpServlet {

    @Override
    public void init() throws ServletException {
        // Set the servlet context in CartFileManager
        CartFileManager.setServletContext(getServletContext());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String packageId = request.getParameter("packageId");

        PackageBST bst = (PackageBST) getServletContext().getAttribute("packageBST");
        TravelPackage travelPackage = bst.searchById(packageId);

        if (travelPackage == null) {
            response.sendRedirect("error.jsp");
            return;
        }

        // Ignore CustomPackage
        if (travelPackage.getClass().getSimpleName().equals("CustomPackage")) {
            response.sendRedirect("home.jsp");
            return;
        }

        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = CartFileManager.loadCartFromFile(); // Load from file if new session
        }

        boolean exists = false;
        for (CartItem item : cart) {
            if (item.getTravelPackage().getPackageId().equals(travelPackage.getPackageId())) {
                item.incrementQuantity();
                exists = true;
                break;
            }
        }

        if (!exists) {
            cart.add(new CartItem(travelPackage));
        }

        // Save to both session AND file
        session.setAttribute("cart", cart);
        CartFileManager.saveCartToFile(cart);

        response.sendRedirect("cart.jsp");
    }
}