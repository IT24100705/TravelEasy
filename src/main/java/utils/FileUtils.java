package utils;

import entities.User;
import javax.servlet.ServletContext;

import java.io.*;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;

public class FileUtils {

    private static String getFilePath(ServletContext context) {
        return context.getRealPath("/WEB-INF/users.txt");
    }

    public static boolean emailExists(ServletContext context, String email) throws IOException {
        File file = new File(getFilePath(context));
        if (!file.exists()) return false;

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                User user = User.fromFileString(line);
                if (user != null && user.getEmail().equals(email)) {
                    return true;
                }
            }
        }
        return false;
    }

    public static void saveUser(ServletContext context, User user) throws IOException {
        File file = new File(getFilePath(context));
        File parentDir = file.getParentFile();
        if (!parentDir.exists()) {
            parentDir.mkdirs();
        }

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(file, true))) {
            writer.write(user.toFileString());
            writer.newLine();
        }
    }

    public static String validateLogin(ServletContext context, String email, String password) throws IOException {
        File file = new File(getFilePath(context));
        if (!file.exists()) return null;

        String passwordHash = PasswordUtils.hashPassword(password);
        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                User user = User.fromFileString(line);
                if (user != null && user.getEmail().equals(email) && user.getPasswordHash().equals(passwordHash)) {
                    return user.getRole();
                }
            }
        }
        return null;
    }

    public static boolean updateUserPassword(ServletContext context, String email, String newPassword) throws IOException {
        File file = new File(getFilePath(context));
        if (!file.exists()) return false;

        String newPasswordHash = PasswordUtils.hashPassword(newPassword);
        List<String> lines = new ArrayList<>();
        boolean updated = false;

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                User user = User.fromFileString(line);
                if (user != null && user.getEmail().equals(email)) {
                    user.setPasswordHash(newPasswordHash);
                    lines.add(user.toFileString());
                    updated = true;
                } else {
                    lines.add(line);
                }
            }
        }

        if (updated) {
            try (BufferedWriter writer = new BufferedWriter(new FileWriter(file))) {
                for (String updatedLine : lines) {
                    writer.write(updatedLine);
                    writer.newLine();
                }
            }
        }
        return updated;
    }

    public static boolean deleteUser(ServletContext context, String email) throws IOException {
        File file = new File(getFilePath(context));
        if (!file.exists()) return false;

        List<String> lines = new ArrayList<>();
        boolean deleted = false;

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                User user = User.fromFileString(line);
                if (user != null && user.getEmail().equals(email)) {
                    deleted = true;
                } else {
                    lines.add(line);
                }
            }
        }

        if (deleted) {
            try (BufferedWriter writer = new BufferedWriter(new FileWriter(file))) {
                for (String remainingLine : lines) {
                    writer.write(remainingLine);
                    writer.newLine();
                }
            }
        }
        return deleted;
    }
}