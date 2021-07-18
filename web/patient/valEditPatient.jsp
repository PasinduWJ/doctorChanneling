
<%@page import="model.PatientModel"%>
<%@page import="bean.PatientBean"%>
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
            PatientBean pat = new PatientBean();
            boolean IsValid = false;

            String NIC = (String)session.getAttribute("NIC");
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String phone = request.getParameter("phone");
            String password = request.getParameter("password");
            String con_password = request.getParameter("con_password");

            if (!(password == "" || password == null) && 
                    password.equals(con_password) &&
                    !(firstName=="" || firstName==null) &&
                    !(phone=="" || phone==null)) {
             
                pat.setNIC(NIC);
                pat.setFirstName(firstName);
                pat.setLastName(lastName);
                pat.setPassword(password);
                pat.setPhone(phone);

                IsValid = PatientModel.editPatient(pat);
            }

            if (IsValid) {
        %>
        <jsp:forward page="../patient/patient.jsp"/>
        <%} else {
        %>
        <div class="alert alert-warning alert-dismissible fade show" role="alert" style="margin-top: 70px">
            <strong>Hii...    </strong>     Please Try Again! 
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <jsp:include page="editPatient.jsp"/>
        <%
            }
        %>
    </body>
</html>
