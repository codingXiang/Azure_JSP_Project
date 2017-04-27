<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" 
    contentType="text/html; charset = UTF-8" 
    import = "java.sql.*" 
%>


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
