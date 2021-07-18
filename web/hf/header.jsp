<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <title>E Channeling</title>
<script type="text/javascript">
function myFunction() {
  alert("You are Successfully Logout..");

}

</script>
    </head>
    <body>
        <%
                                boolean status = false;
                                boolean outProfile = false;
                                boolean home = false;
                                try {
                                    status = (Boolean) session.getAttribute("status");
                                }catch(Exception e){}
                                try{
                                    home = (Boolean)session.getAttribute("home");
                                }catch(Exception e){}
                                try{
                                    outProfile = (Boolean)session.getAttribute("outProfile");
                                }   
                                 catch (Exception e) {
                                }
                              %>
                              

        <header id="header" class="fixed-top">
            <div class="container d-flex align-items-center">
                <h1 class="logo me-auto"><a href="index.jsp"><span>Med</span>Win Hospital</a></h1>
                <nav id="navbar" class="navbar order-last order-lg-0">
                    <ul>
                       
                        <% if(status && !home ) { %>
                        <li><a href="../hf/proToHome.jsp" class="active">Home</a></li>
                          
                        <%  }if((status && home) || !(status)){ %>
                        <li><a href="index.jsp" class="active">Home</a></li>
                        <% } %>

                         <%                          
                        if( home){ %>
                         <li><a  href="hf/homeToProfile.jsp" name="profile" onclick="profile()" class="active">Profile</a></li>
                        <% } %>
                        
                         
                         <% if(status) {
                              if(home){ %>
                                <li class="dropdown"><a onclick="myFunction()" href="logout.jsp"><span>Log Out</span> <i class="bi bi-chevron-down"></i></a>

                        <%   }else{  %>
                                <li class="dropdown"><a onclick="myFunction()" href="../logout.jsp"><span>Log Out</span> <i class="bi bi-chevron-down"></i></a>
                             <%  }  
                          }else{ %>
                        <li class="dropdown"><a href="#"><span>Login</span> <i class="bi bi-chevron-down"></i></a>
                            <ul>
                                <li><a href="doctor/docLogin.jsp">Doctor</a></li>
                                <li><a href="patient/patientLogin.jsp">Patient</a></li>
                            </ul>
                        </li>                           
                            
                            <%  }  %>
                        
                           
                        <li><a href="">About</a></li>
 
                        <li><a href="">Contact</a></li>

                    </ul>
                    <i class="bi bi-list mobile-nav-toggle"></i>
                </nav>

                <div class="header-social-links d-flex">

                </div>

            </div>
        </header><!-- End Header -->

    </body>
</html>
