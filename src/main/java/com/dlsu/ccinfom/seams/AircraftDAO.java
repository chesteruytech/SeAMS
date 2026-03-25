package com.dlsu.ccinfom.seams;

import com.dlsu.ccinfom.seams.Aircraft;
import com.dlsu.ccinfom.seams.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AircraftDAO {

    public void addAircraft(Aircraft aircraft) {
        String sql = "INSERT INTO aircraft (passengerID, flightID, aircraftRegistration, aircraftModel, seatAvailable, seatCapacity) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, aircraft.getPassengerID());
            pstmt.setInt(2, aircraft.getFlightID());
            pstmt.setString(3, aircraft.getAircraftRegistration());
            pstmt.setString(4, aircraft.getAircraftModel());
            pstmt.setInt(5, aircraft.getSeatAvailable());
            pstmt.setInt(6, aircraft.getSeatCapacity());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateAircraft(Aircraft aircraft) {
        String sql = "UPDATE aircraft SET passengerID=?, flightID=?, aircraftRegistration=?, aircraftModel=?, seatAvailable=?, seatCapacity=? WHERE aircraftID=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, aircraft.getPassengerID());
            pstmt.setInt(2, aircraft.getFlightID());
            pstmt.setString(3, aircraft.getAircraftRegistration());
            pstmt.setString(4, aircraft.getAircraftModel());
            pstmt.setInt(5, aircraft.getSeatAvailable());
            pstmt.setInt(6, aircraft.getSeatCapacity());
            pstmt.setInt(7, aircraft.getAircraftID());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteAircraft(int aircraftID) {
        String sql = "DELETE FROM aircraft WHERE aircraftID=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, aircraftID);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Aircraft getAircraftById(int aircraftID) {
        Aircraft aircraft = null;
        String sql = "SELECT * FROM aircraft WHERE aircraftID=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, aircraftID);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                aircraft = extractAircraftFromResultSet(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return aircraft;
    }

    public List<Aircraft> getAllAircraft() {
        List<Aircraft> list = new ArrayList<>();
        String sql = "SELECT * FROM aircraft";
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                list.add(extractAircraftFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Aircraft> getAircraftByFlightId(int flightID) {
        List<Aircraft> list = new ArrayList<>();
        String sql = "SELECT * FROM aircraft WHERE flightID=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, flightID);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                list.add(extractAircraftFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    private Aircraft extractAircraftFromResultSet(ResultSet rs) throws SQLException {
        return new Aircraft(
            rs.getInt("aircraftID"),
            rs.getInt("passengerID"),
            rs.getInt("flightID"),
            rs.getString("aircraftRegistration"),
            rs.getString("aircraftModel"),
            rs.getInt("seatAvailable"),
            rs.getInt("seatCapacity")
        );
    }
}
