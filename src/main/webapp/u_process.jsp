<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, com.dlsu.ccinfom.seams.*" %>

<!DOCTYPE html>
<html>
    <head>
        <title>SeAMS | Passenger Update</title>
    </head>

    <body>
        <form action="index.html" method="post">
            <jsp:useBean id="p" class="com.dlsu.ccinfom.seams.Passengers" scope="session" />
            <%
                // Passport No.
                p.pPassport = Integer.parseInt(request.getParameter("pPNum"));
                p.pLN = request.getParameter("pLN");
                p.pFN = request.getParameter("pFN");
                p.pNumber = Integer.parseInt(request.getParameter("pC"));
                p.pUsername = request.getParameter("pU");
                p.pEmail = request.getParameter("pE");
                p.pPassword = request.getParameter("pPw");

                boolean status = p.updatePassenger();

                // Backup if Java System.out.println doesn't work
                if(status) {
                    %> <h1>Update Passenger Information Successful</h1> <%
                } else {
                    %> <h1>Update Passenger Information Failed</h1> <%
                }
            %>

            <input type="submit" value="Return to Menu">
        </form>
    </body>
</html>