<%-- 
    Document   : general-error
    Created on : Aug 28, 2016, 12:12:23 PM
    Author     : Dino Lupo <https://dinolupo.github.io>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Not Authorized</title>
    </head>
    <body>

        <h1>Dear User '<%=request.getRemoteUser()%>', you are not authorized to see the content that you have selected.</h1>

        <% 
            String cp = request.getContextPath();
            String indexPath = cp + "/index.xhtml";
        %>
        

        <a href="<%=indexPath%>">Click here to go to the home page</a>
    </body>
</html>
