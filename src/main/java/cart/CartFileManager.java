package cart;

import com.packagemanagement.TravelPackage;
import javax.servlet.ServletContext;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class CartFileManager {
    // Use a relative path that will be resolved against the webapp root
    private static final String CART_FILE = "/cart.txt";
    private static ServletContext servletContext;

    // Set the servlet context (call this from a servlet's init() method)
    public static void setServletContext(ServletContext context) {
        servletContext = context;
    }

    // Save all cart items to file
    public static void saveCartToFile(List<CartItem> cartItems) {
        if (servletContext == null) {
            System.err.println("ServletContext not set in CartFileManager");
            return;
        }

        String filePath = servletContext.getRealPath(CART_FILE);
        if (filePath == null) {
            System.err.println("Could not resolve real path for: " + CART_FILE);
            return;
        }

        // Ensure directory exists
        File file = new File(filePath);
        file.getParentFile().mkdirs();

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))) {
            for (CartItem item : cartItems) {
                TravelPackage pkg = item.getTravelPackage();
                writer.write(pkg.getPackageId() + "," +
                        pkg.getTitle() + "," +
                        pkg.getDestination() + "," +
                        pkg.getDuration() + "," +
                        pkg.getPrice() + "," +
                        pkg.getCategory().getName() + "," +
                        pkg.getAvailableSeats() + "," +
                        item.getQuantity());
                writer.newLine();
            }
        } catch (IOException e) {
            System.err.println("Error saving cart to file: " + filePath);
            e.printStackTrace();
        }
    }

    // Load all cart items from file
    public static List<CartItem> loadCartFromFile() {
        List<CartItem> cartItems = new ArrayList<>();

        if (servletContext == null) {
            System.err.println("ServletContext not set in CartFileManager");
            return cartItems;
        }

        String filePath = servletContext.getRealPath(CART_FILE);
        if (filePath == null) {
            System.err.println("Could not resolve real path for: " + CART_FILE);
            return cartItems;
        }

        File file = new File(filePath);
        if (!file.exists()) {
            try {
                file.getParentFile().mkdirs();
                file.createNewFile();
                return cartItems; // Return empty list for new file
            } catch (IOException e) {
                System.err.println("Error creating cart file: " + filePath);
                return cartItems;
            }
        }

        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length >= 8) {
                    String id = parts[0];
                    String title = parts[1];
                    String destination = parts[2];
                    int duration = Integer.parseInt(parts[3]);
                    double price = Double.parseDouble(parts[4]);
                    String category = parts[5];
                    int availableSeats = Integer.parseInt(parts[6]);
                    int quantity = Integer.parseInt(parts[7]);

                    TravelPackage pkg = new TravelPackage(id, title, duration, price,
                            category, destination, availableSeats);
                    CartItem item = new CartItem(pkg);

                    for (int i = 1; i < quantity; i++) {
                        item.incrementQuantity();
                    }

                    cartItems.add(item);
                }
            }
        } catch (IOException | NumberFormatException e) {
            System.err.println("Error loading cart from file: " + filePath);
            e.printStackTrace();
        }

        return cartItems;
    }
}
