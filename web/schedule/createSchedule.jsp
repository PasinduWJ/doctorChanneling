
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
    
    <body style="background-image: url(../images/pat4.jpg); height: 100%;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;">

            <%@ include file="../hf/header.jsp"%>

            <div class="container shadow" style="margin-top: 130px; width: 60%">
            <div class="card" style="background: transparent">
                               
                                <div class=" card-header">
                                    <div class="row">
                                        <div class="col-1">
                                            <a class="btn btn-danger" href="../schedule/docViewSchedule.jsp" role="button">  << </a>
                                        </div>
                                        <div class="col-1"></div>
                                        <div class="col-10">
                                            <h3 style="color: green;">Create Your New Schedule </h3>
                                        </div>
                                    </div>
                                </div>

                                <div class="card-body">
                                    <form action="../schedule/valCreateSchedule.jsp" method="post">
                                     <div class="form-group row">
                                            <label for="email_address" 
                                                   class="col-md-4 col-form-label text-md-right " style="font-weight: bold; color: crimson;">Channeling Date<font color="red"></font></label>
                                            <div class="col-md-6">
                                                <input type="date" class="form-control" placeholder="Channeling Date" required
                                                        name="date" />
                                                <font  color="red"></font>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label for="email_address" 
                                                   class="col-md-4 col-form-label text-md-right " style="font-weight: bold; color: crimson;">Channeling Time<font color="red"></font></label>
                                            <div class="col-md-3">
                                                <input type="time"   class="form-control" placeholder="From" required
                                                       name="timeFrom" value="" >
                                                <font  color="red"></font>
                                            </div>
                                            <div class="col-md-3">
                                                <input type="time"   class="form-control" placeholder="To" required
                                                       name="timeTo" value="" >
                                                <font  color="red"></font>
                                            </div>
                                        </div>


                                        <div class="form-group row">
                                            <label for="email_address" 
                                                   class="col-md-4 col-form-label text-md-right" style="font-weight: bold; color: crimson;">No of Patients<font color="red"></font></label>
                                            <div class="col-md-6">
                                                <input type="number" maxlength="3" min="1"  class="form-control" placeholder="Enter No Of Patients" required
                                                       name="noPatient" value="" >
                                                <font  color="red"></font>
                                            </div>
                                        </div>

                                        <br>
                                            <div class="row">
                                                <div class="col-8"></div>
                                                <div class="col-4">
                                                    <input type="submit" class="btn btn-primary" name="operation" value="CREATE NOW"/>
                                                </div>
                                            </div>
                                   
                                    </form>
                                </div>
                            </div>
                        </div>
            
            <div  style="margin-top: 170px">
                <%@ include file="../hf/footer.jsp"%>
            </div>
    </body>
</html>
