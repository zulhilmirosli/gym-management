
<%-- 
    Document   : error
    Created on : 8 Jun 2023, 11:37:44 am
    Author     : Muhamad Syahmi S62602
--%>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
    <head>

        <title>Error Page</title>
    </head>
    <body>
    <center>
        <h1>Error</h1>
        <h2><%=exception.getMessage()%><br/></h2>
    </center>
</body>
</html>
