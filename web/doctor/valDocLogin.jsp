
<%@page import="bean.DocBean"%>
<%@page import="model.DocModel"%>

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
            DocBean doc = new DocBean();

            String id = request.getParameter("id");
            String password = request.getParameter("password");

            doc.setId(id);
            doc.setPassword(password);

            if (!(id == "" || id == null) && !(password == "" || password == null)) {
                IsValid = DocModel.logDoctor(doc);
            }

            if (IsValid) {
                session.setAttribute("id", doc.getId());
                session.setAttribute("password", doc.getPassword());
                session.setAttribute("status", true);
                session.setAttribute("home", false);
                
                
                
                response.sendRedirect("../doctor/doc.jsp");

                
                
                

            } else {

        %>
        <div class="alert alert-warning alert-dismissible fade show" role="alert" style="margin-top: 70px">
            <strong>Hello..   </strong> ID or Password Incorrect. Please Try Again! 
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <%@include file="../doctor/docLogin.jsp" %>
        <% 
            }
        %>
    </body>
</html>
