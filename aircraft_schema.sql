CREATE DATABASE IF NOT EXISTS seams_db;
USE seams_db;

DROP TABLE IF EXISTS passengers;

CREATE TABLE passengers (
    passengerID INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Unique identifier for passengers',
    lastName VARCHAR(50) NOT NULL COMMENT 'Family name',
    firstName VARCHAR(50) NOT NULL COMMENT 'Given name',
    contactNumber INT NOT NULL COMMENT 'Mobile number',
    contactEmail VARCHAR(50) NOT NULL COMMENT 'Email address',
    passportNumber INT NOT NULL COMMENT 'Passport number provided by authorities',
    username VARCHAR(50) UNIQUE NOT NULL COMMENT 'Personal non-legal name',
    password VARCHAR(50) NOT NULL COMMENT 'Passenger authentication',
    registrationDate DATE DEFAULT CURRENT_TIMESTAMP COMMENT 'Date when passenger registered into system'
);

INSERT INTO passengers (passengerID, passportNumber, lastName, firstName, contactNumber, username, contactEmail, password) VALUES
(101, 12121212, 'Uy', 'Chester Aldrin', 09112223333, cagu, cagu@gmail.com, ),
(102, 5001, 'RP-C3202', 'Airbus A320', 12, 180),
(103, 5002, 'RP-C3301', 'Airbus A330', 150, 300),
(104, 5003, 'RP-C7771', 'Boeing 777', 200, 350),
(105, 5004, 'RP-C7371', 'Boeing 737', 5, 160),
(106, 5005, 'RP-C3203', 'Airbus A320', 180, 180),
(107, 5006, 'RP-C7871', 'Boeing 787', 50, 250),
(108, 5002, 'RP-C3302', 'Airbus A330', 0, 300),
(109, 5007, 'RP-C3501', 'Airbus A350', 80, 320),
(110, 5008, 'RP-C7372', 'Boeing 737', 160, 160);

DROP TABLE IF EXISTS aircraft;

CREATE TABLE aircraft (
    aircraftID INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Unique identifier for the aircraft',
    passengerID INT NOT NULL COMMENT 'Intended Foreign Key to a Passenger table',
    flightID INT NOT NULL COMMENT 'Intended Foreign Key to a Flight table',
    aircraftRegistration VARCHAR(50) NOT NULL COMMENT 'Tail number or registration (e.g., RP-C3201)',
    aircraftModel VARCHAR(100) NOT NULL COMMENT 'Model of the aircraft (e.g., Airbus A320)',
    seatAvailable INT NOT NULL COMMENT 'Number of seats currently unbooked',
    seatCapacity INT NOT NULL COMMENT 'Total physical seats on the aircraft'
);

INSERT INTO aircraft (passengerID, flightID, aircraftRegistration, aircraftModel, seatAvailable, seatCapacity) VALUES
(101, 5001, 'RP-C3201', 'Airbus A320', 45, 180),
(102, 5001, 'RP-C3202', 'Airbus A320', 12, 180),
(103, 5002, 'RP-C3301', 'Airbus A330', 150, 300),
(104, 5003, 'RP-C7771', 'Boeing 777', 200, 350),
(105, 5004, 'RP-C7371', 'Boeing 737', 5, 160),
(106, 5005, 'RP-C3203', 'Airbus A320', 180, 180),
(107, 5006, 'RP-C7871', 'Boeing 787', 50, 250),
(108, 5002, 'RP-C3302', 'Airbus A330', 0, 300),
(109, 5007, 'RP-C3501', 'Airbus A350', 80, 320),
(110, 5008, 'RP-C7372', 'Boeing 737', 160, 160);
