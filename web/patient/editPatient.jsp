<%@page import="model.PatientModel"%>
<%@page import="bean.PatientBean"%>
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
            boolean IsValid = false;
            PatientBean pat = new PatientBean();

            String NIC = (String)session.getAttribute("NIC");
            String password = (String) session.getAttribute("password");

            if (!(NIC == "" || NIC == null) && !(password == "" || password == null)) {

                pat.setNIC(NIC);
                pat.setPassword(password);
                IsValid = true;
                
                PatientModel.getPatient(pat);
            }
            if (IsValid) {

        %>

        <%@include file="../hf/headerP.jsp"%>

        <div class="container shadow" style="margin-top: 130px; width: 60%">
            <div class="card" style="background: transparent">

                <div class=" card-header">
                    <div class="row">
                        <div class="col-1">
                            <a class="btn btn-danger" href="../patient/patient.jsp" role="button">  << </a>
                        </div>
                        <div class="col-1"></div>
                        <div class="col-10">
                            <h3 style="color: green;">Edit Your Profile </h3>
                        </div>
                    </div>
                </div>

                <div class="card-body">
                    <div class="row justify-content-center">
                        <div class="col-md-10 col-lg-7">
                            <div class="login-wrap p-0">
                                <form action="../patient/valEditPatient.jsp" method="post">

                                    <div class="form-group row">
                                        <input type="text" maxlength="20"  class="form-control" placeholder="Enter First Name" required=""
                                               name="firstName" value=" <%= pat.getFirstName()%>" />
                                    </div>

                                    <div class="form-group row">
                                        <input type="text" maxlength="20"  class="form-control" placeholder="Enter Last Name"
                                               name="lastName" value= "<%=pat.getLastName()%>"   />
                                    </div>


                                    <div class="form-group row">
                                        <input type="password" maxlength="10" class="form-control" placeholder="Enter password"
                                               name="password" value= "<%= pat.getPassword()%>"   />
                                    </div>

                                    <div class="form-group row">
                                        <input type="password" maxlength="10" class="form-control" placeholder="Confirm password"
                                               name="con_password" value="" />
                                    </div>


                                    <div class="form-group row">
                                        <input type="text" maxlength="10" class="form-control" placeholder="Enter Mobile No"
                                               name="phone" value= "<%=pat.getPhone()%>"   />
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-5 col-md-8  col-lg-8"></div>
                                        <div class="col-sm-7 col-md-4  col-lg-4">
                                            <input type="submit" class="form-control btn btn-primary submit px-3 bg-primary" name="operation" value="UPDATE">
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div style="margin-top: 120px">
            <%@include file="../hf/footer.jsp"%>
        </div>
        <%
            } else {
        %>
        <div class="alert alert-warning alert-dismissible fade show" role="alert" style="margin-top: 70px">
            <strong>Hello..   </strong> Please Login..! 
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <jsp:forward page="../index.jsp"/>
        <% 
            
            }
        %>

    </body>
</html>
