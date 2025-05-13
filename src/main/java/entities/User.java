package entities;

public class User {
    private String name;
    private String telephone;
    private String email;
    private String passwordHash;
    private String role;

    public User(String name, String telephone, String email, String passwordHash, String role) {
        this.name = name;
        this.telephone = telephone;
        this.email = email;
        this.passwordHash = passwordHash;
        this.role = role;
    }

    public String getName() { return name; }
    public String getTelephone() { return telephone; }
    public String getEmail() { return email; }
    public String getPasswordHash() { return passwordHash; }
    public String getRole() { return role; }
    public void setPasswordHash(String passwordHash) { this.passwordHash = passwordHash; }

    public String toFileString() {
        return name + ":" + telephone + ":" + email + ":" + passwordHash + ":" + role;
    }

    public static User fromFileString(String line) {
        if (line == null || !line.contains(":")) return null;
        String[] parts = line.split(":");
        if (parts.length != 5) return null;
        return new User(parts[0], parts[1], parts[2], parts[3], parts[4]);
    }
}