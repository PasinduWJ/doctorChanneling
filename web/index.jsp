
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E Channeling</title>
        <link href="assets/bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet">
        <link href="cs/hf.css" type="text/css" rel="stylesheet">
        <link href="cs/fm.css" type="text/css" rel="stylesheet">
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="cs/main.js"></script>

    </head>
    <body>
        <div>
            <%
                boolean b = false;

                try {
                    String d = (String) session.getAttribute("id");
                    if (!(d == "" || d == null)) {
                        b = true;
                    }

                } catch (Exception e) {
                }

                if (b) {
            %>

            <%@ include file="hf/header.jsp"%>


            <%
            } else {
            %>

            <%@ include file="hf/headerP.jsp"%>

            <%
                }
            %>
        </div>
        
    <section id="hero">
    <div id="heroCarousel" data-bs-interval="5000" class="carousel slide carousel-fade" data-bs-ride="carousel">

      <div class="carousel-inner" role="listbox">

        <div class="carousel-item active" style=" background-image: url(images/doc6.jpg);height: 100%;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;">
          <div class="carousel-container">
            <div class="carousel-content animate__animated animate__fadeInUp">
              <h2>Welcome to <span>MedWin Hospital</span></h2>
              <p>
                                   You and your loved ones are safe in our internationally accredited care. 
                                                Our scope of healthcare services revolves around patient safety and we offer you highly specialized medical care including tertiary and super specialty care at our state-of-the-art facilities.
                                                At our hospitals in Mathara and Galle, you can rest easy while our practiced and qualified medical staff works around the clock to ensure a superior patient experience.
            </p>
              <div class="text-center"><a href="" class="btn-get-started">Read More</a></div>
            </div>
          </div>
        </div>
  </section>

        <div class="alert alert-warning alert-dismissible fade show" role="alert">
            <strong>Holy guacamole!</strong> You should check in on some of those fields below.
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>

        <div>
            <%@ include file="hf/footer.jsp"%>
        </div>

    </body>

</html>
