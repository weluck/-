<%--
  Created by IntelliJ IDEA.
  User: iamso
  Date: 2019/11/27
  Time: 19:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>参加会议人员登录</title>

    <!-- Bootstrap core CSS -->
    <script src="../../statics/js/jquery-3.4.1.js"></script>
    <link href="../../statics/css/bootstrap.min.css" rel="stylesheet">
    <link href="../../statics/css/signin.css" rel="stylesheet">
    <script src="../../statics/js/bootstrap.min.js"></script>
    <style>
    </style>
</head>

<body>
<div class="container">

    <form method="post" action="${pageContext.request.contextPath}/meeting/checkAttend" class="form-signin">
        <h2 class="form-signin-heading">请登录</h2>
        <label for="account"></label>
        <input type="text" id="account" name="account" class="form-control" placeholder="请输入账号" required>
        <input type="password" id="inputPassword" name="psw" class="form-control" placeholder="请输入密码" required>
        <div class="checkbox">
            <a href="#" data-toggle="modal" data-target="#myModal">没有账号点此注册哦</a>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
    </form>
    <!-- 模态框（Modal） -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    注册页
                </h4>
            </div>
            <div class="modal-body">

                <form method="post" action="${pageContext.request.contextPath}/meeting/addAttend">
                    <div class="form-group">
                        <label for="1">账号</label>
                        <input name="account" type="text" class="form-control" id="1" placeholder="account">
                    </div>
                    <div class="form-group">
                        <label for="2">密码</label>
                        <input name="psw" type="password" class="form-control" id="2" placeholder="Password">
                    </div>
                    <div class="form-group">
                        <label for="3">Email address</label>
                        <input type="email" class="form-control" id="3" placeholder="Email">
                    </div>
                    <div class="form-group">
                        <label for="4">地址</label>
                        <textarea class="form-control" id="4" rows="3"></textarea>
                    </div>
                    <label class="radio-inline">
                        <input type="radio" id="inlineRadio1" value="option1"> 男
                    </label>
                    <label class="radio-inline">
                        <input type="radio" id="inlineRadio2" value="option2"> 女
                    </label>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="submit" class="btn btn-primary">
                            注册
                        </button>
                    </div>
                </form>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
    </div>
    <script language="javascript">
        (function a(){
            let temp = "${flag}";
            if (temp != null) {
                if (temp == 1) {
                    window.location.replace("${pageContext.request.contextPath}/meeting/attend")
                }
                if (temp == 2) {
                    alert("用户名或密码错误！")
                }
            }
        })()
    </script>

</div> <!-- /container -->
</body>
</html>
