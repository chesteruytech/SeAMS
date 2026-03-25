package com.dlsu.ccinfom.seams;

import java.sql.*;

public class PassengersDAO {
    public boolean registerPassenger(Passengers passengers){
        try {
            // 1. Connect to SeAMS Database
            Connection seamsDB;
            seamsDB = DriverManager.getConnection("jdbc:mysql://localhost:3306/seamsDB", "root", "root");
            if(seamsDB.isValid(1)) {
                System.out.println("Connection successful");

                // 2. Prepare an SQL Passenger Data to get the next passenger
                PreparedStatement ps = seamsDB.prepareStatement("SELECT MAX(passengerID) + 1 FROM passengers");
                ResultSet rs = ps.executeQuery();
                while(rs.next()) {
                    passengers.pID = rs.getInt("pID");
                }

                // 3. Save the new Passenger
                ps = seamsDB.prepareStatement("INSERT INTO passengers (passengerID, passportNumber, lastName, firstName, contactNumber, username, contactEmail, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
                ps.setInt(1, passengers.pID);
                ps.setInt(2, passengers.pPassport);
                ps.setString(3, passengers.pLN);
                ps.setString(4, passengers.pFN);
                ps.setInt(5, passengers.pNumber);
                ps.setString(6, passengers.pUsername);
                ps.setString(7, passengers.pEmail);
                ps.setString(8, passengers.pPassword);
                ps.executeUpdate();

                ps.close();
                seamsDB.close();

                System.out.println("Passenger Registered successfully");
                return true;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    public boolean updatePassenger(Passengers passengers){
        try {
            // 1. Connect to SeAMS Database
            Connection seamsDB;
            seamsDB = DriverManager.getConnection("jdbc:mysql://localhost:3306/seamsDB", "root", "root");
            if(seamsDB.isValid(1)) {
                System.out.println("Connection successful");

                // 2. Prepare an SQL Statement to update the passenger data
                PreparedStatement ps = seamsDB.prepareStatement("UPDATE aircraft SET passengerID=?, passportNumber=?, lastName=?, firstName=?, contactNumber=?, username=?, contactEmail=?, password=? WHERE passengerID=?");
                ps.setInt(1, passengers.pID);
                ps.setInt(2, passengers.pPassport);
                ps.setString(3, passengers.pLN);
                ps.setString(4, passengers.pFN);
                ps.setInt(5, passengers.pNumber);
                ps.setString(6, passengers.pUsername);
                ps.setString(7, passengers.pEmail);
                ps.setString(8, passengers.pPassword);
                ps.executeUpdate();
                ps.executeUpdate();

                ps.close();
                seamsDB.close();

                System.out.println("Passenger Updated successfully");
                return true;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return false;
    }
}
