<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Payment Success</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
        }
        .success-container {
            max-width: 500px;
            margin: 0 auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            text-align: center;
        }
        .success-icon {
            color: #4CAF50;
            font-size: 50px;
            margin-bottom: 20px;
        }
        .success-message {
            font-size: 18px;
            margin-bottom: 20px;
        }
        .payment-details {
            text-align: left;
            margin: 20px 0;
            padding: 15px;
            background-color: #f9f9f9;
            border-radius: 4px;
        }
        .back-btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            text-decoration: none;
            display: inline-block;
        }
        .back-btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<div class="success-container">
    <div class="success-icon">✓</div>
    <h2>Payment Successful!</h2>
    <div class="success-message">Thank you for your payment.</div>

    <div class="payment-details">
        <p><strong>Amount:</strong> $${amount}</p>
        <p><strong>Card:</strong> **** **** **** ${cardLastFour}</p>
        <p><strong>Date:</strong> <%= new java.util.Date() %></p>
    </div>

    <a href="index.jsp" class="back-btn">Back to Home</a>
</div>
</body>
</html>