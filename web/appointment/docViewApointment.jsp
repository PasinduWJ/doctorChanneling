
<%@page import="model.PatientModel"%>
<%@page import="bean.PatientBean"%>
<%@page import="bean.ScheduleBean"%>
<%@page import="model.ScheduleModel"%>
<%@page import="java.util.Iterator"%>
<%@page import="bean.AppointmentBean"%>
<%@page import="model.AppointmentModel"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="../assets/bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet">
        <link href="../cs/hf.css" type="text/css" rel="stylesheet">
        <link href="../cs/fm.css" type="text/css" rel="stylesheet">
        <script src="../assets/bootstrap/js/bootstrap.min.js"></script>
    </head>
    <body style="background-image: url(../images/pat4.jpg);height: 100%;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;">
        <%@ include file="../hf/header.jsp"%>

        <div class="container shadow" style="margin-top: 130px;width: 90%">
            <div class="card" style="background: transparent">

                        <div class=" card-header">
                            <div class="row">
                                <div class="col-1">
                                    <a class="btn btn-danger" href="../schedule/docViewSchedule.jsp" role="button">  << </a>
                                </div>
                                <div class="col-1"></div>
                                <div class="col-10">
                                    <h3 style="color: green;"> Your Appointments </h3>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">

                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th class="text-center" scope="col" style="font-weight: bold; color: crimson;">Date</th>
                                        <th class="text-center" scope="col" style="font-weight: bold; color: crimson;">Time</th>
                                        <th class="text-center" scope="col" style="font-weight: bold; color: crimson;">Patient Name</th>
                                        <th class="text-center" scope="col" style="font-weight: bold; color: crimson;">Mobile</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        System.out.println("////////////////////");
                                        List list = null;

                                        AppointmentBean ap = new AppointmentBean();

                                        int scheduleID = Integer.parseInt(request.getParameter("scheduleID"));

                                        ap.setScheduleID(scheduleID);
                                        list = AppointmentModel.getDocAppointmet(ap);
                                        Iterator it = list.iterator();

                                        while (it.hasNext()) {
                                            AppointmentBean app = (AppointmentBean) it.next();

                                            ScheduleBean sc = new ScheduleBean();
                                            sc.setScheduleID(app.getScheduleID());
                                            ScheduleModel.getSchedule(sc);

                                            PatientBean pat = new PatientBean();
                                            pat.setNIC(app.getNIC());
                                            PatientModel.getPatient(pat);
                                    %>
                                    <tr>
                                        <td class="text-center" style="font-weight: bold; color: #fff;"><%=sc.getDate()%></td>
                                        <td class="text-center" style="font-weight: bold; color: #fff;"><%=sc.getTimeFrom() + " - " + sc.getTimeTo()%></td>
                                        <td class="text-center" style="font-weight: bold; color: #fff;"><%=pat.getFirstName() + " " + pat.getLastName()%></td>
                                        <td class="text-center" style="font-weight: bold; color: #fff;"><%=pat.getPhone()%></td>
                                        <td><form action="../appointment/docDeleteApp.jsp" method="post">
                                                <input type="hidden" name="appID" value=<%= String.valueOf(app.getAppID())%> />
                                                <input type="hidden" name="scheduleID" value= <%=String.valueOf(sc.getScheduleID())%> />
                                                <input type="hidden" name="timeFrom" value=<%=sc.getTimeFrom()%> />
                                                <input type="submit" name="action" class="btn btn-danger" value="Delete">

                                            </form>
                                        </td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>
            

        <div style="margin-top: 170px">
            <%@ include file="../hf/footer.jsp"%>
        </div>
    </body>
</html>
