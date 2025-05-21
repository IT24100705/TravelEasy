<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Card Payment</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
        }
        .payment-container {
            max-width: 500px;
            margin: 0 auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .card-icons {
            display: flex;
            gap: 10px;
            margin-bottom: 10px;
        }
        .card-icons img {
            height: 30px;
        }
        .submit-btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        .submit-btn:hover {
            background-color: #45a049;
        }
        .error {
            color: red;
            font-size: 14px;
        }
    </style>
</head>
<body>
<div class="payment-container">
    <h2>Card Payment</h2>
    <form action="PaymentServlet" method="post">
        <div class="form-group">
            <label for="cardNumber">Card Number</label>
            <input type="text" id="cardNumber" name="cardNumber" placeholder="1234 5678 9012 3456" required maxlength="19">
        </div>

        <div class="form-group">
            <label for="cardHolder">Card Holder Name</label>
            <input type="text" id="cardHolder" name="cardHolder" placeholder="John Doe" required>
        </div>

        <div class="form-group">
            <label>Expiration Date</label>
            <div style="display: flex; gap: 10px;">
                <input type="number" id="expMonth" name="expMonth" placeholder="MM" min="1" max="12" required style="width: 50%;">
                <input type="number" id="expYear" name="expYear" placeholder="YYYY" min="2023" max="2030" required style="width: 50%;">
            </div>
        </div>

        <div class="form-group">
            <label for="cvv">CVV</label>
            <input type="number" id="cvv" name="cvv" placeholder="123" required min="100" max="999">
        </div>

        <div class="form-group">
            <label for="amount">Amount ($)</label>
            <input type="number" id="amount" name="amount" placeholder="100.00" step="0.01" min="0.01" required>
        </div>

        <button type="submit" class="submit-btn">Submit Payment</button>
    </form>
</div>

<script>
    // Format card number with spaces
    document.getElementById('cardNumber').addEventListener('input', function(e) {
        let value = e.target.value.replace(/\s+/g, '');
        if (value.length > 0) {
            value = value.match(new RegExp('.{1,4}', 'g')).join(' ');
        }
        e.target.value = value;
    });
</script>
</body>
</html>