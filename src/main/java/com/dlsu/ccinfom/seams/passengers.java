package com.dlsu.ccinfom.seams;

import java.util.*;
import java.sql.*;

public class passengers {
    public int pID, pPassport, pNumber;
    public String pLN, pFN, pUsername, pEmail, pPassword;

    public ArrayList<Integer> pID_list = new ArrayList<>();
    public ArrayList<Integer> pPassport_list = new ArrayList<>();
    public ArrayList<String> pLN_list = new ArrayList<>();
    public ArrayList<String> pFN_list = new ArrayList<>();
    public ArrayList<Integer> pNumber_list = new ArrayList<>();
    public ArrayList<String> pUsername_list = new ArrayList<>();
    public ArrayList<String> pEmail_list = new ArrayList<>();
    public ArrayList<String> pPassword_list = new ArrayList<>();

    public passengers() {

    }

    public void registerPassenger(){
        try {
            // 1. Connect to SeAMS Database
            Connection seamsDB;
            seamsDB = DriverManager.getConnection("jdbc:mysql://localhost:3306/seams_db", "root", "root");
            if(seamsDB.isValid(1)) {
                System.out.println("Connection successful");

                // 2. Prepare an SQL Statement
                PreparedStatement ps = seamsDB.prepareStatement("");
                ResultSet rs = ps.executeQuery();
                while(rs.next()) {
                    pID = rs.getInt("pID");
                }

                // 3. Save the new Passenger
                ps = seamsDB.prepareStatement("");
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
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    static void main() {
        passengers p = new passengers();
        p.pFN = "Chester Aldrin";
        p.registerPassenger();
    }
}