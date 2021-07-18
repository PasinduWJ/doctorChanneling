<%@page import="model.PatientModel"%>
<%@page import="bean.PatientBean"%>
<%@page import="model.DocModel"%>
<%@page import="bean.DocBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.AppointmentModel"%>
<%@page import="bean.ScheduleBean"%>
<%@page import="bean.AppointmentBean"%>
<%@page import="model.ScheduleModel"%>
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
    <body style="background-image: url(../images/4.jpg);height: 100%;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;">
        <%
            boolean IsValid = false;
            PatientBean pat = new PatientBean();

            String NIC = (String) session.getAttribute("NIC");
            String password = (String) session.getAttribute("password");

            if (!(NIC == "" || NIC == null) && !(password == "" || password == null)) {

                pat.setNIC(NIC);
                pat.setPassword(password);

                IsValid = PatientModel.logPatient(pat);
            }
            if (IsValid) {

        %>
        <%@ include file="../hf/headerP.jsp"%>

        <div class="container shadow" style="margin-top: 130px;">
            <div class="card" style="background: transparent">
                    
                <div class=" card-header" style="background: #86b7fe">
                            <div class="row">
                                <div class="col-1">
                                    <a class="btn btn-danger" href="../patient/patient.jsp" role="button">  << </a>
                                </div>
                                <div class="col-1"></div>
                                <div class="col-5">
                                    <h3 style="color: green;"> Channeling List </h3>
                                </div>
                                <div class="col-5">
                                    <a class="btn btn-primary" href="../appointment/patViewAppointment.jsp" role="button"> My Appointment </a>
                                </div>
                            </div>
                        </div>

                        <div class="card-body">

                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th class="text-center" scope="col">Doctor Name</th>
                                        <th class="text-center" scope="col">Specialization</th>
                                        <th class="text-center" scope="col">Mobile No</th>
                                        <th class="text-center" scope="col">Channeling Date</th>
                                        <th class="text-center" scope="col">Channeling Time</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <%                
                                        System.out.println("////////////////////");
                                        List list = null;

                                        list = AppointmentModel.getAllSchedule();
                                        Iterator it = list.iterator();

                        //                AppointmentBean app = new AppointmentBean();
                        //                app.setNIC(request.getParameter("NIC"));
                                        while (it.hasNext()) {
                                            ScheduleBean sc = (ScheduleBean) it.next();

                                            DocBean doc = new DocBean();
                                            doc.setId(sc.getId());
                                            DocModel.getDoctor(doc);
                        //                    app.setScheduleID(sc.getScheduleID());
                        //                        System.out.println(sc.getScheduleID());
%>
                                    <tr>
                                        <td class="text-center"><%=doc.getFirstName() + " " + doc.getLastName()%></td>
                                        <td class="text-center"><%=doc.getSpecialization()%></td>
                                        <td class="text-center"><%=doc.getPhone()%></td>
                                        <td class="text-center"><%=sc.getDate()%></td>
                                        <td class="text-center"><%=sc.getTimeFrom() + " - " + sc.getTimeTo()%></td>
                                        <td><form action="../appointment/valAddApp.jsp" method="post">
                                                <input type="hidden" name="scheduleID" value= <%=sc.getScheduleID()%> />
                                                <input type="hidden" name="timeFrom" value= <%=sc.getTimeFrom()%> />
                                                <input type="hidden" name="timeTo" value= <%=sc.getTimeTo()%> />
                                                <input type="hidden" name="noPatient" value= <%=sc.getNoPatient()%> />

                                                <input type="submit" name="action" class="btn btn-success" value="Add">
                                            </form>
                                        </td>
                                    </tr>
                                    <% }%>
                                </tbody> 
                            </table>
                        </div>
                    </div>
                </div>
       
        <div style="margin-top: 170px">
            <%@ include file="../hf/footer.jsp"%>
        </div>
        <%
            } else {
                response.sendRedirect("../patient/patient.jsp");
            }
        %>
    </body>
</html>
