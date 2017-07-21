<%@page import="java.sql.*"%>
<%!private static java.sql.Timestamp getCurrentTimeStamp() {

		java.util.Date today = new java.util.Date();
		return new java.sql.Timestamp(today.getTime());

	}
%>

<%
    int z1=0;
    
    String z=request.getParameter("ID");
    try{
    z1=Integer.parseInt(request.getParameter("ID"));
    }
    catch(Exception ki){
    out.println(ki);
    }
    String a=request.getParameter("username");  
    String b=request.getParameter("password");
    String c=request.getParameter("department");
    String f=request.getParameter("salary");
    
    try{
    Class.forName("com.mysql.jdbc.Driver");  
Connection con;
    con = DriverManager.getConnection(  
            "jdbc:mysql://localhost:3306/system","system","root");
    String sql;
        
        sql="INSERT INTO credentials"
		+ "(username,password,department,salary,time,dateofjoining,id) VALUES"
		+ "(?,?,?,?,?,?,?)";
    PreparedStatement pstmt=con.prepareStatement(sql);
    pstmt.setString(1,a);
    pstmt.setString(2,b);
   
    pstmt.setString(3,c);
    pstmt.setString(4,f);
    pstmt.setTimestamp(5, getCurrentTimeStamp());
    pstmt.setDate(6,java.sql.Date.valueOf(java.time.LocalDate.now()));
    pstmt.setInt(7,z1);
    ResultSet rs;
        int r= pstmt.executeUpdate();
    if(r>0){
    out.println("Registration Successful!Number of users added ="+r);
    out.println("<br>");
    }    
    else
    {
    out.println("Registration failed..Please try again");
    out.println("<a href=newhtml.html>Click here to go to registration page");
    }
    
   
    } 
    catch(Exception e)
    {
    out.println(e);
    }
    %>

<%@ include file="index.html" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1></h1>
    </body>
</html>
