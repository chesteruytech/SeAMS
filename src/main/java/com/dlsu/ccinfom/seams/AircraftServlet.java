package com.dlsu.ccinfom.seams;

import com.dlsu.ccinfom.seams.AircraftDAO;
import com.dlsu.ccinfom.seams.Aircraft;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/aircraft")
public class AircraftServlet extends HttpServlet {
    private AircraftDAO aircraftDAO;

    @Override
    public void init() {
        aircraftDAO = new AircraftDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "new": showNewForm(request, response); break;
            case "edit": showEditForm(request, response); break;
            case "delete": deleteAircraft(request, response); break;
            case "view": viewAircraft(request, response); break;
            case "seatsByFlight": showSeatsByFlight(request, response); break;
            case "list":
            default: listAircraft(request, response); break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("insert".equals(action)) {
            insertAircraft(request, response);
        } else if ("update".equals(action)) {
            updateAircraft(request, response);
        } else {
            doGet(request, response);
        }
    }

    private void listAircraft(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Aircraft> listAircraft = aircraftDAO.getAllAircraft();
        request.setAttribute("listAircraft", listAircraft);
        request.getRequestDispatcher("/aircraft-list.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/aircraft-form.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Aircraft existingAircraft = aircraftDAO.getAircraftById(id);
        request.setAttribute("aircraft", existingAircraft);
        request.getRequestDispatcher("/aircraft-form.jsp").forward(request, response);
    }

    private void insertAircraft(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int passengerID = Integer.parseInt(request.getParameter("passengerID"));
        int flightID = Integer.parseInt(request.getParameter("flightID"));
        String registration = request.getParameter("aircraftRegistration");
        String model = request.getParameter("aircraftModel");
        int available = Integer.parseInt(request.getParameter("seatAvailable"));
        int capacity = Integer.parseInt(request.getParameter("seatCapacity"));

        Aircraft newAircraft = new Aircraft(passengerID, flightID, registration, model, available, capacity);
        aircraftDAO.addAircraft(newAircraft);
        response.sendRedirect("aircraft?action=list");
    }

    private void updateAircraft(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int id = Integer.parseInt(request.getParameter("aircraftID"));
        int passengerID = Integer.parseInt(request.getParameter("passengerID"));
        int flightID = Integer.parseInt(request.getParameter("flightID"));
        String registration = request.getParameter("aircraftRegistration");
        String model = request.getParameter("aircraftModel");
        int available = Integer.parseInt(request.getParameter("seatAvailable"));
        int capacity = Integer.parseInt(request.getParameter("seatCapacity"));

        Aircraft aircraft = new Aircraft(id, passengerID, flightID, registration, model, available, capacity);
        aircraftDAO.updateAircraft(aircraft);
        response.sendRedirect("aircraft?action=list");
    }

    private void deleteAircraft(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        aircraftDAO.deleteAircraft(id);
        response.sendRedirect("aircraft?action=list");
    }

    private void viewAircraft(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Aircraft aircraft = aircraftDAO.getAircraftById(id);
        request.setAttribute("aircraft", aircraft);
        request.getRequestDispatcher("/aircraft-view.jsp").forward(request, response);
    }

    private void showSeatsByFlight(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String flightIdStr = request.getParameter("flightID");
        if (flightIdStr != null && !flightIdStr.isEmpty()) {
            int flightID = Integer.parseInt(flightIdStr);
            List<Aircraft> flightAircrafts = aircraftDAO.getAircraftByFlightId(flightID);
            request.setAttribute("flightAircrafts", flightAircrafts);
            request.setAttribute("searchedFlightId", flightID);
        }
        request.getRequestDispatcher("/aircraft-seats-by-flight.jsp").forward(request, response);
    }
}