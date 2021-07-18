
<%@page import="bean.PatientBean"%>
<%@page import="model.PatientModel"%>
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
    <body style="background-image: url(../images/docR2.jpg);height: 100%;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;">
        
        <%
            boolean IsValid = false;

            String NIC = (String)session.getAttribute("NIC");
            String password = (String)session.getAttribute("password");
            
            
                PatientBean pat = new PatientBean();
                pat.setNIC(NIC);
                pat.setPassword(password);
                
                System.out.println(NIC);
            System.out.println(password);
            
            if (!(NIC == "" || NIC == null) && !(password == "" || password == null)) {
   
                IsValid = PatientModel.logPatient(pat);
                System.out.println("///////////////////////..................");
            }   

            if(IsValid){

        %>
        <%@ include file="../hf/headerP.jsp"%>

        <h2>Doctor Profile</h2>
        <br>
        
        <div class="container mt-5"> 
            <a class="btn btn-primary" href="../patient/editPatient.jsp" role="button">Edit Profile</a>
            <a class="btn btn-primary" href="../appointment/viewChannels.jsp" role="button">Schedule</a>  
        </div>
        
        <div style="margin-top: 170px">
            <%@ include file="../hf/footer.jsp"%>
        </div>
        
        <%
            }else {
        %>
        <div class="alert alert-warning alert-dismissible fade show" role="alert" style="margin-top: 70px">
            <strong>Hello..   </strong> Please Try Again! 
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <jsp:forward page="../index.jsp"/>
        <% 
            }
        %>
    
    </body>
</html>