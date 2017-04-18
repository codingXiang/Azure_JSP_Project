<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
  <head>
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
          <%
      response.setHeader("Cache-Control","no-cache");
      response.setHeader("Pragma","no-cache");
      response.setDateHeader("Expires",0);
    %>
  <title>JSP Test</title>
  <!-- Compiled and minified CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/css/materialize.min.css">
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
      <!-- Compiled and minified JavaScript -->
      <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/js/materialize.min.js"></script>
      <script>
          $(document).ready(function () {
              $('select').material_select();
          });
      </script>
  </head>
  <body>
  <%-- <form action="index.jsp" method="POST">
      <input type="text" name="username"/>
      <br/>
      <input type="number" name="age"/>
      <br/>
      <select name="sex">
          <option selected disabled>請選擇性別</option>
          <option value="female">女</option>
          <option value="male">男</option>
      </select>
      <br/>
      <input type="submit" value="送出" class="waves-effect waves-light btn"/>
      <input type="reset" value="重新填寫"/>
  </form> --%>
  <div class="z-depth-5" style="margin:10vh;width:50%;text-align:center;margin-left:25%;padding:2vh;">
    <form class="col s12" action="index.jsp" method="POST">
        <div class="row">
            <div class="input-field col s12">
              <h3>Register</h3>
            </div>
            <div class="input-field col s12">
                <input name="username" type="text" class="validate">
                    <label for="username" class="active">姓名</label>
                </div>
                <div class="input-field col s12">

                <input name="age" type="number" class="validate">
                    <label for="age" class="active">年齡</label>
                </div>
                <div class="input-field col s12">
                    <select name="sex">
                        <option selected disabled>請選擇性別</option>
                        <option value="female">女</option>
                        <option value="male">男</option>
                    </select>
                    <label>性別</label>
                </div>
                <div class="input-field col s12">
                  <input type="submit" value="註冊" class="waves-effect waves-light btn"/>
                  <input type="reset" value="重新填寫" class="waves-effect waves-light btn"/>
                </div>
            </div>
        </form>
  </div>
      <h>
          <%
              class User{
                String name, sex;
                int age;
                public User(String name , String age , String sex){
                   this.name = name;
                   this.age = Integer.valueOf(age);
                   this.sex = sex;
                 }
               }
          %>
          <%
              if (request.getParameter("username") != null){
                String name = request.getParameter("username");
                String age = request.getParameter("age");
                String sex = request.getParameter("sex");
                User user = new User(name,age,sex);
                session.setAttribute("user" ,user);
                HttpSession s = request.getSession();
                User session_user = (User)s.getAttribute("user");
                out.println("姓名：" + session_user.name);
                out.println("性別：" + session_user.sex);
                out.println("年齡：" + session_user.age);
              }
          %>
      </h>
  </body>
</html>
