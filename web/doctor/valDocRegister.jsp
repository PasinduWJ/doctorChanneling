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
            boolean IsValid = false;
            
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String password = request.getParameter("password");
            String con_password = request.getParameter("con_password");
            String phone = request.getParameter("phone");
            String id = request.getParameter("id");
            String specialization = request.getParameter("specialization");

            DocBean doc = new DocBean();

            doc.setFirstName(firstName);
            doc.setLastName(lastName);
            doc.setPassword(password);
            doc.setPhone(phone);
            doc.setId(id);
            doc.setSpecialization(specialization);

            if(!(password=="" || password==null) && 
                    (password.equals(con_password)) &&
                    !(id=="" || id == null)&&
                    !(firstName == "" || firstName == null) &&
                    !(phone == "" || phone == null) &&
                    !(specialization == "" || specialization == null)){
                
                IsValid =  DocModel.addDoctor(doc);
            }
           

            if (IsValid) {
                response.sendRedirect("../doctor/docLogin.jsp");
        
            }else {
        %>
       <div class="alert alert-warning alert-dismissible fade show" role="alert" style="margin-top: 70px">
            <strong>Hello..   </strong> Something is wrong! Please Try Again! 
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <jsp:include page="../doctor/docRegister.jsp"/>

        <%
            }
        %>
    </body>
</html>
