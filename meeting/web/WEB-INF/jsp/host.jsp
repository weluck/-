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
    <title>Title</title>
    <script src="../../statics/js/jquery-3.4.1.js"></script>
    <script src="../../statics/js/utf.js"></script>
    <script src="../../statics/js/jquery.qrcode.min.js"></script>
    <script src="../../statics/js/bootstrap.min.js"></script>
    <link href="../../statics/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="page-header">
    <h1 style="text-align: center">欢迎登录, ${userId}。<small>请在下方进行操作</small></h1>
    <div class="inner cover">
        <p class="lead">
        <div style="text-align: center">
            <button id="btn1" type="button" class="btn btn-success">查看所有会议</button>
            <button id="btn2" data-toggle="modal" data-target="#myModal" type="button" class="btn btn-success">组织会议</button>
            <button id="btn3" type="button" class="btn btn-success">查看你的会议</button>
        </div>
    </div>
    <div class="panel panel-default" style="width: 1100px; margin: 0 auto;">
        <div class="panel-heading">会议</div>
        <table class="table table-striped" align="center">
            <tr id="tHead">
                <th>会议id</th>
                <th>会议时间</th>
                <th>会议地点</th>
                <th>参会大咖</th>
                <th>住宿宾馆</th>
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
                        申请一个会议
                    </h4>
                </div>
                <div class="modal-body">
                    <form method="post" action="${pageContext.request.contextPath}/meeting/addMeet">
                        <div class="form-group">
                            <label for="1">会议时间:</label>
                            <input name="meetDate" type="text" class="form-control" id="1" placeholder="account" required>
                        </div>
                        <div class="form-group">
                            <label for="2">会议地点：</label>
                            <input name="meetAddress" type="text" class="form-control" id="2" placeholder="Address" required>
                        </div>
                        <div class="form-group">
                            <label for="3">会议大咖：</label>
                            <input name="meetPerson" type="text" class="form-control" id="3" placeholder="Person" required>
                        </div>
                        <div class="form-group">
                            <label for="4">会议宾馆:</label>
                            <input name="meetHotel" class="form-control" id="4" placeholder="phoneNumber" required>
                        </div>
                        <div class="form-group">
                            <label for="5">参会日期:</label>
                            <input name="date" class="form-control" id="5" placeholder="date" required>
                        </div>
                        <div>
                            <label class="radio-inline">
                                <input name="ifIfRoom" type="radio" value="1"> 添加需要房间选项
                            </label>
                            <label class="radio-inline">
                                <input name="ifIfRoom" type="radio" value="0"> 不添加
                            </label>
                        </div>
                        <div>
                            <label class="radio-inline">
                                <input name="ifName" type="radio" value="1"> 添加名字选项
                            </label>
                            <label class="radio-inline">
                                <input name="ifName" type="radio" value="0"> 不添加
                            </label>
                        </div>
                        <div>
                            <label class="radio-inline">
                                <input name="ifWorkPlace" type="radio" value="1"> 添加工作地点选项
                            </label>
                            <label class="radio-inline">
                                <input name="ifWorkPlace" type="radio" value="0"> 不添加
                            </label>
                        </div>
                        <div>
                            <label class="radio-inline">
                                <input name="ifId" type="radio" value="1"> 添加身份证选项
                            </label>
                            <label class="radio-inline">
                                <input name="ifId" type="radio" value="0"> 不添加
                            </label>
                        </div>
                        <div>
                            <label class="radio-inline">
                                <input name="ifPhone" type="radio" value="1"> 添加手机号选项
                            </label>
                            <label class="radio-inline">
                                <input name="ifPhone" type="radio" value="0"> 不添加
                            </label>
                        </div>
                        <div>
                            <label class="radio-inline">
                                <input name="ifDate" type="radio" value="1"> 添加日期选项
                            </label>
                            <label class="radio-inline">
                                <input name="ifDate" type="radio" value="0"> 不添加
                            </label>
                        </div>
                        <div>
                            <label class="radio-inline">
                                <input name="ifSex" type="radio" value="1"> 添加性别选项
                            </label>
                            <label class="radio-inline">
                                <input name="ifSex" type="radio" value="0"> 不添加
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
    <div style="text-align: center; margin-top: 160px" class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"></div>
    <script>
        var flag = true;
        var MyMeet = [];
        $(function () {
            $("#btn1").click(function () {
                $.get("${pageContext.request.contextPath}/meeting/queryMeet",function (data) {
                    console.log(data);
                    let html="";
                    let flag1 = document.getElementById("tempTh");
                    if (flag1 == null) console.log("kongde");
                    else {
                        flag = true;
                         document.getElementById("tHead").removeChild(flag1);
                    }
                    for (let i = 0; i <data.length ; i++) {
                        html += "<tr>" +
                            "<td>" + data[i].meetId + "</td>" +
                            "<td>" + data[i].meetDate + "</td>" +
                            "<td>" + data[i].meetAddress + "</td>" +
                            "<td>" + data[i].meetPerson + "</td>" +
                            "<td>" + data[i].meetHotel + "</td>" +
                            "</tr>"
                    }
                    $("#content").html(html);
                });
            });
            $("#btn3").click(function () {
                $.get("${pageContext.request.contextPath}/meeting/queryMeetByUser",
                    {"userAccount": "${userId}"},
                    function (data) {
                    MyMeet = data;
                    let html="";
                    if (flag) {
                        document.getElementById("tHead").innerHTML += "<th id='tempTh' style='text-align: center' colspan='3'>可进行以下操作</th>";
                        flag = false;
                    }
                    for (let i = 0; i <data.length ; i++) {
                        html += "<tr>" +
                            "<td>" + data[i].meetId + "</td>" +
                            "<td>" + data[i].meetDate + "</td>" +
                            "<td>" + data[i].meetAddress + "</td>" +
                            "<td>" + data[i].meetPerson + "</td>" +
                            "<td>" + data[i].meetHotel + "</td>" +
                            "<td style='text-align: center'>" + "<button onclick=\"downloadMeet("+ i + ")\" id=\"btnDown" + i + "\" type=\"button\" class=\"btn btn-info\" style=\"width: 90px; height: 25px; font-size: 5px\">下载人员表格</button>"+"</td>"+
                            "<td style='text-align: center'>" + "<button onclick=\"deleteMeet("+ i + ")\" id=\"btnDele" + i + "\" type=\"button\" class=\"btn btn-danger\" style=\"width: 70px; height: 25px; font-size: 5px\">删除会议</button>"+"</td>"+
                            "<td style='text-align: center'>" + "<button data-toggle=\"modal\" data-target=\"#myModal2\" "+" type=\"button\" class=\"btn btn-success\" style=\"width: 80px; height: 25px; font-size: 5px\">生成二维码</button>"+"</td>"+
                            "</tr>"
                    }
                    $("#content").html(html);
                });
            });
        });
        function deleteMeet(num){
            $.ajax({
                url:"${pageContext.request.contextPath}/meeting/deleteMeet",
                data: {"meetId": MyMeet[num].meetId},
                success: function(succ){
                    alert("删除成功");
                },
                error: function(){
                    alert("error");
                }
            })
        }
        function downloadMeet(num) {
            <%--$.post(--%>
            <%--"${pageContext.request.contextPath}/meeting/exportExcel",--%>
            <%--{"meetId": MyMeet[num].meetId},--%>
            <%--);--%>
            window.location.href = "${pageContext.request.contextPath}/meeting/exportExcel?meetId=" + MyMeet[num].meetId;
        }
        $("#myModal2").qrcode({
            render : "canvas",    //设置渲染方式，有table和canvas，使用canvas方式渲染性能相对来说比较好
            text : "localhost:8080/meeting/attend",    //扫描二维码后显示的内容,可以直接填一个网址，扫描二维码后自动跳向该链接
            width : "200",               //二维码的宽度
            height : "200",              //二维码的高度
            background : "#ffffff",       //二维码的后景色
            foreground : "#000000",        //二维码的前景色
            //src: 'photo.jpg'             //二维码中间的图片
        });
    </script>
</div>
</body>
</html>
