<%@ page import="cart.CartItem" %>
<%@ page import="java.util.List" %>
<%@ page import="com.packagemanagement.TravelPackage" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Your Cart</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 20px;
            background-color: #f5f5f5;
            color: #333;
        }
        .container {
            max-width: 1000px;
            margin: 0 auto;
            background: white;
            padding: 20px 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        h2 {
            color: #2c3e50;
            border-bottom: 2px solid #3498db;
            padding-bottom: 10px;
            margin-top: 0;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        th {
            background-color: #3498db;
            color: white;
            padding: 12px;
            text-align: left;
        }
        td {
            padding: 10px 12px;
            border-bottom: 1px solid #ddd;
        }
        tr:hover {
            background-color: #f9f9f9;
        }
        .empty-cart {
            color: #7f8c8d;
            font-style: italic;
            padding: 20px;
            text-align: center;
        }
        input[type="submit"] {
            background-color: #e74c3c;
            color: white;
            border: none;
            padding: 6px 12px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #c0392b;
        }
        .grand-total {
            font-weight: bold;
            background-color: #ecf0f1;
        }
        .grand-total td {
            padding: 12px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Your Shopping Cart</h2>

    <%
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {
    %>
    <p class="empty-cart">Your cart is empty.</p>
    <%
    } else {
    %>
    <table>
        <thead>
        <tr>
            <th>Package ID</th>
            <th>Title</th>
            <th>Destination</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Total Price</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <%
            double grandTotal = 0.0;
            for (CartItem item : cart) {
                TravelPackage pkg = item.getTravelPackage();
                double total = item.getTotalPrice();
                grandTotal += total;
        %>
        <tr>
            <td><%= pkg.getPackageId() %></td>
            <td><%= pkg.getTitle() %></td>
            <td><%= pkg.getDestination() %></td>
            <td>Rs. <%= pkg.getPrice() %></td>
            <td><%= item.getQuantity() %></td>
            <td>Rs. <%= total %></td>
            <td>
                <form action="deleteCartItem" method="post">
                    <input type="hidden" name="packageId" value="<%= pkg.getPackageId() %>"/>
                    <input type="submit" value="Remove"/>
                </form>
            </td>
        </tr>
        <%
            }
        %>
        <tr class="grand-total">
            <td colspan="5" align="right"><strong>Grand Total:</strong></td>
            <td colspan="2">Rs. <%= grandTotal %></td>
        </tr>
        </tbody>
    </table>
    <%
        }
    %>
</div>
</body>
</html>