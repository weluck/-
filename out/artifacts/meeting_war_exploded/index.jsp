<%--
  Created by IntelliJ IDEA.
  User: iamso
  Date: 2019/11/25
  Time: 14:49
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

  <title>Cover Template for Bootstrap</title>
  <link href="statics/css/bootstrap.min.css" rel="stylesheet">
  <link href="statics/css/cover.css" rel="stylesheet">
</head>

<body>

<div class="site-wrapper">

  <div class="site-wrapper-inner">

    <div class="cover-container">

      <div class="masthead clearfix">
        <div class="inner">
          <h3 class="masthead-brand">会议报名(meeting)</h3>
        </div>
      </div>

      <div class="inner cover">
        <h1 class="cover-heading">会议操作系统</h1>
        <p class="lead">在这里你可以参加、管理、操作、组织会议</p>
        <p class="lead">
          <a href="${pageContext.request.contextPath}/meeting/logInHost" class="btn btn-lg btn-default">点此组织会议</a>
          <a href="${pageContext.request.contextPath}/meeting/logInAttend" class="btn btn-lg btn-default">点此参加会议</a>
        </p>
      </div>

      <div class="mastfoot">
        <div class="inner">
          <p>Creating template by <a>@翁路成</a>.</p>
        </div>
      </div>

    </div>

  </div>

</div>
</body>
</html>


