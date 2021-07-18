
<%@page import="bean.ScheduleBean"%>
<%@page import="model.ScheduleModel"%>
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

            System.out.println("......................");
            String id = (String)session.getAttribute("id");
            String date = request.getParameter("date");
            String timeFrom = request.getParameter("timeFrom");
            String timeTo = request.getParameter("timeTo");
            String noPat = request.getParameter("noPatient");
            
            System.out.println(id);
            System.out.println(date);
            
            ScheduleBean sc = new ScheduleBean();
            
            if (!((date.isEmpty() || date.equals(null)) && (timeFrom.isEmpty()|| timeFrom.equals(null)) && (timeTo.isEmpty() || date.equals(null)))) {
                 try {
                    int noPatien = Integer.parseUnsignedInt(noPat);

                    sc.setId(id);
                    sc.setDate(date);
                    sc.setTimeFrom(timeFrom);
                    sc.setTimeTo(timeTo);
                    sc.setNoPatient(noPatien);
                    
                    IsValid = ScheduleModel.addSchedule(sc);
                    
                } catch (Exception e) {

                }
                
            }
            if (IsValid) {
        %>
        <jsp:forward page="docViewSchedule.jsp"/>
        <%} else {
        %>
        <div class="alert alert-warning alert-dismissible fade show" role="alert" style="margin-top: 70px">
            <strong>Hello..   </strong>Something wrong Please Try Again..! 
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <jsp:include page="createSchedule.jsp"/>
        <%
            }
        %>
    </body>
</html>
