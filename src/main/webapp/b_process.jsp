<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, com.dlsu.ccinfom.seams.*" %>

<!DOCTYPE html>
<html>
    <head>
        <title>SeAMS | Booking Process</title>
        <style>
            body { font-family: sans-serif; text-align: center; margin-top: 50px; }
            .btn-blue { background-color: #007bff; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer; text-decoration: none; }
        </style>
    </head>

    <body>
        <jsp:useBean id="b" class="com.dlsu.ccinfom.seams.Booking" scope="session" />

        <%
            try {
                // 1. Fetch data from book_flight.html and convert data types
                b.passengerID = Integer.parseInt(request.getParameter("passengerID"));
                b.flightID = Integer.parseInt(request.getParameter("flightID"));
                b.seatNumber = request.getParameter("seatNumber");
                b.paymentStatus = request.getParameter("paymentStatus");
                b.amountPaid = Double.parseDouble(request.getParameter("amountPaid"));

                // 2. Execute the database insertion
                boolean status = b.createBooking();

                // 3. Display conditional success/fail UI
                if(status) {
        %>
                    <h1>Flight Booked Successfully!</h1>
                    <p>Seat <b><%= b.seatNumber %></b> has been reserved.</p>
        <%
                } else {
        %>
                    <h1>Booking Failed</h1>
                    <p>There was an error processing the booking. Please check the system console logs.</p>
        <%
                }
            } catch (NumberFormatException e) {
        %>
                <h1>Invalid Input</h1>
                <p>Please ensure that IDs and payment amounts are valid numbers.</p>
        <%
            } catch (Exception e) {
        %>
                <h1>Unexpected Error</h1>
                <p><%= e.getMessage() %></p>
        <%
            }
        %>

        <br><br>
        <a href="index.html" class="btn-blue">Return to Menu</a>
    </body>
</html>