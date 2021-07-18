
<%@page import="model.ScheduleModel"%>
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

        <%
            String action = request.getParameter("action");

            if (action.equals("Edit")) {
        %> 
        <%@ include file="../hf/header.jsp"%>
        
        
        <div class="container shadow" style="margin-top: 130px; width: 60%">
            <div class="card" style="background: transparent">

                                <div class=" card-header" style="background: #86b7fe">
                                    <div class="row">
                                        <div class="col-1">
                                            <a class="btn btn-danger" href="../schedule/docViewSchedule.jsp" role="button">  << </a>
                                        </div>
                                        <div class="col-1"></div>
                                        <div class="col-10">
                                            <h3 style="color: green;"> Edit Your Schedule </h3>
                                        </div>
                                    </div>
                                </div>

                                <div class="card-body">
                                    <form action="../schedule/valEditSchedule.jsp" method="post" class="signin-form">

                                        <input type="hidden" name="scheduleID" value=<%=request.getParameter("scheduleID")%> />

                                        <div class="form-group row">
                                           <div class="col-md-5 col-sm-4">
                                                <input type="text"   class="form-control" placeholder="From" required=""
                                                       name="timeFrom" value=<%=request.getParameter("timeFrom")%> />
                                                <font  color="red"></font>
                                            </div>
                                                <div class="col-md-2 col-sm-4">
                                                    <label class="col-md-4 col-form-label text-md-center" style="font-size: larger">To<font color="red"></font></label>
                                                </div>
                                            <div class="col-md-5 col-sm-4">
                                                <input type="text"   class="form-control" placeholder="To" required=""
                                                       name="timeTo" value=<%=request.getParameter("timeTo")%> />
                                                
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="email_address" 
                                                   class="col-md-4 col-form-label text-md-right" style="font-weight: bold; color: crimson;" >No of Patients<font color="red"></font></label>
                                            <div class="col-md-6">
                                                <input type="text"   class="form-control" placeholder="Enter No Of Patients" required=""
                                                       name="noPatient"  value= <%=request.getParameter("noPatient")%> />
                                                <font  color="red"></font>
                                            </div>
                                        </div>
                                                <br>
                                        <div class="row">
                                            <div class="col-8"></div>
                                            <div class="col-4">
                                                <input type="submit" class="btn btn-primary" name="operation" value="UPDATE NOW"/>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
               
        <div style="margin-top: 170px">
            <%@ include file="../hf/footer.jsp"%>
        </div>
        <%
        } else if (action.equals("View")) {

        %>
        <jsp:forward page="../appointment/docViewApointment.jsp">
            <jsp:param name="scheduleID" value = "<%= request.getParameter("scheduleID")%>" />
        </jsp:forward>>
        <%
        } else {

            boolean IsValid = false;

            String scheduleID = request.getParameter("scheduleID");

            IsValid = ScheduleModel.deleteSchedule(scheduleID);

            if (IsValid) {
        %>
        <jsp:forward page="../schedule/docViewSchedule.jsp"/>
        <%
                }
            }
        %>
    </body>
</html>
