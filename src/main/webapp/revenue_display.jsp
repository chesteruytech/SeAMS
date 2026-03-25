<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.text.*, java.util.Date" %>

<!DOCTYPE html>
<html>
    <head>
        <title>SeAMS | Revenue Report Results</title>
        <style>
            body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f4f7f6; padding: 40px; color: #333; }
            h1 { color: #0b3d91; text-align: center; }
            .report-container { max-width: 800px; margin: 0 auto; background: white; padding: 30px; border-radius: 12px; box-shadow: 0 4px 15px rgba(0,0,0,0.05); }
            table { width: 100%; border-collapse: collapse; margin-top: 20px; }
            th { background-color: #0b3d91; color: white; padding: 15px; text-align: left; }
            td { padding: 12px 15px; border-bottom: 1px solid #eee; }
            tr:hover { background-color: #f8f9fa; }
            .total-row { font-weight: bold; background-color: #e9ecef; }
            .btn-back { display: inline-block; margin-top: 20px; text-decoration: none; color: white; background-color: #6c757d; padding: 10px 20px; border-radius: 6px; }
        </style>
    </head>
    <body>
        <div class="report-container">
            <%
                // 1. Get the YYYY-MM input and split it
                String monthInput = request.getParameter("reportMonth");
                String[] parts = monthInput.split("-");
                int year = Integer.parseInt(parts[0]);
                int month = Integer.parseInt(parts[1]);

                // Format the month for a nice title (e.g., "April 2026")
                String monthName = new DateFormatSymbols().getMonths()[month - 1];
            %>

            <h1>Revenue Report for <%= monthName %> <%= year %></h1>

            <table>
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Total Tickets Booked</th>
                        <th>Daily Revenue (PHP)</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        double grandTotal = 0;
                        int totalTicketsMonth = 0;

                        try {
                            Connection seamsDB = DriverManager.getConnection("jdbc:mysql://localhost:3306/seamsDB", "root", "root");

                            // The SQL Query with GROUP BY per day
                            String sql = "SELECT DATE(bookingDate) AS reportDate, COUNT(bookingID) AS totalTickets, SUM(amountPaid) AS dailyRevenue " +
                                         "FROM booking " +
                                         "WHERE YEAR(bookingDate) = ? AND MONTH(bookingDate) = ? " +
                                         "GROUP BY DATE(bookingDate) " +
                                         "ORDER BY reportDate ASC";

                            PreparedStatement ps = seamsDB.prepareStatement(sql);
                            ps.setInt(1, year);
                            ps.setInt(2, month);

                            ResultSet rs = ps.executeQuery();
                            boolean hasData = false;

                            while(rs.next()) {
                                hasData = true;
                                String date = rs.getString("reportDate");
                                int tickets = rs.getInt("totalTickets");
                                double revenue = rs.getDouble("dailyRevenue");

                                // Add to running totals
                                totalTicketsMonth += tickets;
                                grandTotal += revenue;
                    %>
                                <tr>
                                    <td><%= date %></td>
                                    <td><%= tickets %></td>
                                    <td>₱<%= String.format("%.2f", revenue) %></td>
                                </tr>
                    <%
                            }

                            if(!hasData) {
                    %>
                                <tr>
                                    <td colspan="3" style="text-align:center;">No bookings found for this month.</td>
                                </tr>
                    <%      } else { %>
                                <tr class="total-row">
                                    <td>MONTHLY TOTAL</td>
                                    <td><%= totalTicketsMonth %></td>
                                    <td>₱<%= String.format("%.2f", grandTotal) %></td>
                                </tr>
                    <%      }

                            rs.close();
                            ps.close();
                            seamsDB.close();
                        } catch (Exception e) {
                            out.println("<tr><td colspan='3'>Error: " + e.getMessage() + "</td></tr>");
                        }
                    %>
                </tbody>
            </table>

            <div style="text-align: center;">
                <a href="index.html" class="btn-back">Return to Dashboard</a>
            </div>
        </div>
    </body>
</html>