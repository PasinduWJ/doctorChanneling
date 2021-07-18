
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
    <body>
        <%
            boolean IsValid = false;
            PatientBean pat = new PatientBean();
            
            String NIC = request.getParameter("NIC");
            String password = request.getParameter("password");
            
            System.out.println(NIC);
            System.out.println(password);
            
            pat.setNIC(NIC);
            pat.setPassword(password);
            
            if (!(NIC == "" || NIC == null) && !(password == "" || password == null)) {
                
                IsValid = PatientModel.logPatient(pat);
            }
            if (IsValid) {
                session.setAttribute("NIC", pat.getNIC());
                session.setAttribute("password", pat.getPassword());
                session.setAttribute("status", true);
                session.setAttribute("home", false);
                
                response.sendRedirect("../patient/patient.jsp");

            } else {

        %>
        <div class="alert alert-warning alert-dismissible fade show" role="alert" style="margin-top: 70px">
            <strong>Hello..   </strong> ID or Password Incorrect. Please Try Again! 
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <%@include file="../patient/patientLogin.jsp"%>
        <%
            }
        %>
    </body>
</html>
