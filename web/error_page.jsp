<%--
    Document   : error_page
    Created on : Jan 14, 2025, 10:16:42 AM
    Author     : vamsh
--%>

<%@page isErrorPage="true" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry ! something went wrong... </title>

        <!--bootstrap css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background
            {
                clip-path: polygon(0 0, 100% 0, 100% 30%, 100% 87%, 74% 84%, 23% 94%, 0 85%, 0% 30%);
            }

        </style>

    </head>
    <body>

        <div class="container text-center p-5">
            <img class="img-fluid" src="img/errorPage.png" alt="alt"/>
            <br>
            <br>
            <h3 class="display-3">Sorry! something went wrong</h3>
            <%= exception%>
            <br>
            <a href="index.jsp" class="primary-background btn btn-lg text-white">Home</a>
        </div>

    </body>
</html>
