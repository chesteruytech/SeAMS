<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Seats by Flight - SeAMS</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        table { border-collapse: collapse; width: 80%; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
    </style>
</head>
<body>
    <h2>Check Available Seats by Flight</h2>
    <a href="aircraft?action=list">Back to Aircraft List</a>
    <hr>

    <form action="aircraft" method="get">
        <input type="hidden" name="action" value="seatsByFlight" />
        <label>Enter Flight ID:</label>
        <button type="submit">Search</button>
    </form>

    <c:if test="${flightAircrafts != null}">
        <c:choose>
            <c:when test="${empty flightAircrafts}">
                <p>No aircraft found for Flight ID: ${searchedFlightId}</p>
            </c:when>
            <c:otherwise>
                <h3>Results for Flight ID: ${searchedFlightId}</h3>
                <table>
                    <tr>
                        <th>Aircraft Reg</th>
                        <th>Model</th>
                        <th>Available Seats</th>
                        <th>Total Capacity</th>
                    </tr>
                    <c:forEach var="ac" items="${flightAircrafts}">
                        <tr>
                            <td>${ac.aircraftRegistration}</td>
                            <td>${ac.aircraftModel}</td>
                            <td style="color: ${ac.seatAvailable > 0 ? 'green' : 'red'}; font-weight: bold;">
                                ${ac.seatAvailable}
                            </td>
                            <td>${ac.seatCapacity}</td>
                        </tr>
                    </c:forEach>
                </table>
            </c:otherwise>
        </c:choose>
    </c:if>
</body>
</html>
