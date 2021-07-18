<%@page import="model.DocModel"%>
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
    <body>
        <%
            DocBean doc = new DocBean();
            boolean IsValid = false;

            String id = (String)session.getAttribute("id");
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String phone = request.getParameter("phone");
            String password = request.getParameter("password");
            String con_password = request.getParameter("con_password");
            String specialization = request.getParameter("specialization");
            
            
            if (!(password == "" || password == null) && 
                    password.equals(con_password) &&
                    !(firstName=="" || firstName==null) &&
                    !(phone=="" || phone==null) &&  
                    !(specialization=="" || specialization==null)) {
                
                doc.setId(id);
                doc.setFirstName(firstName);
                doc.setLastName(lastName);
                doc.setPassword(password);
                doc.setPhone(phone);
                doc.setSpecialization(specialization);

                IsValid = DocModel.editDoctor(doc);
            }

            if (IsValid) {
        %>
        <jsp:forward page="../doctor/doc.jsp"/>
        <%} else {
        %>
        <div class="alert alert-warning alert-dismissible fade show" role="alert" style="margin-top: 70px">
            <strong>Hii...    </strong>     Please Try Again! 
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <%@ include file="../index.jsp" %>

        <%
            }
        %>
    </body>
</html>
