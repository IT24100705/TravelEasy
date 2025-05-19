package customPackage;

import java.util.List;
import java.util.Arrays;

import com.packagemanagement.TravelPackage;
import entities.User;


public class CustomPackage extends TravelPackage {
    private List<String> selectedActivities;
    private String selectedHotelClass;
    private String selectedVehicleType;
    private boolean driverStatus;
    private User user;

    public CustomPackage(String packageId, String title, int duration, double price, String categoryName,
                         String destination, int availableSeats,
                         List<String> selectedActivities, String selectedHotelClass, String selectedVehicleType, boolean driverStatus, User user) {
        super(packageId, title, duration, price, categoryName, destination, availableSeats);
        this.selectedActivities = selectedActivities;
        this.selectedHotelClass = selectedHotelClass;
        this.selectedVehicleType = selectedVehicleType;
        this.driverStatus = driverStatus;
        this.user = user;
    }

    public List<String> getSelectedActivities() {
        return selectedActivities;
    }

    public String getSelectedHotelClass() {
        return selectedHotelClass;
    }

    public String getSelectedVehicleType() {
        return selectedVehicleType;
    }



    public String getDriverStatus() {
        return driverStatus ? "With Driver" : "Without Driver";
    }

    public User getUser() {
        return user;
    }

    @Override
    public String toString() {
        return super.toString() + "|" +
                String.join(",", selectedActivities) + "|" +
                selectedHotelClass + "|" +
                selectedVehicleType + "|" +
                driverStatus + "|" +
                user.getEmail();

    }

    public static CustomPackage fromString(String line) {
        String[] parts = line.split("\\|");
        String packageId = parts[0];
        String title = parts[1];
        int duration = Integer.parseInt(parts[2]);
        double price = Double.parseDouble(parts[3]);
        String categoryName = parts[4];
        String destination = parts[5];
        int availableSeats = Integer.parseInt(parts[6]);

        List<String> activities = Arrays.asList(parts[7].split(","));

        String hotelClass = parts[8];
        String vehicleType = parts[9];
        boolean driverStatus = Boolean.parseBoolean(parts[10]);
        String userEmail = parts[11];

        // Create a dummy User with just the email
        User dummyUser = new User("", "", userEmail, "", "customer");



        return new CustomPackage(packageId, title, duration, price, categoryName, destination,
                availableSeats, activities, hotelClass, vehicleType, driverStatus, dummyUser);
    }

    @Override
    public List<String> validate() {
        List<String> errors = super.validate(); // Validate base class fields

        // Validate activities
        if (selectedActivities == null || selectedActivities.isEmpty()) {
            errors.add("At least one activity must be selected.");
        }

        // Validate hotel class
        if (selectedHotelClass == null || selectedHotelClass.trim().isEmpty()) {
            errors.add("Hotel class must be selected.");
        } else {
            List<String> validHotelClasses = Arrays.asList("3-star", "4-star", "5-star");
            if (!validHotelClasses.contains(selectedHotelClass)) {
                errors.add("Invalid hotel class selected.");
            }
        }

        // Validate vehicle type
        if (selectedVehicleType == null || selectedVehicleType.trim().isEmpty()) {
            errors.add("Vehicle type must be selected.");
        }

        // Validate withDriver
        if (!driverStatus && driverStatus != false) {
            errors.add("Please specify if a driver is included.");
        }

        return errors;
    }
}
