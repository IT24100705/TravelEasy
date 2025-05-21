<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
  <title>Book Package</title>
  <style>
    :root {
      --primary: #4361ee;
      --primary-light: #4895ef;
      --success: #4cc9f0;
      --danger: #f72585;
      --dark: #2b2d42;
      --card-bg: rgba(255, 255, 255, 0.15);
      --card-border: rgba(255, 255, 255, 0.2);
      --text-light: rgba(255, 255, 255, 0.9);
    }

    body {
      font-family: 'Poppins', sans-serif;
      background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)),
      url('https://theaseanmagazine.asean.org/files/media/2024/03/issue36-42-1.jpg') no-repeat center center fixed;
      background-size: cover;
      color: white;
      min-height: 100vh;
      margin: 0;
      padding: 0;
    }

    .dashboard-container {
      max-width: 600px;
      margin: 4rem auto;
      padding: 2rem;
      backdrop-filter: blur(10px);
    }

    .card {
      background: var(--card-bg);
      border-radius: 15px;
      padding: 2rem;
      box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
      border: 1px solid var(--card-border);
    }

    h1 {
      text-align: center;
      margin-bottom: 2rem;
      background: linear-gradient(to right, var(--primary), var(--success));
      -webkit-background-clip: text;
      background-clip: text;
      color: transparent;
      font-size: 2rem;
    }

    form {
      display: flex;
      flex-direction: column;
      gap: 1.25rem;
    }

    label {
      color: var(--text-light);
      font-weight: 500;
      margin-bottom: 0.3rem;
      display: block;
    }

    input[type="text"] {
      width: 100%;
      padding: 0.75rem 1rem;
      background: rgba(255, 255, 255, 0.1);
      border: 1px solid rgba(255, 255, 255, 0.2);
      border-radius: 8px;
      color: white;
      font-size: 1rem;
    }

    input[type="text"]:focus {
      outline: none;
      border-color: var(--primary);
      box-shadow: 0 0 0 2px rgba(67, 97, 238, 0.3);
    }

    input[type="submit"] {
      padding: 0.8rem 1.2rem;
      background: linear-gradient(to right, var(--primary), var(--primary-light));
      color: white;
      font-weight: bold;
      font-size: 1rem;
      border: none;
      border-radius: 50px;
      cursor: pointer;
      transition: all 0.3s ease;
    }

    input[type="submit"]:hover {
      transform: translateY(-3px);
      box-shadow: 0 7px 20px rgba(0, 0, 0, 0.3);
    }
  </style>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
</head>
<body>

<div class="dashboard-container">
  <div class="card">
    <h1>Book Package: ${selectedPackage.title}</h1>
    <form action="ConfirmBookingServlet" method="post">
      <input type="hidden" name="packageId" value="${selectedPackage.packageId}">
      <input type="hidden" name="packageTitle" value="${selectedPackage.title}">
      <input type="hidden" name="price" value="${selectedPackage.price}">

      <div>
        <label for="userName">Name:</label>
        <input type="text" name="userName" id="userName" required>
      </div>

      <div>
        <label for="contact">Contact:</label>
        <input type="text" name="contact" id="contact" required>
      </div>

      <input type="submit" value="Confirm Booking">
    </form>
  </div>
</div>

</body>
</html>
