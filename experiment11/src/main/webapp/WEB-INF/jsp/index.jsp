<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="/WEB-INF/jsp/include/commons_head.jsp" %>
    <script>
        jQuery(function ($) {


            var getDate = function(timeStamp){
                var date = new Date(timeStamp);
                Y = date.getFullYear() + '-';
                M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
                D = date.getDate() + ' ';
                h = date.getHours() + ':';
                m = date.getMinutes() + ':';
                s = date.getSeconds();
                return Y+M+D+h+m+s;
            }

            // 发送ajax
            function load(currentPage, rowsPerPage) {

                $("#dataBody").html("");// 清空数据

                // 查询条件
                // var searchData = $("#searchForm").formJSON();
                var searchData = {};

                // 分页条件
                searchData.currentPage = currentPage;
                searchData.rowsPerPage = rowsPerPage;

                //console.log( JSON.stringify(searchData) );
                $.ajax({
                    url: "/website/getAll.json",
                    data: searchData,
                    success: function(page) {
                        $(page.data).each(function (i) {
                            $("#dataBody").append(
                                '<tr class="'+(i%2==0?"active":"")+'">\
                                <td><input name="id" type="checkbox" value="'+this.id+'" /></td>\
                                <td>'+this.id+'</td>\
                                <td>'+this.name+'</td>\
                                <td>'+this.url+'</td>\
                                <td>'+this.type.name+'</td>\
                                <td>'+this.access_num+'</td>\
                                <td>'+getDate(this.last_access_date)+'</td>\
                                <td>'+getDate(this.create_date)+'</td>\
                                <td>'+this.user.name+'</td>\
                                <td><a href="/website/visitView?id='+this.id+'&user.id='+this.user.id+'&url='+this.url+'">访问</a></td>\
                            </tr>'
                            )
                        });

                        // 初始化分页插件
                        $("#page").bs_pagination({
                            currentPage: page.currentPage,          // 当前页（查询条件）
                            rowsPerPage: page.rowsPerPage,          // 每页显示的记录条数（查询条件）
                            maxRowsPerPage: page.maxRowsPerPage,    // 每页最多显示的记录条数
                            totalRows: page.totalRows,              // 总记录数
                            totalPages: page.totalPages,            // 总页数
                            visiblePageLinks: page.visiblePageLinks,// 最多显示几个卡片
                            showGoToPage: true,
                            showRowsPerPage: true,
                            showRowsInfo: true,
                            showRowsDefaultInfo: true,
                            // 点击分页卡片或者是翻页按钮执行的函数
                            onChangePage: function (event, data) {

                                // 分页查询的2个关键条件：当前页和每页条数
                                //alert("当前页是"+data.currentPage);
                                //alert("每页条数是"+data.rowsPerPage);
                                load(data.currentPage, data.rowsPerPage);
                            }
                        });
                    }
                });

            }

            load();


            // // 编辑按钮事件绑定
            // $("#editBtn").click(function() {
            //     // 获取选中的类型
            //     var $cks = $(":checkbox[name=code]:checked");
            //     if ($cks.size() == 0) {
            //         alert("请选择要编辑的字典类型！");
            //         return ;
            //     }
            //     if ($cks.length > 1) {
            //         alert("只能选择一个字典类型！");
            //         return ;
            //     }
            //
            //     location = "/type/editView?code="+$cks.val();
            //
            // });


            // 全选
            $("#selectAll").selectAll(":checkbox[name=id]");

            $("#delBtn").click(function () {
                // 获取选中的类型
                var $cks = $(":checkbox[name=id]:checked");
                if ($cks.size()==0) {
                    alert("请选择删除项！");
                    return ;
                }

                if(!confirm("确定删除吗？")) {
                    return ;
                }

                var arr = [];
                $cks.each(function() {
                    // push方法向数组中存值
                    arr.push(this.value);
                });

                // join方法将数组中的元素以指定的字符串连接，返回连接后的字符串
                var ids = arr.join(",");

                location = "/website/delete.do?ids=" + ids;

            });
        });
    </script>
</head>
<body>

<div>
    <div style="position: relative; left: 30px; top: -10px;">
        <div class="page-header">
            <h3>网站列表</h3>
        </div>
    </div>
</div>
<div class="btn-toolbar" role="toolbar" style="background-color: #F7F7F7; height: 50px; position: relative;left: 30px;">
    <div class="btn-group" style="position: relative; top: 18%;">
        <button type="button" class="btn btn-primary" onclick="location='/website/saveView'"><span
                class="glyphicon glyphicon-plus"></span> 创建
        </button>
        <button id="delBtn" type="button" class="btn btn-danger"><span class="glyphicon glyphicon-minus"></span> 删除
        </button>
    </div>
</div>
<div style="position: relative; left: 30px; top: 20px;">
    <table class="table table-hover">
        <thead>
        <tr style="color: #B3B3B3;">
            <td><input id="selectAll" type="checkbox"/></td>
            <td>序号</td>
            <td>网站名称</td>
            <td>网站URL</td>
            <td>网站类型</td>
            <td>访问次数</td>
            <td>最近一次访问时间</td>
            <td>创建时间</td>
            <td>创建人</td>
            <td>操作</td>
        </tr>
        </thead>
        <tbody id="dataBody">
        </tbody>
    </table>
    <div id="page"></div>
</div>

</body>
</html>