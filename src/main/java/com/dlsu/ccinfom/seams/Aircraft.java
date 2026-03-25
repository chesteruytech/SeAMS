package com.dlsu.ccinfom.seams;

public class Aircraft {
    private int aircraftID;
    private int passengerID;
    private int flightID;
    private String aircraftRegistration;
    private String aircraftModel;
    private int seatAvailable;
    private int seatCapacity;

    public Aircraft() {}

    public Aircraft(int aircraftID, int passengerID, int flightID, String aircraftRegistration,
                    String aircraftModel, int seatAvailable, int seatCapacity) {
        this.aircraftID = aircraftID;
        this.passengerID = passengerID;
        this.flightID = flightID;
        this.aircraftRegistration = aircraftRegistration;
        this.aircraftModel = aircraftModel;
        this.seatAvailable = seatAvailable;
        this.seatCapacity = seatCapacity;
    }

    public Aircraft(int passengerID, int flightID, String aircraftRegistration,
                    String aircraftModel, int seatAvailable, int seatCapacity) {
        this.passengerID = passengerID;
        this.flightID = flightID;
        this.aircraftRegistration = aircraftRegistration;
        this.aircraftModel = aircraftModel;
        this.seatAvailable = seatAvailable;
        this.seatCapacity = seatCapacity;
    }

    public int getAircraftID() { return aircraftID; }
    public void setAircraftID(int aircraftID) { this.aircraftID = aircraftID; }

    public int getPassengerID() { return passengerID; }
    public void setPassengerID(int passengerID) { this.passengerID = passengerID; }

    public int getFlightID() { return flightID; }
    public void setFlightID(int flightID) { this.flightID = flightID; }

    public String getAircraftRegistration() { return aircraftRegistration; }
    public void setAircraftRegistration(String aircraftRegistration) { this.aircraftRegistration = aircraftRegistration; }

    public String getAircraftModel() { return aircraftModel; }
    public void setAircraftModel(String aircraftModel) { this.aircraftModel = aircraftModel; }

    public int getSeatAvailable() { return seatAvailable; }
    public void setSeatAvailable(int seatAvailable) { this.seatAvailable = seatAvailable; }

    public int getSeatCapacity() { return seatCapacity; }
    public void setSeatCapacity(int seatCapacity) { this.seatCapacity = seatCapacity; }

    @Override
    public String toString() {
        return "Aircraft [ID=" + aircraftID + ", Reg=" + aircraftRegistration + ", Model=" + aircraftModel + "]";
    }
}
