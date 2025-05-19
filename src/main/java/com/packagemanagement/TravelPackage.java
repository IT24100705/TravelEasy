package com.packagemanagement;
import java.util.ArrayList;
import java.util.List;

public class TravelPackage {
    // Create the attributes.
    private String packageId;
    private String title;
    private int duration;
    private double price;
    private Category category;
    private String destination;
    private int availableSeats;

    // Create the parameterized constructor.
    public TravelPackage(String packageId, String title, int duration, double price, String name, String destination, int availableSeats) {
        this.packageId = packageId;
        this.title = title;
        this.duration = duration;
        this.price = price;
        this.category = new Category(name);
        this.destination = destination;
        this.availableSeats = availableSeats;
    }

    // Create getters and setters for the attributes.
    public String getPackageId() {
        return packageId;
    }

    public void setPackageId(String packageId) {
        this.packageId = packageId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public int getAvailableSeats() {
        return availableSeats;
    }

    public void setAvailableSeats(int availableSeats) {
        this.availableSeats = availableSeats;
    }

    // Create toString method.
    public String toString() {
        return (packageId + "|" + title + "|" + duration + "|" + price + "|" + category.getName() + "|" + destination + "|" + availableSeats);
    }

    // Validation method
    public List<String> validate() {
        List<String> errors = new ArrayList<>();

        if (packageId == null || packageId.trim().isEmpty()) {
            errors.add("Package ID is required.");
        }
        if (title == null || title.trim().isEmpty()) {
            errors.add("Title is required.");
        }
        if (duration <= 0) {
            errors.add("Duration must be greater than 0.");
        }
        if (price <= 0) {
            errors.add("Price must be a positive number.");
        }
        if (category == null || category.getName().trim().isEmpty()) {
            errors.add("Category is required.");
        }
        else if (!Category.predefinedCategories().contains(category.getName())) {
            errors.add("Invalid category selected.");
        }
        if (destination == null || destination.trim().isEmpty()) {
            errors.add("Destination is required.");
        }
        if (availableSeats < 0) {
            errors.add("Available seats cannot be negative.");
        }

        return errors;
    }

}
