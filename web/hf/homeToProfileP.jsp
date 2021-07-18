
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
          <%
            
          session.setAttribute("home", false);
  

        response.sendRedirect("../patient/patient.jsp");
        %>
        
        
    </head>
</html>
