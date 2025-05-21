<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Booking Confirmation</title>
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

        .confirmation-container {
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
            text-align: center;
        }

        h1 {
            background: linear-gradient(to right, var(--primary), var(--success));
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            font-size: 2rem;
            margin-bottom: 1.5rem;
        }

        p {
            font-size: 1.1rem;
            color: var(--text-light);
            margin: 0.75rem 0;
        }

        input[type="submit"] {
            padding: 0.75rem 1.5rem;
            background: linear-gradient(to right, var(--primary), var(--primary-light));
            color: white;
            font-weight: bold;
            font-size: 1rem;
            border: none;
            border-radius: 50px;
            cursor: pointer;
            margin-top: 1.5rem;
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

<div class="confirmation-container">
    <div class="card">
        <h1>Booking Confirmed!</h1>
        <p><strong>Booking ID:</strong> ${booking.bookingId}</p>
        <p><strong>Package:</strong> ${booking.packageTitle}</p>
        <p><strong>Total Price:</strong> Rs.${booking.totalPrice}</p>

        <form action="PaymentServlet" method="post">
            <input type="hidden" name="bookingId" value="${booking.bookingId}">
            <input type="submit" value="Proceed to Payment">
        </form>
    </div>
</div>

</body>
</html>
