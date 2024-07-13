<%-- 
    Document   : Login
    Created on : Jul 12, 2024, 12:41:10 PM
    Author     : Admin
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="javax.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
            String uname= request.getParameter("uname");
            String pass= request.getParameter("pass");
            
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
                PreparedStatement prst=con.prepareStatement("select * from registration_25 where username=?");
                prst.setString(1,uname);
                ResultSet rs=prst.executeQuery();
                if(rs.next()){
                    if(rs.getString(2).equals(pass)){
                        out.println("Login Successfull");
                    }
                    else{
                        out.println("Password Incorrect");
                    %>
                    <jsp:include page="Login.html"></jsp:include>
                    <%
                    }
                    
                }
                else{
                    out.println("Username doesnt exist");
                   %>
                   <jsp:include page="Register.html"></jsp:include>
                   <%
                }
                
                
            }
            catch(Exception e){
                out.println("Exception detail:"+e);
            }
         %>
    </body>
</html>
