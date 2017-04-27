<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>


<html>
<head>
<title>get 和 set 属性实例</title>
</head>
<body>

<jsp:useBean id="students"
                    class="com.runoob.StudentsBean">
   <jsp:setProperty name="students" property="firstName"
                    value="大明"/>
   <jsp:setProperty name="students" property="lastName" 
                    value="王"/>
   <jsp:setProperty name="students" property="age"
                    value="23"/>
</jsp:useBean>
<%
	String sql = "select * from jspDB";



    // 连接字符串，格式： "jdbc:公司名称:数据库驱动名称://数据库服务器ip:端口号;DatabaseName=数据库名称"

    String url = "jdbc:microsoft:sqlserver:jspdatabase.database.windows.net:1433;DatabaseName=jspDB";

    String username = "xiang";

    String password = "Dd38265962";



    Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver").newInstance();



    Connection conn = DriverManager.getConnection(url, username, password); 

    Statement  stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

    ResultSet  rs   = stmt.executeQuery(sql);

%>
<p>名字:
   <jsp:getProperty name="students" property="firstName"/>
</p>
<p>姓氏:
   <jsp:getProperty name="students" property="lastName"/>
</p>
<p>年齡:
   <jsp:getProperty name="students" property="age"/>
</p>

</body>
</html>
