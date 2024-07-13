<%-- 
    Document   : Register
    Created on : Jul 12, 2024, 12:40:41 PM
    Author     : Admin
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="javax.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String username= request.getParameter("username");
            String password= request.getParameter("password");
            String reEnter= request.getParameter("reEnter");
            String email= request.getParameter("email");
            String country= request.getParameter("country");
            
            if(password.equals(reEnter)){
                //database connectivity
               try{
                   Class.forName("com.mysql.jdbc.Driver");
                   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
                   PreparedStatement pst=con.prepareStatement("INSERT INTO registration_25 values(?,?,?,?)");
                   pst.setString(1, username);
                   pst.setString(2, password);
                   pst.setString(3, email);
                   pst.setString(4, country);
                   int rows=pst.executeUpdate();
                   if(rows == 1)
                       out.println("<h1>Registration Successfull!!!</h1");
                   else{
                       out.println("Registration Failed!!!Try again");
            %>
                   <jsp:include page="Register.html"></jsp:include>  
            <%        
                       }
               } 
               catch(Exception e){
                   out.println("Exception detail:"+e);
               }
            } 
            else{
                out.print("Password Mismatch!! Re-Enter all details once again");
            %>
                   <jsp:include page="Register.html"></jsp:include>
            <%
               }
            %>
    </body>
</html>
