<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    
try{  
Class.forName("com.mysql.jdbc.Driver");  
Connection con;
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/system","system","root");

   // out.println(cn);
    
    String name=request.getParameter("username");
    String pass=request.getParameter("password");
   
    boolean status=false;  


      
PreparedStatement ps=con.prepareStatement(  
"select * from credentials where username=? and password=?");  
ps.setString(1,name);  
ps.setString(2,pass);  
      
ResultSet rs=ps.executeQuery();  
status=rs.next(); 
     if(status==true){  
        //RequestDispatcher rd=request.getRequestDispatcher("Welcome.jsp");
        //rd.forward(request,response);
        session.setAttribute("uname",name);
        session.setAttribute("password",pass);
       response.sendRedirect("Welcome.jsp");
    }  
    else{  
        out.print("<font color='red'>Sorry username or password error.PLEASE TRY AGAIN</font> ");
        //RequestDispatcher rd=request.getRequestDispatcher("index.html");
      
        %> 
        
      
     <jsp:include page="index.html"></jsp:include> 
     
     <%
    }
    
    
    
    
    }
    catch(SQLException e)
    {
     out.println(e);   
    }
         %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1></h1>
    </body>
</html>
