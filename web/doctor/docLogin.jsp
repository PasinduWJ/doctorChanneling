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
    <body class="img js-fullheight" style="background-image: url(../images/doc6.jpg);height: 100%;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;">
        <%@ include file="../hf/docLoginheader.jsp"%>
              
        <div class="container shadow" style="margin-top: 130px; width: 60%">
            <div class="card" style="background: transparent">
                <div class=" card-header">
                    <div class="row justify-content-center">
                        <div class="col-md-6 text-center mb-5">
                            <h2 class="heading-section">Doctor Login </h2>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row justify-content-center">
                        <div class="col-md-10 col-lg-7">
                            <div class="login-wrap p-0">
                                <h3 class="mb-4 text-center" style="color:#198754 ;" >Have an account?</h3>
                                
                                <form action="../doctor/valDocLogin.jsp" method="post" class="signin-form">
                                    <div class="form-group">
                                        <input type="text" name="id" class="form-control" placeholder="Login Id" required>
                                    </div>
                                    <div class="form-group">
                                        <input id="password-field" name="password" type="password" class="form-control" placeholder="Password" required>
                                        <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-5 col-md-8  col-lg-8"></div>
                                        <div class="col-sm-7 col-md-4  col-lg-4">
                                            <input type="submit" class="form-control btn btn-primary submit px-3 bg-primary" name="operation" value="LOGIN">
                                        </div>
                                    </div>

                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
 
        <div style="margin-top: 130px">
            <%@ include file="../hf/footer.jsp"%>
        </div>
    </body>
</html>
