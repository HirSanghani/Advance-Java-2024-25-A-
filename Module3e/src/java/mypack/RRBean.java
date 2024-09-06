package mypack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.ejb.Stateful;
@Stateful
public class RRBean {
      public RRBean(){}
      public String roombooking(String cn, String cm, String rt) throws SQLException, ClassNotFoundException{
          String message = "";
          try{         
              Class.forName("com.mysql.jdbc.Driver");
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
              String query = "SELECT * FROM roombook WHERE roomtype = ? and statusroom='Not Booked'";
              PreparedStatement pstmt = con.prepareStatement(query);
              pstmt.setString(1, rt);
              ResultSet rs= pstmt.executeQuery();     
              if (rs.next()){
                  String rno = rs.getString(1);
                  PreparedStatement pstmt1 = con.prepareStatement("UPDATE roombook SET customer = ? where roomid = ?");
                  pstmt1.setString(1, cn);
                  pstmt1.setString(2, rno);
                  pstmt1.executeUpdate();
                  
                  pstmt1 = con.prepareStatement("UPDATE roombook SET mobile = ? where roomid = ?");
                  pstmt1.setString(1, cm);
                  pstmt1.setString(2, rno);
                  pstmt1.executeUpdate();
                  
                  pstmt1 = con.prepareStatement("UPDATE roombook SET statusroom = ? where roomid = ?");
                  pstmt1.setString(1, "Booked");
                  pstmt1.setString(2, rno);
                  pstmt1.executeUpdate();
                  
                  message = "Room" +rno+ "Booked and Charges =" +rs.getString(3);
              }
              else{
                   message = "Room"+rt+"Currently Not Available";
              }
          }
          catch(Exception e ){message =""+e;}
          return message;
      }
}
