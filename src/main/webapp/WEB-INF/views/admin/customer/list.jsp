<%--
  Created by IntelliJ IDEA.
  User: nhudi
  Date: 25/04/27
  Time: 3:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="/common/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quản lí khách hàng</title>

    <style>
        .form-group {
            display: block !important;
            align-items: unset !important;
        }
    </style>
</head>
<body>
<div class="main-content" id="main-container">

    <div class="main-content">
        <div class="main-content-inner">
            <div class="breadcrumbs" id="breadcrumbs">

                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        <a href="#">Trang chủ</a>
                    </li>
                    <li class="active">Danh sách khách hàng</li>
                </ul><!-- /.breadcrumb -->


            </div>

            <div class="page-content">
                <div class="ace-settings-container" id="ace-settings-container">

                    <div class="ace-settings-box clearfix" id="ace-settings-box">
                        <div class="pull-left width-50">
                            <div class="ace-settings-item">
                                <div class="pull-left">
                                    <select id="skin-colorpicker" class="hide">
                                        <option data-skin="no-skin" value="#438EB9">#438EB9</option>
                                        <option data-skin="skin-1" value="#222A2D">#222A2D</option>
                                        <option data-skin="skin-2" value="#C6487E">#C6487E</option>
                                        <option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
                                    </select>
                                </div>
                                <span>&nbsp; Choose Skin</span>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-navbar"/>
                                <label class="lbl" for="ace-settings-navbar"> Fixed Navbar</label>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-sidebar"/>
                                <label class="lbl" for="ace-settings-sidebar"> Fixed Sidebar</label>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-breadcrumbs"/>
                                <label class="lbl" for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl"/>
                                <label class="lbl" for="ace-settings-rtl"> Right To Left (rtl)</label>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-add-container"/>
                                <label class="lbl" for="ace-settings-add-container">
                                    Inside
                                    <b>.container</b>
                                </label>
                            </div>
                        </div><!-- /.pull-left -->

                        <div class="pull-left width-50">
                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-hover"/>
                                <label class="lbl" for="ace-settings-hover"> Submenu on Hover</label>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-compact"/>
                                <label class="lbl" for="ace-settings-compact"> Compact Sidebar</label>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-highlight"/>
                                <label class="lbl" for="ace-settings-highlight"> Alt. Active Item</label>
                            </div>
                        </div><!-- /.pull-left -->
                    </div><!-- /.ace-settings-box -->

                </div><!-- /.ace-settings-container -->

                <div class="page-header">
                    <h1>
                        Danh sách khách hàng
                        <small>
                            <i class="ace-icon fa fa-angle-double-right"></i>
                            overview &amp; stats
                        </small>
                    </h1>
                </div><!-- /.page-header -->

                <!-- table-to-search -->
                <form:form id="search-data-form" method="GET" action="/admin/customer-list"
                           modelAttribute="customerDTO">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 widget-container-col">
                            <div class="widget-box">
                                <div class="widget-header">
                                    <h5 class="widget-title">Tìm kiếm</h5>

                                    <div class="widget-toolbar">

                                        <a href="#" data-action="reload">
                                            <i class="ace-icon fa fa-refresh"></i>
                                        </a>

                                        <a href="#" data-action="collapse">
                                            <i class="ace-icon fa fa-chevron-up"></i>
                                        </a>

                                        <a href="#" data-action="close">
                                            <i class="ace-icon fa fa-times"></i>
                                        </a>
                                    </div>
                                </div>
                                <div class="widget-body">
                                    <div class="widget-main row">

                                        <div class="form-group col-sm-6">
                                            <label class="control-label">Tên khách hàng</label>
                                            <form:input path="name" class="form-control"/>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label class="control-label">Di động </label>
                                            <form:input path="customerPhone" class="form-control" type="number"/>
                                        </div>

                                        <div class="form-group col-sm-5">
                                            <label class="control-label">Email</label>
                                            <form:input path="email" class="form-control"/>
                                        </div>

                                        <div class="form-group col-sm-2">
                                            <label>Trạng thái</label>
                                            <br/>
                                            <form:select path="status" class="chosen-select form-control">
                                                <form:option value=""> -- Chọn trạng thái -- </form:option>
                                                <form:options items="${statuses}"/>
                                            </form:select>

                                        </div>
                                        <security:authorize access="hasAnyRole('MANAGER')">
                                            <div class="form-group col-sm-2">
                                                <label>Chọn nhân viên</label>
                                                <br/>

                                                <form:select path="managementStaff" class="chosen-select form-control">
                                                    <form:option value=""> -- Chọn nhân viên -- </form:option>
                                                    <form:options items="${staff}"/>
                                                </form:select>

                                            </div>
                                        </security:authorize>
                                        <div class="col-xs-12 col-sm-12" style="margin-top: 15px;">
                                            <button class="btn btn-primary" id="search-button">
                                                <i class="ace-icon fa fa-search nav-search-icon"> Tìm kiếm </i>
                                            </button>
                                        </div>


                                    </div>
                                </div>

                            </div>

                            <div class="text-right" style="margin-top: 10px;">
                                <a href="/admin/customer-edit">
                                    <button class="btn btn-success" title="Thêm tòa nhà" type="button">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                             fill="currentColor" class="bi bi-person-fill-add" viewBox="0 0 16 16">
                                            <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0m-2-6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
                                            <path d="M2 13c0 1 1 1 1 1h5.256A4.5 4.5 0 0 1 8 12.5a4.5 4.5 0 0 1 1.544-3.393Q8.844 9.002 8 9c-5 0-6 3-6 4"/>
                                        </svg>
                                    </button>
                                </a>
                                <security:authorize access="hasAnyRole('MANAGER')">
                                <button class="btn btn-danger" title="Xóa tòa nhà" id="btn-delete-buildings">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                         class="bi bi-person-fill-dash" viewBox="0 0 16 16">
                                        <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1m0-7a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
                                        <path d="M2 13c0 1 1 1 1 1h5.256A4.5 4.5 0 0 1 8 12.5a4.5 4.5 0 0 1 1.544-3.393Q8.844 9.002 8 9c-5 0-6 3-6 4"/>
                                    </svg>
                                </button>
                                </security:authorize>
                            </div>

                            <div class="col-xs-12" style="margin-top: 60px;">
                                <display:table name="${customerSearchResponse}"
                                               requestURI="/admin/customer-list"
                                               size="${totalItems}"
                                               pagesize="${pageSize}"
                                               class="table table-striped table-bordered table-hover"
                                               partialList="true"
                                               id="tableList"
                                               export="external"
                                               sort="list"
                                               cellpadding="0"
                                               cellspacing="0">

                                    <display:column title="Chọn" media="html">
                                        <input type="checkbox" class="ace" value="${tableList.id}"/>
                                        <span class="lbl"></span>
                                    </display:column>

                                    <display:column property="name" title="Tên khách hàng"/>
                                    <display:column property="customerPhone" title="Di động"/>
                                    <display:column property="email" title="Email"/>
                                    <display:column property="demand" title="Nhu cầu"/>
                                    <display:column property="createdBy" title="Người thêm"/>
                                    <display:column property="createdDate" title="Ngày thêm"/>
                                    <display:column property="status" title="Tình trạng"/>

                                    <display:column title="Thao tác" media="html">
                                        <div class="btn-group">
                                            <security:authorize access="hasAnyRole('MANAGER')">
                                                <button class="btn btn-xs btn-success" type="button"
                                                        title="Giao khách hàng"
                                                        onclick="openAssignmentBuildingModel(${tableList.id})">
                                                    <i class="ace-icon glyphicon glyphicon-user"></i>
                                                </button>
                                            </security:authorize>
                                            <a href="/admin/customer-edit-${tableList.id}"
                                               class="btn btn-xs btn-info"
                                               title="Sửa khách hàng">
                                                <i class="ace-icon fa fa-pencil bigger-120"></i>
                                            </a>
                                            <security:authorize access="hasAnyRole('MANAGER')">
                                                <button class="btn btn-xs btn-danger" type="button"
                                                        title="Xóa tòa nhà"
                                                        onclick="deleteBuilding(${tableList.id})">
                                                    <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                                </button>
                                            </security:authorize>
                                        </div>
                                    </display:column>

                                </display:table>
                            </div><!-- /.span -->
                        </div>

                    </div>
                    <!-- /.row -->
                </form:form>


            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->


    <!-- Modal -->
    <div class="modal fade" id="assignmentBuildingModal" tabindex="-1" role="dialog"
         aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Danh sách nhân viên</h5>
                </div>
                <div class="modal-body">
                    <table id="simple-table-modal" class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th class="center">
                                <label class="pos-rel">
                                    Chọn
                                </label>
                            </th>
                            <th class="center">Tên nhân viên</th>
                        </tr>
                        </thead>

                        <tbody id="staff-list">

                        </tbody>
                    </table>
                    <input type="hidden" value="" id="customerId">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Hủy thao tác</button>
                    <button type="button" class="btn btn-success" id="btn-assign-building">Giao khách hàng</button>
                </div>
            </div>
        </div>
    </div>


