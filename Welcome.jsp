<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%! int Salary=435;
%>
<%
    String n=(String)session.getAttribute("uname");
    out.print("Welcome "+n);  
    String f=(String)session.getAttribute("password");
    out.println("<br>");
    int dateofj;
    try{
           Class.forName("com.mysql.jdbc.Driver");  
Connection con;
    con = DriverManager.getConnection(  
            "jdbc:mysql://localhost:3306/system","system","root");
    String sql="select * from credentials where username=? and password=?";
    PreparedStatement pstmt=con.prepareStatement(sql);
    pstmt.setString(1,n);
    pstmt.setString(2,f);
    ResultSet rs;
        rs = pstmt.executeQuery();
    while(rs.next()){
      String DOJ= rs.getString("dateofjoining");
       String TOJ=rs.getString("time");
       String Department=rs.getString("department");
       String Name=rs.getString("username");
       String Password=rs.getString("password");
    String Salary=(String)rs.getString("salary");
    String ID=rs.getString("id");
    
      out.println("date of Joining"+DOJ+"<BR>");
       out.println("time of Joining"+TOJ+"<BR>");
      out.println("your Department is");    
      out.println("<form method='post' action='update.jsp'>");
out.println("<input type='text' value='"+Department+"' name='department'> <br>"); 
 out.println("Your Username is");
out.println("<input type='text' value='"+Name+"' name='uname' <br> "); 
 out.println("Your Password is");
out.println("<input type='text' value='"+Password+"' name='password'> <br>"); 
 out.println("Your Salary is");
out.println("<input type='text' value='"+Salary+"' name='salary'> <br> "); 
out.println("<input type='hidden' value='"+ID+"' name='ID'> <br>");
out.println("<input type='submit' value='Update'>");
    out.println("<br>");
    } }
    catch(Exception e)
            {
            
            out.println(e);
            }
   %> 
    

