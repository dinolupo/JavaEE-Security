<%-- 
    Document   : logout
    Created on : Aug 28, 2016, 11:21:29 AM
    Author     : Dino Lupo <https://dinolupo.github.io>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ page session="true"%>

        User '<%=request.getRemoteUser()%>' has been logged out.

        <% 
            //session.invalidate();
            request.logout();
        %>

        <br/><br/>
<!--        <a href="backoffice/test">Click here to go to test servlet</a>-->
        <a href="index.xhtml">Click here to go to the home page</a>
    </body>
</html>
