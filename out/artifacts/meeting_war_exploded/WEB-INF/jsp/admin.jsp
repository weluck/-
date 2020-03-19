<%--
  Created by IntelliJ IDEA.
  User: iamso
  Date: 2019/12/8
  Time: 20:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="CH">
<head>
    <title>管理员</title>
    <!-- Meta tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content=""
    />
    <script>
        addEventListener("load", function () { setTimeout(hideURLbar, 0); }, false); function hideURLbar() { window.scrollTo(0, 1); }
    </script>
    <!-- Meta tags -->
    <!--stylesheets-->
    <link href="../../statics/css/style.css" rel='stylesheet' type='text/css' media="all">
</head>
<body>
<div class="mid-class">
    <div style="margin: 0 auto;position: relative;bottom: 30px;left: 123px;" class="art-right-w3ls">
        <h2>管理员登录</h2>
        <form action="${pageContext.request.contextPath}/admin/logIn" method="post">
            <div class="main">
                <div class="form-left-to-w3l">
                    <input type="text" name="account" placeholder="账号" required="">
                </div>
                <div class="form-left-to-w3l ">
                    <input type="password" name="psw" placeholder="密码" required="">
                    <div class="clear"></div>
                </div>
            </div>
            <div style="position: relative;top: 63px;" class="btnn">
                <button style="width: 150px;height: 70px; ;border-bottom-left-radius: 35px" type="submit">登录</button>
            </div>
        </form>
    </div>
</div>
</body>
<script language="javascript">
    (function a(){
        let temp = "${flag}";
        if (temp != null) {
            if (temp == 1) {
                window.location.replace("${pageContext.request.contextPath}/admin/manager")
            }
            if (temp == 2) {
                alert("用户名或密码错误！")
            }
        }
    })()
</script>
</html>