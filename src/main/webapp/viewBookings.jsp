<%@ page import="model.Booking" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>View Bookings</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    :root {
      --primary-color: #4e73df;
      --success-color: #1cc88a;
      --danger-color: #e74a3b;
      --light-bg: #f8f9fc;
    }

    body {
      background-color: var(--light-bg);
      font-family: 'Nunito', -apple-system, BlinkMacSystemFont, sans-serif;
    }

    .card {
      border: none;
      border-radius: 0.35rem;
      box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15);
    }

    .card-header {
      background-color: #f8f9fc;
      border-bottom: 1px solid #e3e6f0;
      padding: 1rem 1.35rem;
    }

    .table-responsive {
      overflow-x: auto;
    }

    .table {
      margin-bottom: 0;
    }

    .table th {
      border-top: none;
      color: #4e73df;
      font-weight: 600;
      text-transform: uppercase;
      font-size: 0.65rem;
      letter-spacing: 0.1em;
    }

    .badge-success {
      background-color: var(--success-color);
    }

    .action-btn {
      padding: 0.25rem 0.5rem;
      font-size: 0.875rem;
      border-radius: 0.2rem;
    }

    .empty-state {
      padding: 3rem;
      text-align: center;
      color: #5a5c69;
    }

    .empty-state i {
      font-size: 3rem;
      margin-bottom: 1rem;
      color: #dddfeb;
    }
  </style>
</head>
<body>
<div class="container-fluid py-5">
  <div class="row justify-content-center">
    <div class="col-lg-10">
      <div class="card">
        <div class="card-header d-flex justify-content-between align-items-center">
          <h5 class="m-0 font-weight-bold text-primary">Booking Management</h5>
          <a href="index.jsp" class="btn btn-sm btn-outline-secondary">
            <i class="fas fa-arrow-left mr-2"></i>Back to Home
          </a>
        </div>

        <div class="card-body">
          <% if (request.getParameter("deleted") != null) { %>
          <div class="alert alert-success alert-dismissible fade show" role="alert">
            <i class="fas fa-check-circle mr-2"></i>
            Booking deleted successfully!
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
          </div>
          <% } %>

          <div class="table-responsive">
            <table class="table table-hover">
              <thead>
              <tr>
                <th>Booking ID</th>
                <th>User Name</th>
                <th>Contact</th>
                <th>Package</th>
                <th>Date</th>
                <th>Price</th>
                <th>Status</th>
                <th>Actions</th>
              </tr>
              </thead>
              <tbody>
              <% List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
                if (bookings != null && !bookings.isEmpty()) {
                  for (Booking booking : bookings) { %>
              <tr>
                <td>#<%= booking.getBookingId() %></td>
                <td><%= booking.getUserName() %></td>
                <td><%= booking.getContact() %></td>
                <td><span class="badge bg-primary"><%= booking.getPackageTitle() %></span></td>
                <td><%= booking.getDate() %></td>
                <td class="font-weight-bold">$<%= String.format("%.2f", booking.getTotalPrice()) %></td>
                <td><span class="badge badge-success">Confirmed</span></td>
                <td>
                  <div class="d-flex">
                    <form action="DeleteBookingServlet" method="post" class="me-2">
                      <input type="hidden" name="bookingId" value="<%= booking.getBookingId() %>">
                      <button type="submit" class="btn btn-sm btn-danger action-btn"
                              onclick="return confirm('Are you sure you want to delete this booking?')">
                        <i class="fas fa-trash-alt"></i>
                      </button>
                    </form>
                    <a href="EditBookingServlet?bookingId=<%= booking.getBookingId() %>"
                       class="btn btn-sm btn-primary action-btn">
                      <i class="fas fa-edit"></i>
                    </a>
                  </div>
                </td>
              </tr>
              <% }
              } else { %>
              <tr>
                <td colspan="8">
                  <div class="empty-state">
                    <i class="far fa-calendar-alt"></i>
                    <h4>No Bookings Found</h4>
                    <p class="text-muted">You don't have any bookings yet. Start by creating a new booking.</p>
                    <a href="index.jsp" class="btn btn-primary mt-3">
                      <i class="fas fa-plus mr-2"></i>Create Booking
                    </a>
                  </div>
                </td>
              </tr>
              <% } %>
              </tbody>
            </table>
          </div>
        </div>

        <div class="card-footer d-flex justify-content-between align-items-center">
          <div class="text-muted small">
            Showing <strong><%= bookings != null ? bookings.size() : 0 %></strong> bookings
          </div>
          <nav aria-label="Page navigation">
            <ul class="pagination pagination-sm m-0">
              <li class="page-item disabled">
                <a class="page-link" href="#" tabindex="-1">Previous</a>
              </li>
              <li class="page-item active"><a class="page-link" href="#">1</a></li>
              <li class="page-item"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item">
                <a class="page-link" href="#">Next</a>
              </li>
            </ul>
          </nav>
        </div>
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
  // Enable Bootstrap tooltips
  document.addEventListener('DOMContentLoaded', function() {
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
      return new bootstrap.Tooltip(tooltipTriggerEl)
    });
  });
</script>
</body>
</html>