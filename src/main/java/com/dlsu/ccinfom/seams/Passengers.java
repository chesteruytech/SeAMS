package com.dlsu.ccinfom.seams;

import java.sql.*;

public class Passengers {
    public int pID, pPassport, pNumber;
    public String pLN, pFN, pUsername, pEmail, pPassword;

    public Passengers() {}

    public boolean registerPassenger(){
        try {
            // 1. Connect to SeAMS Database
            Connection seamsDB;
            seamsDB = DriverManager.getConnection("jdbc:mysql://localhost:3306/seams_db", "root", "root");
            if(seamsDB.isValid(1)) {
                System.out.println("Connection successful");

                // 2. Prepare an SQL Passenger Data to get the next passenger
                PreparedStatement ps = seamsDB.prepareStatement("SELECT MAX(passengerID) + 1 FROM passengers");
                ResultSet rs = ps.executeQuery();
                while(rs.next()) {
                    pID = rs.getInt("pID");
                }

                // 3. Save the new Passenger
                ps = seamsDB.prepareStatement("INSERT INTO passengers (passengerID, passportNumber, lastName, firstName, contactNumber, username, contactEmail, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
                ps.setInt(1, pID);
                ps.setInt(2, pPassport);
                ps.setString(3, pLN);
                ps.setString(4, pFN);
                ps.setInt(5, pNumber);
                ps.setString(6, pUsername);
                ps.setString(7, pEmail);
                ps.setString(8, pPassword);
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

    public boolean updatePassenger(){
        try {
            // 1. Connect to SeAMS Database
            Connection seamsDB;
            seamsDB = DriverManager.getConnection("jdbc:mysql://localhost:3306/seams_db", "root", "root");
            if(seamsDB.isValid(1)) {
                System.out.println("Connection successful");

                // 2. Prepare an SQL Statement to update the passenger data
                PreparedStatement ps = seamsDB.prepareStatement("UPDATE passengers SET passengerID=?, passportNumber=?, lastName=?, firstName=?, contactNumber=?, username=?, contactEmail=?, password=? WHERE passengerID=?");
                ps.setInt(1, pID);
                ps.setInt(2, pPassport);
                ps.setString(3, pLN);
                ps.setString(4, pFN);
                ps.setInt(5, pNumber);
                ps.setString(6, pUsername);
                ps.setString(7, pEmail);
                ps.setString(8, pPassword);
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