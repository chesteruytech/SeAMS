<jsp:useBean id="aircraft" scope="session" type="com.dlsu.ccinfom.seams.Aircraft"/>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>View Aircraft - SeAMS</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .detail-row { margin-bottom: 10px; }
        strong { display: inline-block; width: 150px; }
    </style>
</head>
<body>
    <h2>Aircraft Details</h2>
    <a href="aircraft?action=list">Back to List</a>
    <hr>

    <div class="detail-row"><strong>Aircraft ID:</strong> ${aircraft.aircraftID}</div>
    <div class="detail-row"><strong>Registration:</strong> ${aircraft.aircraftRegistration}</div>
    <div class="detail-row"><strong>Model:</strong> ${aircraft.aircraftModel}</div>
    <div class="detail-row"><strong>Flight ID:</strong> ${aircraft.flightID}</div>
    <div class="detail-row"><strong>Passenger ID:</strong> ${aircraft.passengerID}</div>
    <div class="detail-row"><strong>Seats Available:</strong> ${aircraft.seatAvailable}</div>
    <div class="detail-row"><strong>Total Capacity:</strong> ${aircraft.seatCapacity}</div>

    <br>
    <a href="aircraft?action=edit&id=${aircraft.aircraftID}">Edit this Record</a>
</body>
</html>
