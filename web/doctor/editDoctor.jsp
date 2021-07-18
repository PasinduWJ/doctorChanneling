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
    <body style="background-image: url(../images/pat4.jpg);height: 100%;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;">
        <%
            boolean IsValid = false;
            DocBean doc = new DocBean();

            String id = (String) session.getAttribute("id");
            String password = (String) session.getAttribute("password");
            
            System.out.println(id);
            System.out.println(password);

            if (!(id == "" || id == null) && !(password == "" || password == null)) {
                doc.setId(id);
                doc.setPassword(id);
                IsValid = true;
                
                DocModel.getDoctor(doc);
                
            }
            if (IsValid) {

        %>

        <%@ include file="../hf/header.jsp"%>

        <div class="container shadow" style="margin-top: 130px; width: 60%">
            <div class="card" style="background: transparent">
                <div class=" card-header">
                    <div class="row">
                        <div class="col-1">
                            <a class="btn btn-danger" href="../doctor/doc.jsp" role="button">  << </a>
                        </div>
                        <div class="col-1"></div>
                        <div class="col-10">
                            <h3 style="color: green;">Edit Your Details </h3>
                        </div>
                    </div>
                </div>

                <div class="card-body">
                    <div class="row justify-content-center">
                        <div class="col-md-10 col-lg-7">
                            <div class="login-wrap p-0">
                                <form  action="../doctor/valEditDoctor.jsp" method="post" class="signin-form">
                                    <div class="form-group">  
                                        <input type="text"   class="form-control" placeholder="Enter Last Name" required
                                               name="firstName" maxlength="20" value= "<%=doc.getFirstName()%>" />
                                    </div>
                                    <div class="form-group">
                                        <input type="text"   class="form-control" placeholder="Enter Last Name" required
                                               name="lastName" maxlength="20" value="<%=doc.getLastName()%>"/>

                                    </div>

                                    <div class="form-group">
                                        <input type="password" id="email_address"  class="form-control" placeholder="Enter password" required
                                               name="password" maxlength="10" value="<%=doc.getPassword()%>"/>
                                    </div>

                                    <div class="form-group">
                                        <input type="password" id="email_address"  class="form-control" placeholder="Confirm password" required
                                               name="con_password" value="" />

                                    </div>

                                    <div class="form-group ">
                                        <input type="text" id="email_address"  class="form-control" placeholder="Enter Mobile No" required
                                               name="phone" maxlength="10" value="<%=doc.getPhone()%>"/> 

                                    </div>

                                    <div class="form-group">
                                        <input type="text"   class="form-control" placeholder="Enter Specialization" required
                                               name="specialization" maxlength="50" value="<%=doc.getSpecialization()%>"  />

                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-sm-5 col-md-8  col-lg-8"></div>
                                        <div class="col-sm-7 col-md-4  col-lg-4">
                                            <input type="submit" class="form-control btn btn-primary submit px-3 bg-primary" name="operation" value="UPDATE">
                                        </div>
                                    </div>

                                </form>
                            </div></div></div></div>
            </div>
        </div>                 

        <div style="margin-top: 120px">
            <%@ include file="../hf/footer.jsp"%>
        </div>

        <%
        } else {

        %>
        <div class="alert alert-warning alert-dismissible fade show" role="alert" style="margin-top: 70px">
            <strong>Hello..   </strong> Please Login..! 
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <%@ include file= "../doctor/docLogin.jsp" %>
        <%            
            }
        %>

    </body>
</html>
