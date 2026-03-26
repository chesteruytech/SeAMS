<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Aircraft Form - SeAMS</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .form-group { margin-bottom: 15px; }
        label { display: inline-block; width: 150px; }
        input[type="text"], input[type="number"] { width: 200px; padding: 5px; }
    </style>
</head>
<body>
    <h2>${aircraft != null ? 'Edit Aircraft' : 'Add New Aircraft'}</h2>
    <a href="aircraft?action=list">Back to List</a>
    <hr>

    <form action="aircraft" method="post">
        <input type="hidden" name="action" value="${aircraft != null ? 'update' : 'insert'}" />
        <c:if test="${aircraft != null}">
            <input type="hidden" name="aircraftID" value="${aircraft.aircraftID}" />
        </c:if>

        <div class="form-group">
            <label>Registration:</label>
            <input type="text" name="aircraftRegistration" value="${aircraft.aircraftRegistration}" required />
        </div>
        <div class="form-group">
            <label>Model:</label>
            <input type="text" name="aircraftModel" value="${aircraft.aircraftModel}" required />
        </div>
        <div class="form-group">
            <label>Passenger ID:</label>
            <input type="number" name="passengerID" value="${aircraft.passengerID}" required />
        </div>
        <div class="form-group">
            <label>Flight ID:</label>
            <input type="number" name="flightID" value="${aircraft.flightID}" required />
        </div>
        <div class="form-group">
            <label>Seat Capacity:</label>
            <input type="number" name="seatCapacity" value="${aircraft.seatCapacity}" required />
        </div>
        <div class="form-group">
            <label>Seats Available:</label>
            <input type="number" name="seatAvailable" value="${aircraft.seatAvailable}" required />
        </div>

        <button type="submit">Save Aircraft</button>
    </form>
</body>
</html>
