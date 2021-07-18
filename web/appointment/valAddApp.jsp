
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
            boolean IsValid = false;
            String NIC = (String)session.getAttribute("NIC");
            String scheduleID = request.getParameter("scheduleID");
           String noPatient = (String)request.getParameter("noPatient"); 
           System.out.println(noPatient);
           int limit = Integer.parseInt(noPatient);

            int boock = AppointmentModel.getScheduleCount(Integer.parseInt(scheduleID));
            
            if(limit > boock){
                IsValid = AppointmentModel.addAppointment(NIC, Integer.parseInt(scheduleID));
            }
            
          if (IsValid) {             
//                DocModel.getDoctor(doc);
        %>
        <jsp:forward page="../appointment/patViewAppointment.jsp"/>
        <%
            }else {
        %>
        <div class="alert alert-warning alert-dismissible fade show" role="alert" style="margin-top: 70px">
            <strong>Hii...    </strong>     Limited! 
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <jsp:include page="../appointment/patViewAppointment.jsp"/>
        <%
            }
        %>
    </body>
</html>
