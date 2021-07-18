
<%@page import="model.AppointmentModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
   </head>
    <body>
        <%
            System.out.println(request.getParameter("appID"));
            
            AppointmentModel.deleteAppointment(request.getParameter("appID"));
                
%>
        <%= "Your Appointment Successfully Deleded !" %>
        <br>
        <jsp:include page="../appointment/docViewApointment.jsp">
            <jsp:param name="scheduleID" value="<%=request.getParameter("scheduleID")%>" />
        </jsp:include>
    </body>
</html>
