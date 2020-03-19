<%--
  Created by IntelliJ IDEA.
  User: iamso
  Date: 2019/12/9
  Time: 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员</title>
    <script src="../../statics/js/jquery-3.4.1.js"></script>
    <script src="../../statics/js/bootstrap.min.js"></script>
    <link href="../../statics/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="page-header">
    <h1 style="text-align: center">欢迎登录, ${userId}。<small>请在下方进行操作</small></h1>
    <div class="inner cover">
        <p class="lead">
        <div style="text-align: center">
            <button id="btn" type="button" class="btn btn-success">查看所有组织人员</button>
            <button id="btn1" type="button" class="btn btn-success">查看所有参与者</button>
        </div>
        </p>
    </div>
</div>
<div class="panel panel-default" style="width: 1100px; margin: 0 auto;">
    <div class="panel-heading">用户信息</div>
    <table class="table table-striped" align="center">
        <tr id="tHead">
            <th>账号</th>
        </tr>
        <tbody id="content">
        </tbody>
    </table>
</div>
<script>
    var Host;
    var Attendent;
    $(function () {
        $("#btn").click(function () {
            $.get("${pageContext.request.contextPath}/admin/queryHost",function (data) {
                console.log(data);
                Host = data;
                let html="";
                for (let i = 0; i <data.length ; i++) {
                    html += "<tr>" +
                        "<td>" + data[i].account + "</td>" +
                        "<td style='text-align: center'>" + "<button data-toggle=\"modal\" data-target=\"#myModal\" onclick=\"deleteHost("+ i + ")\" id=\"btn" + i + "\" type=\"button\" class=\"btn btn-danger\" style=\"width: 70px; height: 25px; font-size: 5px\">注销用户</button>"+"</td>"+
                        "</tr>"
                }
                $("#content").html(html);
            });
        });
        $("#btn1").click(function () {
            $.get("${pageContext.request.contextPath}/admin/queryAttendent",function (data) {
                console.log(data);
                Attendent = data;
                let html="";
                for (let i = 0; i <data.length ; i++) {
                    html += "<tr>" +
                        "<td>" + data[i].account + "</td>" +
                        "<td style='text-align: center'>" + "<button data-toggle=\"modal\" data-target=\"#myModal\" onclick=\"deleteAttendent("+ i + ")\" id=\"btn" + i + "\" type=\"button\" class=\"btn btn-danger\" style=\"width: 70px; height: 25px; font-size: 5px\">注销用户</button>"+"</td>"+
                        "</tr>"
                }
                $("#content").html(html);
            });
        });
    });
    function deleteHost(num){
        $.ajax({
            url:"${pageContext.request.contextPath}/admin/deleteHost",
            data: {"account": Host[num].account},
            success: function(succ){
                alert("删除成功");
            },
            error: function(){
                alert("error");
            }
        })
    }
    function deleteAttendent(num){
        $.ajax({
            url:"${pageContext.request.contextPath}/admin/deleteAttendent",
            data: {"account": Attendent[num].account},
            success: function(succ){
                alert("删除成功");
            },
            error: function(){
                alert("error");
            }
        })
    }
</script>

</body>
</html>
