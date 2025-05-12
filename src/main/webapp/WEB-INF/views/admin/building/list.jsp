
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
    <title>Quản lí tòa nhà</title>

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
                    <li class="active">Danh sách tòa nhà</li>
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
                        Danh sách tòa nhà
                        <small>
                            <i class="ace-icon fa fa-angle-double-right"></i>
                            overview &amp; stats
                        </small>
                    </h1>
                </div><!-- /.page-header -->

                <!-- table-to-search -->
                <form:form id="search-data-form" method="GET" action="/admin/building-list"
                           modelAttribute="buildingSearchRequest">
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
                                            <label class="control-label">Tên tòa nhà</label>
                                            <form:input path="name" class="form-control"/>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label class="control-label">Diện tích sàn</label>
                                            <form:input path="floorArea" class="form-control" type="number"/>
                                        </div>
                                        <div class="form-group col-sm-2">
                                            <label>Chọn quận</label>
                                            <br/>
                                            <form:select path="district" class="chosen-select form-control">
                                                <form:option value=""> -- Chọn quận -- </form:option>
                                                <form:options items="${districts}"/>
                                            </form:select>


                                        </div>
                                        <div class="form-group col-sm-5">
                                            <label class="control-label">Phường</label>
                                            <form:input path="ward" class="form-control"/>
                                        </div>
                                        <div class="form-group col-sm-5">
                                            <label class="control-label">Đường</label>
                                            <form:input path="street" class="form-control"/>
                                        </div>
                                        <div class="form-group col-sm-4">
                                            <label class="control-label">Số tầng hầm</label>
                                            <form:input type="number" path="numberOfBasement" class="form-control"/>
                                        </div>
                                        <div class="form-group col-sm-4">
                                            <label class="control-label">Hướng</label>
                                            <form:input path="direction" class="form-control"/>
                                        </div>
                                        <div class="form-group col-sm-4">
                                            <label class="control-label">Hạng</label>
                                            <form:input type="number" path="level" class="form-control"/>
                                        </div>
                                        <div class="form-group col-sm-3">
                                            <label class="control-label">Diện tích từ</label>
                                            <form:input type="number" path="areaFrom" class="form-control"/>
                                        </div>
                                        <div class="form-group col-sm-3">
                                            <label class="control-label">Diện tích đến</label>
                                            <form:input type="number" path="areaTo" class="form-control"/>
                                        </div>
                                        <div class="form-group col-sm-3">
                                            <label class="control-label">Giá thuê từ</label>
                                            <form:input type="number" path="rentPriceFrom" class="form-control"/>
                                        </div>
                                        <div class="form-group col-sm-3">
                                            <label class="control-label">Giá thuê đến</label>
                                            <form:input type="number" path="rentPriceTo" class="form-control"/>
                                        </div>
                                        <div class="form-group col-sm-5">
                                            <label class="control-label">Tên quản lí</label>
                                            <form:input path="managerName" class="form-control"/>
                                        </div>
                                        <div class="form-group col-sm-5">
                                            <label class="control-label">Số điện thoại quản
                                                lí</label>
                                            <form:input path="managerPhone" class="form-control"/>
                                        </div>
                                        <div class="form-group col-sm-2">
                                            <label>Chọn nhân viên</label>
                                            <br/>

                                            <form:select path="staffId" class="chosen-select form-control">
                                                <form:option value=""> -- Chọn nhân viên -- </form:option>
                                                <form:options items="${staff}"/>
                                            </form:select>
                                        </div>

                                        <div class="col-xs-12 col-sm-12">
                                            <div class="control-group form-inline">
                                                <form:checkboxes path="typeCode" items="${typeCodes}"/>
                                            </div>
                                        </div>

                                        <div class="col-xs-12 col-sm-12" style="margin-top: 15px;">
                                            <button class="btn btn-primary" id="search-button">
                                                <i class="ace-icon fa fa-search nav-search-icon"> Tìm kiếm </i>
                                            </button>
                                        </div>


                                    </div>
                                </div>

                            </div>

                            <div class="text-right" style="margin-top: 10px;">
                                <a href="/admin/building-edit">
                                    <button class="btn btn-success" title="Thêm tòa nhà" type="button">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                             fill="currentColor" class="bi bi-building-add" viewBox="0 0 16 16">
                                            <path
                                                    d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0"/>
                                            <path
                                                    d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                            <path
                                                    d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                        </svg>
                                    </button>
                                </a>

                                <button class="btn btn-danger" title="Xóa tòa nhà" id="btn-delete-buildings">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                         class="bi bi-building-dash" viewBox="0 0 16 16">
                                        <path
                                                d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1"/>
                                        <path
                                                d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                        <path
                                                d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                    </svg>
                                </button>
                            </div>

                            <div class="col-xs-12" style="margin-top: 60px;">
                                <table id="simple-table" class="table table-striped table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th class="center">
                                            <label class="pos-rel">
                                                Chọn
                                            </label>
                                        </th>
                                        <th>Tên tòa nhà</th>
                                        <th>Địa chỉ</th>
                                        <th>Số tầng hầm</th>
                                        <th>Tên quản lí</th>
                                        <th>SĐT quản lí</th>
                                        <th>Diện tích sàn</th>
                                        <th>Diện tích thuê</th>
                                        <th>Diện tích trống</th>
                                        <th>Giá thuê</th>
                                        <th>Phí dịch vụ</th>
                                        <th>Phí môi giới</th>
                                        <th>Thao tác</th>
                                    </tr>
                                    </thead>

                                    <tbody id="building-list">
                                    <c:forEach var="b" items="${buildings}">

                                        <tr>
                                            <td class="center">
                                                <label class="pos-rel">
                                                    <input type="checkbox" class="ace" value="${b.id}"/>
                                                    <span class="lbl"></span>
                                                </label>
                                            </td>


                                            <td>${b.name}</td>
                                            <td>${b.address}</td>
                                            <td>${b.numberOfBasement}</td>
                                            <td>${b.managerName}</td>
                                            <td>${b.managerPhone}</td>
                                            <td>${b.floorArea}</td>
                                            <td>${b.rentArea}</td>
                                            <td>${b.emptyArea}</td>
                                            <td>${b.rentPrice}</td>
                                            <td>${b.serviceFee}</td>
                                            <td>${b.brokerageFee}</td>


                                            <td>
                                                <div class="hidden-sm hidden-xs btn-group">
                                                    <button class="btn btn-xs btn-success" type="button" title="Giao tòa nhà"
                                                            onclick="openAssignmentBuildingModel(${b.id})">
                                                        <i class="ace-icon glyphicon glyphicon-user"></i>
                                                    </button>

                                                    <a href="/admin/building-edit-${b.id}" class="btn btn-xs btn-info" title="Sửa tòa nhà">
                                                        <i class="ace-icon fa fa-pencil bigger-120"></i>
                                                    </a>


                                                    <button class="btn btn-xs btn-danger" type="button" title="Xóa tòa nhà"
                                                            onclick="deleteBuilding(${b.id})">
                                                        <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                                    </button>

                                                </div>


                                            </td>
                                        </tr>

                                    </c:forEach>


                                    </tbody>
                                </table>
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
                    <input type="hidden" value="" id="buildingId">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Hủy thao tác</button>
                    <button type="button" class="btn btn-success" id="btn-assign-building">Giao tòa nhà</button>
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


    function openAssignmentBuildingModel(buildingId) {

        $('#assignmentBuildingModal').modal();
        $('#buildingId').val(buildingId);
        loadStaffs(buildingId)
    }

    $('#btn-assign-building').click(function (e) {
        e.preventDefault();
        var staffIds = $('#staff-list').find('input[type=checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        var data = {};
        data['staffs'] = staffIds;
        data['buildingId'] = $('#buildingId').val();
        if (data['buildingId'] == null) {
            alert('Không tìm thấy id tòa nhà');
        } else {
            assignBuilding(data);
        }
    });

    $('#btn-delete-buildings').click(function (e) {
        e.preventDefault();
        var buildingIds = $('#building-list').find('input[type=checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        if (buildingIds.length === 0) {
            alert('Vui lòng chọn tòa nhà để xóa!');
        } else {
            deleteBuildings(buildingIds);
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
            url: "/api/buildings/" + ids,
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
            url: "/api/buildings/assignments",
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

    function loadStaffs(buildingId) {
        $.ajax({
            type: "GET",
            url: "/api/buildings/" + buildingId + "/staffs",
            dataType: "json",
            success: function (response) {
                var row = '';
                $.each(response.data, function (index, item) {
                    row += '<tr class="center">'
                    row += '<td className="center">'
                    row += '<input type="checkbox" className="ace" value='+ item.staffId + " " + item.checked +'/>'
                    row += '<span className="lbl"></span>'
                    row += '</td>'
                    row += '<td>'+ item.fullName +'</td>'
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
