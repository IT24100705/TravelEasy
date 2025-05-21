package Model;

public class Booking {
    private String bookingId;
    private String userName;
    private String contact;
    private String packageId;
    private String packageTitle;
    private String date;
    private double totalPrice;

    public Booking(String bookingId, String userName, String contact, String packageId,
                   String packageTitle, String date, double totalPrice) {
        this.bookingId = bookingId;
        this.userName = userName;
        this.contact = contact;
        this.packageId = packageId;
        this.packageTitle = packageTitle;
        this.date = date;
        this.totalPrice = totalPrice;
    }

    // Getters
    public String getBookingId() {
        return bookingId;
    }
    public String getUserName() {
        return userName;
    }
    public String getContact() {
        return contact;
    }
    public String getPackageId() {
        return packageId;
    }
    public String getPackageTitle() {
        return packageTitle;
    }
    public String getDate() {
        return date;
    }
    public double getTotalPrice() {
        return totalPrice;
    }
}