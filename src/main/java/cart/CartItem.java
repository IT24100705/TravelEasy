package cart;

import com.packagemanagement.TravelPackage;

public class CartItem {
    private TravelPackage travelPackage;
    private int quantity;

    public CartItem(TravelPackage travelPackage) {
        this.travelPackage = travelPackage;
        this.quantity = 1;
    }

    public TravelPackage getTravelPackage() {
        return travelPackage;
    }

    public int getQuantity() {
        return quantity;
    }

    public void incrementQuantity() {
        this.quantity++;
    }

    public double getTotalPrice() {
        return travelPackage.getPrice() * quantity;
    }
}
