<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, com.dlsu.ccinfom.seams.*" %>

<!DOCTYPE html>
<html>
    <head>
        <title>SeAMS | Flight Processing</title>
        <style>
            body { font-family: sans-serif; text-align: center; margin-top: 50px; }
            .btn-blue { background-color: #007bff; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer; text-decoration: none; }
        </style>
    </head>

    <body>
        <jsp:useBean id="f" class="com.dlsu.ccinfom.seams.Flight" scope="session" />

        <%
            try {
                // Fetch data from register_flight.html
                f.flightNumber = request.getParameter("flightNumber");
                f.originAirportCode = request.getParameter("originAirportCode");
                f.destinationAirportCode = request.getParameter("destinationAirportCode");
                f.departureSchedule = request.getParameter("departureSchedule");
                f.arrivalSchedule = request.getParameter("arrivalSchedule");

                // Execute the database insertion
                boolean status = f.addFlight();

                if(status) {
        %>
                    <h1>Flight Registered Successfully!</h1>
                    <p>Flight <b><%= f.flightNumber %></b> from <%= f.originAirportCode %> to <%= f.destinationAirportCode %> has been added to the system.</p>
        <%
                } else {
        %>
                    <h1>Registration Failed</h1>
                    <p>There was an error saving the flight schedule. Please check the console logs.</p>
        <%
                }
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