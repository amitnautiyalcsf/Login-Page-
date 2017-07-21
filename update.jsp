<%@page import="java.sql.*" %>

<%!
    private static java.sql.Timestamp getCurrentTimeStamp() {

		java.util.Date today = new java.util.Date();
		return new java.sql.Timestamp(today.getTime());

	}
%>
<%
    String a=request.getParameter("uname");  
    String b=request.getParameter("password");
    String c=request.getParameter("department");
    String salt=request.getParameter("salary");
     String k=request.getParameter("ID");
     try{
    int ksal=Integer.parseInt(request.getParameter("salary"));
     }
     catch(Exception e)
     {
     out.println(e);
     }
    try{
        int ksal=Integer.parseInt(request.getParameter("salary"));
    Class.forName("com.mysql.jdbc.Driver");  
Connection con;
    con = DriverManager.getConnection(  
            "jdbc:mysql://localhost:3306/system","system","root");
    String sql;
        
        sql="UPDATE credentials SET username = ?,password=?,department=?,salary=? WHERE id= ?";
    PreparedStatement pstmt=con.prepareStatement(sql);
    pstmt.setString(1,a);
    pstmt.setString(2,b);
   
    pstmt.setString(3,c);
     pstmt.setInt(4,ksal);
   // pstmt.setInt(4,ksal);
    pstmt.setString(5,k);
    ResultSet rs;
        int r= pstmt.executeUpdate();
    
    out.println("Data updated successfully ="+r);
    out.println("<br>");
     
   } 
    catch(Exception e)
    {
    out.println(e);
    }
    %>

<%@include file="Welcome.jsp" %>

