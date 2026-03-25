package com.dlsu.ccinfom.seams;

import java.sql.*;

public class Flight {
    public int flightID;
    public String flightNumber, departureSchedule, arrivalSchedule, originAirportCode, destinationAirportCode;

    public Flight() {}

    public boolean addFlight() {
        try {
            // 1. Connect to SeAMS Database
            Connection seamsDB = DriverManager.getConnection("jdbc:mysql://localhost:3306/seamsDB", "root", "root");

            if(seamsDB.isValid(1)) {
                // 2. Format HTML datetime-local strings for MySQL compatibility
                String formattedDep = departureSchedule.replace("T", " ") + ":00";
                String formattedArr = arrivalSchedule.replace("T", " ") + ":00";

                // 3. Prepare the SQL INSERT Statement
                String sql = "INSERT INTO flight (flightNumber, departureSchedule, arrivalSchedule, originAirportCode, destinationAirportCode) VALUES (?, ?, ?, ?, ?)";
                PreparedStatement ps = seamsDB.prepareStatement(sql);

                // 4. Set the values and execute
                ps.setString(1, flightNumber);
                ps.setString(2, formattedDep);
                ps.setString(3, formattedArr);
                ps.setString(4, originAirportCode);
                ps.setString(5, destinationAirportCode);

                int rowsAffected = ps.executeUpdate();

                ps.close();
                seamsDB.close();

                if (rowsAffected > 0) {
                    System.out.println("Flight added successfully!");
                    return true;
                }
            }
        } catch (Exception e) {
            System.out.println("Error adding flight: " + e.getMessage());
        }
        return false;
    }
}