</div><!-- /.main-container -->

<!--call modal  -->
<script>

    $('#search-button').click(function (e) {
        e.preventDefault();

        $('#search-data-form').submit();
    })


    function openAssignmentBuildingModel(customerId) {

        $('#assignmentBuildingModal').modal();
        $('#customerId').val(customerId);
        loadStaffs(customerId)
    }

    $('#btn-assign-building').click(function (e) {
        e.preventDefault();
        var staffIds = $('#staff-list').find('input[type=checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        var data = {};
        data['staffs'] = staffIds;
        data['customerId'] = $('#customerId').val();
        if (data['customerId'] == null) {
            alert('Không tìm thấy id khách hàng');
        } else {
            assignBuilding(data);
        }
    });

    $('#btn-delete-buildings').click(function (e) {
        e.preventDefault();
        var customerIds = $('#tableList').find('input[type=checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        if (customerIds.length === 0) {
            alert('Vui lòng chọn tòa nhà để xóa!');
        } else {
            deleteBuildings(customerIds);
        }
    });


    function deleteBuilding(id) {
        if (id == null) {
            alert("Không tìm thấy ID");
        } else {
            deleteBuildings(id);
        }
    }

    function deleteBuildings(ids) {
        $.ajax({
            type: "DELETE",
            url: "/api/customers/" + ids,
            // data: JSON.stringify(buildingInfoJson),
            dataType: "json",
            // contentType: "application/json",
            success: function (response) {
                alert(response.message)
                location.reload();
            },
            error: function (response) {
                console.log('Failed');
            }

        });
    }

    function assignBuilding(data) {
        $.ajax({
            type: "POST",
            url: "/api/customer-assignments",
            data: JSON.stringify(data),
            dataType: "json",
            contentType: "application/json",
            success: function (response) {
                alert(response.message)
                location.reload();
            },
            error: function (response) {
                console.log('Failed');
            }

        });
    }

    function loadStaffs(customerId) {
        $.ajax({
            type: "GET",
            url: "/api/customers/" + customerId + "/staffs",
            dataType: "json",
            success: function (response) {
                var row = '';
                $.each(response.data, function (index, item) {
                    row += '<tr class="center">'
                    row += '<td className="center">'
                    row += '<input type="checkbox" className="ace" value=' + item.staffId + " " + item.checked + '/>'
                    row += '<span className="lbl"></span>'
                    row += '</td>'
                    row += '<td>' + item.fullName + '</td>'
                    row += '</tr>'
                })
                $('#staff-list').html(row)
            },
            error: function (response) {
                console.log('Failed');
            }

        });
    }


</script>
</body>
</html>
