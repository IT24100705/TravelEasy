<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<html>
<head>
  <title>Build Custom Package</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
  <style>
    :root {
      --primary: #4361ee;
      --primary-dark: #3a56d4;
      --secondary: #3f37c9;
      --success: #4cc9f0;
      --warning: #f8961e;
      --danger: #f72585;
      --light: #f8f9fa;
      --dark: #212529;
      --gray: #6c757d;
      --white: #ffffff;
    }

    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      font-family: 'Poppins', sans-serif;
      background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),
      url('https://theaseanmagazine.asean.org/files/media/2024/03/issue36-42-1.jpg') no-repeat center center fixed;
      background-size: cover;
      color: var(--dark);
      line-height: 1.6;
      min-height: 100vh;
    }

    .container {
      max-width: 800px;
      margin: 2rem auto;
      padding: 2rem;
      background: rgba(255, 255, 255, 0.95);
      border-radius: 12px;
      box-shadow: 0 8px 30px rgba(0, 0, 0, 0.12);
      backdrop-filter: blur(5px);
      border: 1px solid rgba(255, 255, 255, 0.2);
    }

    h1 {
      text-align: center;
      color: var(--primary);
      margin-bottom: 2rem;
      font-size: 2.2rem;
      font-weight: 600;
      padding-bottom: 0.5rem;
      border-bottom: 2px solid var(--success);
    }

    .form-grid {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 1.5rem;
      margin-bottom: 1.5rem;
    }

    .form-group {
      margin-bottom: 1.25rem;
    }

    .form-group.full-width {
      grid-column: span 2;
    }

    label {
      display: block;
      margin-bottom: 0.5rem;
      font-weight: 500;
      color: var(--secondary);
    }

    input, select {
      width: 100%;
      padding: 0.75rem 1rem;
      border: 1px solid #ddd;
      border-radius: 8px;
      font-size: 1rem;
      font-family: 'Poppins', sans-serif;
      transition: all 0.3s ease;
      background-color: rgba(255, 255, 255, 0.8);
    }

    input:focus, select:focus {
      outline: none;
      border-color: var(--primary);
      box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.2);
    }

    .checkbox-group {
      display: flex;
      flex-wrap: wrap;
      gap: 1rem;
      margin-top: 0.5rem;
    }

    .checkbox-item {
      display: flex;
      align-items: center;
      background: rgba(248, 249, 250, 0.7);
      padding: 0.5rem 1rem;
      border-radius: 50px;
      transition: all 0.2s ease;
    }

    .checkbox-item:hover {
      background: rgba(67, 97, 238, 0.1);
    }

    .checkbox-item input {
      width: auto;
      margin-right: 0.5rem;
    }

    .submit-btn {
      background-color: var(--primary);
      color: var(--white);
      border: none;
      padding: 0.875rem 1.75rem;
      font-size: 1rem;
      font-weight: 500;
      border-radius: 50px;
      cursor: pointer;
      transition: all 0.3s ease;
      display: block;
      width: 100%;
      margin-top: 1rem;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .submit-btn:hover {
      background-color: var(--primary-dark);
      transform: translateY(-2px);
      box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
    }

    .error-message {
      background-color: #fee2e2;
      color: var(--danger);
      padding: 1rem;
      border-radius: 8px;
      margin-top: 1.5rem;
      border-left: 4px solid var(--danger);
      font-weight: 500;
    }

    @media (max-width: 768px) {
      .container {
        margin: 1rem;
        padding: 1.5rem;
      }

      .form-grid {
        grid-template-columns: 1fr;
      }

      .form-group.full-width {
        grid-column: span 1;
      }

      h1 {
        font-size: 1.8rem;
      }
    }
  </style>
</head>
<body>
<div class="container">
  <h1>Build Your Custom Package</h1>

  <form action="CustomPackageBuilderServlet" method="post">
    <div class="form-grid">
      <div class="form-group">
        <label for="title">Package Title</label>
        <input type="text" id="title" name="title" required placeholder="e.g., Tropical Adventure">
      </div>

      <div class="form-group">
        <label for="duration">Duration (days)</label>
        <input type="number" id="duration" name="duration" required min="1" placeholder="7">
      </div>

      <div class="form-group">
        <label for="category">Category</label>
        <select id="category" name="category" required>
          <%
            List<String> categories = (List<String>) request.getAttribute("categories");
            if (categories != null) {
              for (String cat : categories) {
          %>
          <option value="<%= cat %>"><%= cat %></option>
          <%
              }
            }
          %>
        </select>
      </div>

      <div class="form-group">
        <label for="destination">Destination</label>
        <input type="text" id="destination" name="destination" required placeholder="Enter destination">
      </div>

      <div class="form-group">
        <label for="availableSeats">Available Seats</label>
        <input type="number" id="availableSeats" name="availableSeats" required min="1" placeholder="10">
      </div>

      <div class="form-group full-width">
        <label>Activities</label>
        <div class="checkbox-group">
          <div class="checkbox-item">
            <input type="checkbox" id="hiking" name="activities" value="Hiking">
            <label for="hiking">Hiking</label>
          </div>
          <div class="checkbox-item">
            <input type="checkbox" id="surfing" name="activities" value="Surfing">
            <label for="surfing">Surfing</label>
          </div>
          <div class="checkbox-item">
            <input type="checkbox" id="museum" name="activities" value="Museum Visit">
            <label for="museum">Museum Visit</label>
          </div>
          <div class="checkbox-item">
            <input type="checkbox" id="museum" name="activities" value="Museum Visit">
            <label for="museum">City tours with local guides</label>
          </div>
          <div class="checkbox-item">
            <input type="checkbox" id="museum" name="activities" value="Museum Visit">
            <label for="museum">Whale watching</label>
          </div>
          <div class="checkbox-item">
            <input type="checkbox" id="safari" name="activities" value="Safari">
            <label for="safari">Safari</label>
          </div>
        </div>
      </div>

      <div class="form-group">
        <label for="hotelClass">Hotel Class</label>
        <select id="hotelClass" name="hotelClass">
          <option value="5-star">5-star Luxury</option>
          <option value="3-star">3-star Comfort</option>
          <option value="Budget">Budget Friendly</option>
        </select>
      </div>

      <div class="form-group">
        <label for="vehicleType">Vehicle Type *</label>
        <select id="vehicleType" name="vehicleType" required>
          <option value="" disabled selected>Select</option>
          <option value="Car - Max. 3 Pax">Car - Max. 3 Pax</option>
          <option value="Mini Van - Max. 6 Pax">Mini Van - Max. 6 Pax</option>
          <option value="Van - Max. 9 Pax">Van - Max. 9 Pax</option>
          <option value="Mini Bus - Max. 16 Pax">Mini Bus - Max. 16 Pax</option>
          <option value="Coach - Max. 25 Pax">Coach - Max. 25 Pax</option>
        </select>
      </div>

      <div class="form-group">
        <label for="driverStatus">Driver Option</label>
        <select id="driverStatus" name="driverStatus" required>
          <option value="With Driver">With Driver</option>
          <option value="Without Driver">Without Driver</option>
        </select>
      </div>
    </div>

    <button type="submit" class="submit-btn">Create Custom Package</button>
  </form>

  <% if (request.getAttribute("error") != null) { %>
  <div class="error-message">
    <%= request.getAttribute("error") %>
  </div>
  <% } %>
</div>
</body>
</html>
