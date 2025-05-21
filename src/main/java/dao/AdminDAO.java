package dao;

import entities.User;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class AdminDAO {
    private static final String FILE_PATH = "users.txt";
    private String storagePath;

    public AdminDAO(String contextPath) {
        this.storagePath = contextPath + File.separator + FILE_PATH;
        ensureFileExists();
    }

    private void ensureFileExists() {
        File file = new File(storagePath);
        if (!file.exists()) {
            try {
                file.getParentFile().mkdirs();
                file.createNewFile();
            } catch (IOException e) {
                throw new RuntimeException("Could not create admin storage file", e);
            }
        }
    }

    public synchronized boolean addAdmin(User admin) {
        if (!admin.getRole().equalsIgnoreCase("admin")) {
            return false;
        }

        if (adminExists(admin.getEmail())) {
            return false;
        }

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(storagePath, true))) {
            writer.write(admin.toFileString());
            writer.newLine();
            return true;
        } catch (IOException e) {
            throw new RuntimeException("Error saving admin", e);
        }
    }

    public synchronized boolean deleteAdmin(String email) {
        List<User> admins = getAllAdmins();
        boolean removed = admins.removeIf(admin -> admin.getEmail().equalsIgnoreCase(email));

        if (removed) {
            try (BufferedWriter writer = new BufferedWriter(new FileWriter(storagePath))) {
                for (User admin : admins) {
                    writer.write(admin.toFileString());
                    writer.newLine();
                }
                return true;
            } catch (IOException e) {
                throw new RuntimeException("Error deleting admin", e);
            }
        }
        return false;
    }

    public synchronized List<User> getAllAdmins() {
        List<User> admins = new ArrayList<>();
        File file = new File(storagePath);

        if (!file.exists()) {
            return admins;
        }

        try (BufferedReader reader = new BufferedReader(new FileReader(storagePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                User admin = User.fromFileString(line);
                if (admin != null && admin.getRole().equalsIgnoreCase("admin")) {
                    admins.add(admin);
                }
            }
        } catch (IOException e) {
            throw new RuntimeException("Error reading admins", e);
        }

        return admins;
    }

    public synchronized boolean adminExists(String email) {
        return getAllAdmins().stream()
                .anyMatch(admin -> admin.getEmail().equalsIgnoreCase(email));
    }
}