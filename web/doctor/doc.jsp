
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
    <body style=" background-image: url(../images/doc6.jpg);height: 100%;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;">
        
        
        <%
            boolean IsValid = false;
            DocBean doc = new DocBean();

            String id = (String)session.getAttribute("id");
            String password = (String)session.getAttribute("password");
            
            if ( !( id=="" || id == null) && !(password=="" || password==null) ){

                doc.setId(id);
                doc.setPassword(password);
System.out.println(password);
                IsValid = DocModel.logDoctor(doc);
            }
            if (IsValid) {

        %>
        <%@ include file="../hf/header.jsp"%>
        <div >
        <h2>Doctor Profile</h2>
        <br>
        
        <div class="container mt-5"> 
            <a class="btn btn-primary" href="../doctor/editDoctor.jsp" role="button">Edit Profile</a>
            <a class="btn btn-primary" href="../schedule/docViewSchedule.jsp" role="button">Schedule</a>  
        </div>
        
        <div style="margin-top: 170px">
            <%@ include file="../hf/footer.jsp"%>
        </div>
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
