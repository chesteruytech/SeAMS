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

DROP TABLE IF EXISTS flight;

CREATE TABLE flight (
    flightID INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Unique identifier for the flight',
    flightNumber VARCHAR(10) NOT NULL COMMENT 'Assigned flight code (e.g., PR112)',
    departureSchedule DATETIME NOT NULL COMMENT 'Scheduled time of departure',
    arrivalSchedule DATETIME NOT NULL COMMENT 'Scheduled time of arrival',
    originAirportCode VARCHAR(5) NOT NULL COMMENT '3-letter IATA code for departure',
    destinationAirportCode VARCHAR(5) NOT NULL COMMENT '3-letter IATA code for arrival'
);

INSERT INTO flight (flightID, flightNumber, departureSchedule, arrivalSchedule, originAirportCode, destinationAirportCode) VALUES
(5001, 'PR112', '2026-04-10 08:00:00', '2026-04-10 09:30:00', 'MNL', 'CEB'),
(5002, 'PR223', '2026-04-11 14:00:00', '2026-04-11 15:15:00', 'MNL', 'DVO'),
(5003, 'PR334', '2026-04-12 10:00:00', '2026-04-12 11:20:00', 'CEB', 'DVO'),
(5004, 'PR445', '2026-04-13 16:30:00', '2026-04-13 17:45:00', 'DVO', 'MNL'),
(5005, 'PR556', '2026-04-14 07:00:00', '2026-04-14 08:10:00', 'MNL', 'ILO'),
(5006, 'PR667', '2026-04-15 13:00:00', '2026-04-15 14:20:00', 'ILO', 'CEB'),
(5007, 'PR778', '2026-04-16 09:15:00', '2026-04-16 10:30:00', 'CEB', 'MNL'),
(5008, 'PR889', '2026-04-17 18:00:00', '2026-04-17 19:15:00', 'MNL', 'PPS');

DROP TABLE IF EXISTS booking;

CREATE TABLE booking (
    passengerID INT NOT NULL COMMENT 'Link to passengers table',
    flightID INT NOT NULL COMMENT 'Link to flight table',

    seatNumber VARCHAR(10) NOT NULL COMMENT 'Assigned seat (e.g., 12A)',
    paymentStatus VARCHAR(45) NOT NULL COMMENT 'Status: Paid or Pending',
    amountPaid DECIMAL(10,2) NOT NULL COMMENT 'Total amount paid for the ticket',
    bookingDate DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Timestamp for revenue reporting',

    PRIMARY KEY (passengerID, flightID),

    FOREIGN KEY (passengerID) REFERENCES passengers(passengerID),
    FOREIGN KEY (flightID) REFERENCES flight(flightID)
);

INSERT INTO booking (passengerID, flightID, seatNumber, paymentStatus, amountPaid, bookingDate) VALUES
(101, 5001, '12A', 'Paid', 5500.00, '2026-04-01 10:30:00'),
(102, 5001, '12B', 'Paid', 5500.00, '2026-04-01 11:15:00'),
(103, 5002, '14C', 'Paid', 4200.50, '2026-04-02 09:00:00'),
(104, 5003, '01A', 'Paid', 8500.00, '2026-04-02 14:20:00'),
(105, 5004, '22F', 'Pending', 3000.00, '2026-04-03 16:45:00');