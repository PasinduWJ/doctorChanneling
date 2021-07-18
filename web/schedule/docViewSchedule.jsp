
<%@page import="model.DocModel"%>
<%@page import="bean.ScheduleBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="model.ScheduleModel"%>
<%@page import="bean.DocBean"%>
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
            boolean IsValid = true;
//            DocBean doc = new DocBean();
//
//            String id = (String) session.getAttribute("id");
//            String password = (String) session.getAttribute("password");
//
//            if (!(id == "" || id == null) && !(password == "" || password == null)) {
//
//                doc.setId(id);
//                doc.setPassword(id);
//
//                IsValid = DocModel.logDoctor(doc);
//            }
            if (IsValid) {

        %>
        <%@ include file="../hf/header.jsp"%>

        <div class="container shadow" style="margin-top: 130px;">
            <div class="card" style="background: transparent">
                    
                <div class=" card-header" style="background: #86b7fe">
                    <div class="row" >
                                <div class="col-1">
                                    <a class="btn btn-danger" href="../doctor/doc.jsp" role="button">  << </a>
                                </div>
                                <div class="col-5">
                                    <h3 style="color: green;">My Schedules </h3>
                                </div>
                                <div class="col-6">
                                    <a class="btn btn-primary" href="../schedule/createSchedule.jsp" role="button"> Create New Schedule </a>
                                </div>
                            </div>
                        </div>

                        <div class="card-body">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th class="text-center" scope="col">Date</th>
                                        <th class="text-center" scope="col">Time</th>
                                        <th class="text-center" scope="col">No of Patients</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%                
                                        System.out.println("////////////////////");
                                        List list = null;

                                        list = ScheduleModel.getAllScheduleD((String)session.getAttribute("id"));
                                        Iterator it = list.iterator();

                                        while (it.hasNext()) {
                                            ScheduleBean sc = (ScheduleBean) it.next();
//                                                                    System.out.println(sc.getScheduleID());
                                    %>
                                    <tr>
                                        <td class="text-center"><%=sc.getDate()%></td>
                                        <td class="text-center"><%=sc.getTimeFrom() + " - " + sc.getTimeTo()%></td>
                                        <td class="text-center"><%=sc.getNoPatient()%></td>
                                        <td><form action="../schedule/ed.jsp" method="post">
                                                <input type="hidden" name="scheduleID" value= <%=String.valueOf(sc.getScheduleID())%> />
                                                <input type="hidden" name="timeFrom" value= <%=sc.getTimeFrom()%> />
                                                <input type="hidden" name="timeTo" value= <%=sc.getTimeTo()%> />
                                                <input type="hidden" name="noPatient" value= <%=String.valueOf(sc.getNoPatient())%> />
                                                <input type="submit" name="action" class="btn btn-secondary" value="Edit" />
                                                <input type="submit" name="action" class="btn btn-danger" value="Delete" />
                                                <input type="submit" name="action" class="btn btn-success" value="View" />
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

        <%
            }else {
            
        %>
        <div class="alert alert-warning alert-dismissible fade show" role="alert" style="margin-top: 70px">
            <strong>Hello..   </strong> Please Login..! 
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <%@ include file= "../doctor/docLogin.jsp" %>
        <%            
            }
        %>

    </body>
</html>
