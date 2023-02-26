<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link href="/jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <link href="/jquery/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="/jquery/jquery-1.11.1-min.js"></script>
    <script type="text/javascript" src="/jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>
    <script>
        jQuery(function ($) {
            // 给保存按钮绑定事件
            $("#saveBtn").click(function () {
                $("#saveForm").submit();
            });
        });
    </script>
</head>
<body>

<div style="position:  relative; left: 30px;">
    <h3>新增网站</h3>
    <div style="position: relative; top: -40px; left: 70%;">
        <button id="saveBtn" type="button" class="btn btn-primary">保存</button>
        <button type="button" class="btn btn-default" onclick="window.history.back();">取消</button>
    </div>
    <hr style="position: relative; top: -40px;">
</div>
<%--
    action
    method
    表单元素的name属性和类中一致
--%>
<form id="saveForm" action="/website/save.do" method="post" class="form-horizontal" role="form">

    <div class="form-group">
        <label for="tname" class="col-sm-2 control-label">网站名称</label>
        <div class="col-sm-10" style="width: 300px;">
            <input type="text" class="form-control" name="name" id="tname" style="width: 200%;">
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">网站地址</label>
        <div class="col-sm-10" style="width: 300px;">
            <textarea class="form-control" rows="3" name="url" style="width: 200%;"></textarea>
        </div>
    </div>
    <div class="form-group">
        <label for="typeCode" class="col-sm-2 control-label">网站类型<span style="font-size: 15px; color: red;">*</span></label>
        <div class="col-sm-10" style="width: 300px;">
            <select class="form-control" name="type_id" id="typeCode" style="width: 200%;">
                <option value="">--请选择--</option>
                <c:forEach items="${tList}" var="t">
                    <option value="${t.id}">${t.name}</option>
                </c:forEach>
            </select>
            <div id="typeCodeMsg" style="color:red;"></div>
        </div>
    </div>
    <<div class="form-group">
    <label  class="col-sm-2 control-label">创建人<span style="font-size: 15px; color: red;">*</span></label>
    <div class="col-sm-10" style="width: 300px;">
        <select class="form-control" name="create_user_id" style="width: 200%;">
            <option value="">--请选择--</option>
            <c:forEach items="${uList}" var="u">
                <option value="${u.id}">${u.name}</option>
            </c:forEach>
        </select>
        <div  style="color:red;"></div>
    </div>
</div>
</form>

<div style="height: 200px;"></div>
</body>
</html>