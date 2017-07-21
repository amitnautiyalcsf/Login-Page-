<%@page import="java.sql.Connection"%>

<html>
    <head>
        <title>Update</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <form method="post" action="registercheck.jsp">
            Enter ID<input type="text" name="ID"><br>
            Enter new username<input type="text" name="username"><br>
        Enter new password<input type="text" name="password"><br>
        Enter new department<input type="text" name="department"><br>
        Enter new salary<input type="text" name="salary"><br>
        <input type="submit">
        </form>
    </body>
</html>
