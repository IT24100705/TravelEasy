package com.packagemanagement;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class PackageFileHandler {

    // This will be set dynamically based on servlet context in the servlet
    private static String FILENAME = "packages.txt";

    // Method to set the file path dynamically (called in the servlet)
    public static void setFilePath(String filePath) {
        FILENAME = filePath;
    }

    // Method to write a package to the file
    public static void writePackageToFile(TravelPackage travelPackage) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILENAME, true))) {
            writer.write(travelPackage.toString());
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Method to read all the packages.txt from the file
    public static List<TravelPackage> readPackageFromFile() {
        List<TravelPackage> travelPackages = new ArrayList<>();

        try {
            File file = new File(FILENAME);
            if (!file.exists()) {
                file.createNewFile();  // Create the file if it doesn't exist
            }

            try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    String[] parts = line.split("\\|");
                    if (parts.length != 7) continue;  // Skip malformed lines

                    String id = parts[0];
                    String title = parts[1];
                    int duration = Integer.parseInt(parts[2]);
                    double price = Double.parseDouble(parts[3]);
                    String category = parts[4];
                    String destination = parts[5];
                    int availableSeats = Integer.parseInt(parts[6]);

                    TravelPackage tp = new TravelPackage(id, title, duration, price, category, destination, availableSeats);
                    travelPackages.add(tp);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return travelPackages;
    }

    // Method to delete a package by ID from the file
    public static boolean deletePackageFromFile(String packageId) {
        List<TravelPackage> travelPackages = readPackageFromFile();
        boolean removed = false;

        // Remove the package with the matching ID
        for (int i = 0; i < travelPackages.size(); i++) {
            if (travelPackages.get(i).getPackageId().equals(packageId)) {
                travelPackages.remove(i);
                removed = true;
                break;
            }
        }

        // If a package was removed, rewrite the updated list to the file
        if (removed) {
            try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILENAME))) {
                for (TravelPackage pkg : travelPackages) {
                    writer.write(pkg.toString());
                    writer.newLine();
                }
                return true;
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        return false;  // Package not found
    }
}
