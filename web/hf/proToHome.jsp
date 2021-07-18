
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        
        <%
            boolean home = false;
            try{
               home = (Boolean)session.getAttribute("home");
               if(!home){
                   session.setAttribute("home", true);
               }
             }catch(Exception e){}
            
        response.sendRedirect("../index.jsp");
        %>
        
        
        
        
        
        
    </head>

</html>
