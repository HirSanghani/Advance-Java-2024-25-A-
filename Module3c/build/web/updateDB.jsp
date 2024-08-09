<%-- 
    Document   : updateDB
    Created on : 31 Jul, 2024, 11:50:09 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*, java.util.*, java.sql.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/test" user="root" password="root"/>
               <sql:update dataSource="${dbsource}" var="result" >
                   UPDATE productdetails_07 SET pname=?, quantity=? WHERE pid="${param.pid}"
                   <sql:param value="${param.pname}"/>
                   <sql:param value="${param.quantity}"/>
               </sql:update>
                   
                <c:if test="${result>=1}">
                     <font color="green"> Congratulations data updated successfully</font>
                    <a href="index.html">Go home</a>
                </c:if>
    </body>
</html>
