package customPackage;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class CustomPackageFileHandler {
    private static final String FILE_PATH = "custom_packages.txt";

    public static void saveCustomPackage(CustomPackage customPackage) throws IOException {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(customPackage.toString());
            writer.newLine();
        }
    }

    public static List<CustomPackage> loadAllCustomPackages() throws IOException {
        List<CustomPackage> customPackages = new ArrayList<>();
        File file = new File(FILE_PATH);
        if (!file.exists()) return customPackages;

        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                customPackages.add(CustomPackage.fromString(line));
            }
        }
        return customPackages;
    }

    public static boolean deletePackage(String packageId) {
        try {
            List<CustomPackage> packages = loadAllCustomPackages();

            boolean removed = packages.removeIf(pkg -> pkg.getPackageId().equals(packageId));

            if (removed) {
                try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
                    for (CustomPackage pkg : packages) {
                        writer.write(pkg.toString());
                        writer.newLine();
                    }
                }
                return true;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return false;
    }

    public static CustomPackage searchById(String packageId) throws IOException {
        List<CustomPackage> allPackages = loadAllCustomPackages(); // Implement this if not already done
        for (CustomPackage pkg : allPackages) {
            if (pkg.getPackageId().equalsIgnoreCase(packageId)) {
                return pkg;
            }
        }
        return null;
    }
}

