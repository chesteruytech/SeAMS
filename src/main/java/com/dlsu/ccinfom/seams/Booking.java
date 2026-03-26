package com.dlsu.ccinfom.seams;

import java.sql.*;
import java.time.*;
import java.time.format.DateTimeFormatter;

public class Booking {
    public int passengerID, flightID;
    public String paymentStatus, seatNumber, bookingDate;
    public double amountPaid;

    public Booking() {}

    public boolean createBooking() {
        try {
            // 1. Connect to SeAMS Database
            Connection seamsDB = DriverManager.getConnection("jdbc:mysql://localhost:3306/seamsDB", "root", "root");

            if(seamsDB.isValid(1)) {
                // Get current date/time for the booking record
                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                LocalDateTime now = LocalDateTime.now();
                bookingDate = dtf.format(now);

                // 2. Prepare the SQL INSERT Statement
                String sql = "INSERT INTO booking (passengerID, flightID, bookingDate, paymentStatus, seatNumber, amountPaid) VALUES (?, ?, ?, ?, ?, ?)";
                PreparedStatement ps = seamsDB.prepareStatement(sql);

                // 3. Set the values and execute
                ps.setInt(1, passengerID);
                ps.setInt(2, flightID);
                ps.setString(3, bookingDate);
                ps.setString(4, paymentStatus);
                ps.setString(5, seatNumber);
                ps.setDouble(6, amountPaid);

                int rowsAffected = ps.executeUpdate();

                ps.close();
                seamsDB.close();

                if (rowsAffected > 0) {
                    System.out.println("Ticket Booked Successfully!");
                    return true;
                }
            }
        } catch (Exception e) {
            System.out.println("Error during booking: " + e.getMessage());
        }
        return false;
    }
}
