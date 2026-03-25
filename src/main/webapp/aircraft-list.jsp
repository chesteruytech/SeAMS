<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Aircraft Management - SeAMS</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        table { border-collapse: collapse; width: 100%; margin-top: 10px; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
        .btn { padding: 5px 10px; text-decoration: none; border-radius: 3px; background-color: #007BFF; color: white; }
        .nav { margin-bottom: 20px; }
    </style>
</head>
<body>
    <div class="nav">
        <a href="index.jsp">Home</a> |
        <a href="aircraft?action=seatsByFlight">View Seats by Flight</a>
    </div>

    <h2>Aircraft Inventory</h2>
    <a href="aircraft?action=new" class="btn">Add New Aircraft</a>
    <br><br>

    <table>
        <tr>
            <th>ID</th>
            <th>Registration</th>
            <th>Model</th>
            <th>Flight ID</th>
            <th>Available Seats</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="ac" items="${listAircraft}">
            <tr>
                <td>${ac.aircraftID}</td>
                <td>${ac.aircraftRegistration}</td>
                <td>${ac.aircraftModel}</td>
                <td>${ac.flightID}</td>
                <td>${ac.seatAvailable} / ${ac.seatCapacity}</td>
                <td>
                    <a href="aircraft?action=view&id=${ac.aircraftID}">View</a> |
                    <a href="aircraft?action=edit&id=${ac.aircraftID}">Edit</a> |
                    <a href="aircraft?action=delete&id=${ac.aircraftID}" onclick="return confirm('Are you sure?')">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
