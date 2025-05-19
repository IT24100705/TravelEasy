package model;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;

public class BookingManager {
    private static final String FILE_NAME = "bookings.txt";
    private static final String DELIMITER = "|";

    // Save booking (existing method)
    public static synchronized void saveBooking(Booking booking, ServletContext context) throws IOException {
        String filePath = context.getRealPath(FILE_NAME);
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath, true))) {
            writer.write(bookingToString(booking));
            writer.newLine();
        }
    }

    // View all bookings
    public static List<Booking> getAllBookings(ServletContext context) throws IOException {
        List<Booking> bookings = new ArrayList<>();
        String filePath = context.getRealPath(FILE_NAME);
        File bookingsFile = new File(filePath);

        if (!bookingsFile.exists()) {
            return bookings;
        }

        try (BufferedReader reader = new BufferedReader(new FileReader(bookingsFile))) {
            String line;
            while ((line = reader.readLine()) != null) {
                Booking booking = parseBooking(line);
                if (booking != null) {
                    bookings.add(booking);
                }
            }
        }
        return bookings;
    }

    // Delete booking by ID
    public static synchronized boolean deleteBooking(String bookingId, ServletContext context) throws IOException {
        String filePath = context.getRealPath(FILE_NAME);
        File bookingsFile = new File(filePath);

        if (!bookingsFile.exists()) {
            return false;
        }

        // Read all bookings except the one to delete
        List<Booking> bookings = new ArrayList<>();
        boolean found = false;

        try (BufferedReader reader = new BufferedReader(new FileReader(bookingsFile))) {
            String line;
            while ((line = reader.readLine()) != null) {
                Booking booking = parseBooking(line);
                if (booking != null) {
                    if (!booking.getBookingId().equals(bookingId)) {
                        bookings.add(booking);
                    } else {
                        found = true;
                    }
                }
            }
        }

        // Rewrite the file without the deleted booking
        if (found) {
            try (BufferedWriter writer = new BufferedWriter(new FileWriter(bookingsFile))) {
                for (Booking booking : bookings) {
                    writer.write(bookingToString(booking));
                    writer.newLine();
                }
            }
        }

        return found;
    }

    private static String bookingToString(Booking booking) {
        return booking.getBookingId() + DELIMITER +
                booking.getUserName() + DELIMITER +
                booking.getContact() + DELIMITER +
                booking.getPackageId() + DELIMITER +
                booking.getPackageTitle() + DELIMITER +
                booking.getDate() + DELIMITER +
                booking.getTotalPrice();
    }

    private static Booking parseBooking(String line) {
        String[] parts = line.split("\\" + DELIMITER);
        if (parts.length == 7) {
            return new Booking(
                    parts[0], parts[1], parts[2], parts[3],
                    parts[4], parts[5], Double.parseDouble(parts[6])
            );
        }
        return null;
    }
}