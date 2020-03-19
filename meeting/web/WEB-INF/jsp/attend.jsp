<%--
  Created by IntelliJ IDEA.
  User: iamso
  Date: 2019/11/28
  Time: 20:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>参加会议</title>
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
            <button id="btn" type="button" class="btn btn-success">查看当前会议</button>
        </div>
        </p>
    </div>
    <div class="panel panel-default" style="width: 1100px; margin: 0 auto;">
        <div class="panel-heading">会议</div>
        <table class="table table-bordered" align="center">
            <tr>
                <th>会议id</th>
                <th>会议时间</th>
                <th>会议地点</th>
                <th>参会大咖</th>
                <th>住宿宾馆</th>
                <th>&emsp;&emsp;</th>
            </tr>
            <tbody id="content">
            </tbody>
        </table>
    </div>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        加入此会议
                    </h4>
                </div>
                <div class="modal-body">
                    <form method="post" action="${pageContext.request.contextPath}/meeting/addInfor">
                        <div id="meetId">
                        </div>
                        <div class="form-group">
                            <label for="1">姓名:</label>
                            <input name="name" type="text" class="form-control" id="1" placeholder="account">
                        </div>
                        <div class="form-group">
                            <label for="2">工作地点：</label>
                            <input name="workPlace" type="text" class="form-control" id="2" placeholder="Password">
                        </div>
                        <div class="form-group">
                            <label for="3">身份证号：</label>
                            <input name="id" type="text" class="form-control" id="3" placeholder="id">
                        </div>
                        <div class="form-group">
                            <label for="4">手机号:</label>
                            <input name="phone" class="form-control" id="4" placeholder="phoneNumber">
                        </div>
                        <div class="form-group">
                            <label for="5">参会日期:</label>
                            <input name="date" class="form-control" id="5" placeholder="date">
                        </div>
                        <div>
                        <label class="radio-inline">
                            <input name="sex" type="radio" id="6" value="男"> 男
                        </label>
                        <label class="radio-inline">
                            <input name="sex" type="radio" id="7" value="女"> 女
                        </label>
                        </div>
                        <div>
                        <label class="radio-inline">
                            <input name="ifRoom" type="radio" id="8" value="1"> 需要房间
                        </label>
                        <label class="radio-inline">
                            <input name="ifRoom" type="radio" id="9" value="0"> 不需要房间
                        </label>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                            </button>
                            <button type="submit" class="btn btn-primary">
                                提交表格
                            </button>
                        </div>
                    </form>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
    <script>
        var meet = [];
        $(function () {
            $("#btn").click(function () {
                $.get("${pageContext.request.contextPath}/meeting/queryMeet",function (data) {
                    console.log(data);
                    meet = data;
                    let html="";
                    for (let i = 0; i <data.length ; i++) {
                        html += "<tr>" +
                            "<td>" + data[i].meetId + "</td>" +
                            "<td>" + data[i].meetDate + "</td>" +
                            "<td>" + data[i].meetAddress + "</td>" +
                            "<td>" + data[i].meetPerson + "</td>" +
                            "<td>" + data[i].meetHotel + "</td>" +
                            "<td style='text-align: center'>" + "<button data-toggle=\"modal\" data-target=\"#myModal\" onclick=\"rollIn("+ i + ")\" id=\"btn" + i + "\" type=\"button\" class=\"btn btn-success\" style=\"width: 70px; height: 25px; font-size: 5px\">参加会议</button>"+"</td>"+
                            "</tr>"
                    }
                    $("#content").html(html);
                });
            });
        });
        function rollIn(num) {
            let temp = meet[num];
            $("#meetId").html("<input name=\"meetId\" class=\"form-control\" type=\"hidden\" "+ " value=\""+ temp.meetId+"\" >");
            if (temp.ifName == 0) $("#1").attr("disabled", true);
            if (temp.ifWorkPlace == 0) $("#2").attr("disabled",true);
            if (temp.ifId == 0) $("#3").attr("disabled",true);
            if (temp.ifPhone == 0) $("#4").attr("disabled",true);
            if (temp.ifDate == 0) $("#5").attr("disabled",true);
            if (temp.ifSex == 0) $("#6").attr("disabled",true);
            if (temp.ifSex == 0) $("#7").attr("disabled",true);
            if (temp.ifIfRoom == 0) $("#8").attr("disabled",true);
            if (temp.ifIfRoom == 0) $("#9").attr("disabled", true);
        }
    </script>
</div>
</body>
</html>
