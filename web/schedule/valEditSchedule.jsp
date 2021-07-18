<%@page import="model.ScheduleModel"%>
<%@page import="bean.ScheduleBean"%>
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

            String id = (String)session.getAttribute("id");
            String timeFrom = request.getParameter("timeFrom");
            String timeTo = request.getParameter("timeTo");
            String noPatient = request.getParameter("noPatient");
            String scheduleID = request.getParameter("scheduleID");
 
            System.out.println(id);
            System.out.println(scheduleID);
            
            
            
            if (!(timeFrom.isEmpty() && timeTo.isEmpty())) {
                 try {
                   ScheduleBean sc = new ScheduleBean();
                    sc.setId(id);
                    sc.setTimeFrom(timeFrom);
                    sc.setTimeTo(timeTo);
                    sc.setNoPatient(Integer.parseUnsignedInt(noPatient));
                    sc.setScheduleID(Integer.parseUnsignedInt(scheduleID));
                    
                    IsValid = ScheduleModel.editSchedule(sc);
                    
                } catch (Exception e) {

                }
                
            }
            if (IsValid) {
        %>
        <jsp:forward page="../schedule/docViewSchedule.jsp"/>
        <%} else {
        %>
        <div class="alert alert-warning alert-dismissible fade show" role="alert">
            <strong>Hii...    </strong>   Something is wrong!  Please Try Again! 
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <jsp:include page="../schedule/docViewSchedule.jsp"/>
        <%
            }
        %>
    </body>
</html>
