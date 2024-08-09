<%-- 
    Document   : insert
    Created on : 31 Jul, 2024, 11:49:27 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="insertDB.jsp">
            <table border=5>
                <tr>
                    <th colspan="2">Purchase Product</th>
                </tr>

                <tr>
                    <td>Product ID: </td>
                    <td> <input type="text" name="pid"> </td>
                </tr>

                <tr>
                    <td>Product Name: </td>
                    <td> <input type="text" name="pname"> </td>
                </tr>

                <tr>
                    <td>Quantity: </td>
                    <td> <input type="text" name="quantity"> </td>
                </tr>

                <tr>
                    <td><input type="submit" value="Store"></td>
                    <td><input type="submit" value="Reset"> </td>
                </tr>
            </table>
        </form>
        
        <font color="red">
            <c:if test="${not empty param.errMsg}">
                <c:out value="${param.errMsg}" />
                <a href="index.html">Go back</a>
            </c:if>
        </font>
        
        <font color="green">
            <c:if test="${not empty param.susMsg}">
                <c:out value="${param.susMsg}" />
                <a href="index.html">Go back</a>
            </c:if>
        </font>

        
        
    </body>
</html>
