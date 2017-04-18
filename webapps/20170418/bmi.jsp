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
              <h3>BMI 計算</h3>
            </div>
            <div class="input-field col s12">
                <input name="height" type="number" class="validate">
                    <label for="height" class="active">身高</label>
                </div>
                <div class="input-field col s12">

                <input name="weight" type="number" class="validate">
                    <label for="weight" class="active">體重</label>
                </div>
                <div class="input-field col s12">
                  <input type="submit" value="計算" class="waves-effect waves-light btn"/>
                  <input type="reset" value="重新填寫" class="waves-effect waves-light btn"/>
                </div>
            </div>
        </form>
  </div>
      <h>
          <%
              class BMI_Handler{
                float height;
                float weight;
                public BMI_Handler(float height , float weight){
                  this.height = height;
                  this.weight = weight;
                }
                public float calculate(){
                  // 體重(公斤) / 身高2(公尺2)
                  float bmi = 0;
                  bmi = this.weight / Math.pow(this.height,2);
                  return bmi;
                }
              }
          %>
          <%
              if (request.getParameter("height") != null && request.getParameter("weight") != null){
                float height = float.valueOf(request.getParameter("height"));
                float weight = float.valueOf(request.getParameter("weight"));
                BMI_Handler bmi = new BMI_Handler(height,weight);
                session.setAttribute("BMI" ,bmi);
                HttpSession s = request.getSession();
                User session_bmi = (BMI_Handler)s.getAttribute("BMI");
                out.println("BMI：" + session_bmi.calculate());
              }
          %>
      </h>
  </body>
</html>
