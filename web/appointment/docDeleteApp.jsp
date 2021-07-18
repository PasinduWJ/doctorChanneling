<%-- 
    Document   : docDeleteApp
    Created on : May 29, 2021, 10:56:19 PM
    Author     : PASINDU-PC
--%>

<%@page import="model.AppointmentModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <script src="../js/bootstrap.min.js"></script>
    </head>
    <body>
        <%
            System.out.println(request.getParameter("appID"));

            AppointmentModel.deleteAppointment(request.getParameter("appID"));

        %>
        <div class="alert alert-warning alert-dismissible fade show" role="alert">
            <strong>Hii...    </strong>     Your Appointment Successfully Deleted.. 
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <jsp:include page="../appointment/docViewApointment.jsp"/>
    </body>
</html>
