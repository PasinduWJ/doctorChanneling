
<%@page import="model.DocModel"%>
<%@page import="bean.DocBean"%>
<%@page import="model.ScheduleModel"%>
<%@page import="bean.ScheduleBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.AppointmentModel"%>
<%@page import="bean.AppointmentBean"%>
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
    <body style="background-image: url(../images/pap.jpg);height: 100%;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;">
        <%@ include file="../hf/headerP.jsp"%>

        <div class="container shadow" style="margin-top: 130px;">
            <div class="card" style="background: transparent">

                        <div class=" card-header" style="background: #86b7fe">
                            <div class="row">
                                <div class="col-1">
                                    <a class="btn btn-danger" href="../appointment/viewChannels.jsp" role="button">  << </a>
                                </div>
                                <div class="col-1"></div>
                                <div class="col-10">
                                    <h3 style="color: green;">My Appointment </h3>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th class="text-center" style="font-weight: bold; color: blue;" scope="col">Date</th>
                                        <th class="text-center" style="font-weight: bold; color: blue;" scope="col">Time</th>
                                        <th class="text-center" style="font-weight: bold; color: blue;" scope="col">Doctor Name</th>
                                        <th class="text-center " style="font-weight: bold; color: blue;" scope="col">Mobile</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        System.out.println("////////////////////");
                                        List list = null;
                               
                                        list = AppointmentModel.getMyAppointment((String)session.getAttribute("NIC"));
                                        Iterator it = list.iterator();

                                        while (it.hasNext()) {
                                            AppointmentBean app = (AppointmentBean) it.next();

                                            ScheduleBean sc = new ScheduleBean();
                                            sc.setScheduleID(app.getScheduleID());
                                            ScheduleModel.getSchedule(sc);

                                            DocBean doc = new DocBean();
                                            doc.setId(sc.getId());
                                            DocModel.getDoctor(doc);

                                            System.out.println(app.getAppID());
                                    %>
                                    <tr>
                                        <td class="text-center" style="font-weight: bold; color: #fff;"><%=sc.getDate()%></td>
                                        <td class="text-center" style="font-weight: bold; color: #fff;"><%=sc.getTimeFrom() + " - " + sc.getTimeTo()%></td>
                                        <td class="text-center" style="font-weight: bold; color: #fff;"><%=doc.getFirstName() + " " + doc.getLastName()%></td>
                                        <td class="text-center" style="font-weight: bold; color: #fff;"><%=doc.getPhone()%></td>
                                        <td><form action="../appointment/delete.jsp" method="post">
                                                <input type="hidden" name="appID" value="<%=String.valueOf(app.getAppID())%>"/>
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
