<%@ page language="java" 
    contentType="text/html; charset = utf-8" 
    import = "java.sql.*" 
%>

<html> 
<head> 
<title>SQL Azure via JDBC</title> 
</head> 
<body> 
<h1>Northwind Customers</h1> 
<% 
try{ 
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); 
    String connectionUrl = "jdbc:sqlserver://jspdatabase.database.windows.net:1433;database=jspDB;user=xiang@jspdatabase;password=Dd38265962;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;" ;
    Connection con = DriverManager.getConnection(connectionUrl); 
    out.print("Connected.<br/>"); 
    String SQL = "SELECT * FROM jspDB;"; 
    Statement stmt = con.createStatement(); 
    ResultSet rs = stmt.executeQuery(SQL);

    while (rs.next()) { 
        out.print(rs.getString(1) + ": " + rs.getString(2) + "<br/>"); 
    } 
}catch(Exception e){ 
        out.print("Error message: "+ e.getMessage()); 
} 
%> 
</body> 
</html>