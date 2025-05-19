package com.packagemanagement;
import java.util.Arrays;
import java.util.List;

public class Category {
    String name;

    // Create the parameterized constructor.
    public Category(String name) {
        this.name = name;
    }

    // Create a setter for name.
    public void setName(String name) {
        this.name = name;
    }

    // Create a getter for name.
    public String getName() {
        return name;
    }

    // Static predefined category names
    public static List<String> predefinedCategories() {
        return Arrays.asList(
                "Adventure",
                "Cultural",
                "Beach",
                "Wildlife",
                "Honeymoon",
                "Family",
                "Luxury",
                "Budget",
                "Cruise",
                "Pilgrimage",
                "Relaxation"

        );
    }
}
