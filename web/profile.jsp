<%--
    Document   : profile
    Created on : Jan 14, 2025, 11:13:15 AM
    Author     : vamsh
--%>

<%@page import="com.techblog.entities.User" %>
<%@page errorPage="error_page.jsp" %>

<%

    User user = (User) session.getAttribute("currentUser");

    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
    </head>
    <body>

        <%= user.getUser_name()%>
        <br>
        <%= user.getUser_email()%>
        <br>
        <%= user.getAbout()%>

    </body>
</html>
