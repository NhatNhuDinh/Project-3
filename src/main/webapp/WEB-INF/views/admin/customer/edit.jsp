<%--
  Created by IntelliJ IDEA.
  User: nhudi
  Date: 25/04/27
  Time: 11:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="/common/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Building</title>
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
                    <li class="active">Thông tin khách hàng</li>
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
                        Thông tin khách hàng
                        <small>
                            <i class="ace-icon fa fa-angle-double-right"></i>
                            overview &amp; stats
                        </small>
                    </h1>
                </div><!-- /.page-header -->

                <!-- table-to-search -->
                <div class="row">
                    <div class="col-xs-12 col-sm-12 widget-container-col">

                        <form:form class="form-horizontal" id="customerInfo" method="POST" modelAttribute="customerDTO"
                                   enctype="multipart/form-data">

                            <input type="hidden" value="${customerDTO.id}" name="id">

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right" for="name"> Tên khách
                                    hàng </label>
                                <div class="col-sm-9">
                                    <form:input path="name" class="form-control"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right" for="customerPhone"> Số điện
                                    thoại </label>
                                <div class="col-sm-9">
                                    <form:input path="customerPhone" class="form-control"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> Email </label>

                                <div class="col-sm-9">
                                    <form:input path="email" class="form-control"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> Tên công ty </label>

                                <div class="col-sm-9">
                                    <form:input path="companyName" class="form-control"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> Nhu cầu </label>

                                <div class="col-sm-9">
                                    <form:input path="demand" class="form-control"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right" for="district"> Trạng
                                    thái </label>
                                <div class="col-sm-9">
                                    <div id="district">
                                        <form:select path="status" class="chosen-select form-control" name="district">
                                            <form:option value=""> -- Chọn trạng thái -- </form:option>
                                            <form:options items="${statuses}"/>
                                        </form:select>
                                    </div>
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"></label>

                                <div class="col-sm-9">
                                    <div>
                                        <c:if test="${not empty customerDTO.id}">
                                            <button class="btn btn-purple" title="Thêm tòa nhà" type="button"
                                                    id="btn-submit"> Sửa khách hàng
                                            </button>
                                        </c:if>

                                        <c:if test="${empty customerDTO.id}">
                                            <button class="btn btn-success" title="Thêm tòa nhà" type="button"
                                                    id="btn-submit"> Thêm khách hàng
                                            </button>
                                        </c:if>


                                        <a href="/admin/customer-list">
                                            <button class="btn btn-danger" title="Sửa tòa nhà" type="button"> Hủy
                                                thao tác
                                            </button>
                                        </a>

                                    </div>
                                </div>
                            </div>

                        </form:form>

                    </div>
                    <c:if test="${not empty customerDTO.id}">
                        <div class="col-xs-12">


                            <div class="clearfix">
                                <div class="pull-right tableTools-container">
                                    <button class="btn btn-success"
                                            onclick="openAddTransactionModal(null, 'CSKH', ${customerDTO.id})">Thêm giao
                                        dịch
                                    </button>
                                </div>
                            </div>
                            <div class="table-header">
                                Chăm sóc khách hàng
                            </div>

                            <!-- div.table-responsive -->

                            <!-- div.dataTables_borderWrap -->
                            <div>
                                <div id="dynamic-table_wrapper" class="dataTables_wrapper form-inline no-footer">

                                    <table id="dynamic-table"
                                           class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable"
                                           role="grid" aria-describedby="dynamic-table_info">
                                        <thead>
                                        <tr role="row">

                                            <th tabindex="0" aria-controls="dynamic-table" rowspan="1"
                                                colspan="1">Ngày tạo
                                            </th>
                                            <th tabindex="0" rowspan="1"
                                                colspan="1">Người tạo
                                            </th>
                                            <th tabindex="0" rowspan="1"
                                                colspan="1">Ngày sửa
                                            </th>
                                            <th tabindex="0" rowspan="1"
                                                colspan="1">Người sửa

                                            </th>
                                            <th tabindex="0" rowspan="1"
                                                colspan="1">Chi tiết giao dịch
                                            </th>
                                            <th tabindex="0" rowspan="1"
                                                colspan="1">Thao tác
                                            </th>
                                        </tr>
                                        </thead>

                                        <tbody>

                                        <c:forEach items="${cskhList}" var="cskh">

                                            <tr role="row" class="odd">

                                                <td>
                                                        ${cskh.createdDate}
                                                </td>
                                                <td>${cskh.createdBy}</td>
                                                <td class="hidden-480">${cskh.modifiedDate}</td>
                                                <td>${cskh.modifiedBy}</td>

                                                <td class="hidden-480">
                                                    <span>${cskh.transactionDetail}</span>
                                                </td>

                                                <td>
                                                    <div class="btn-group">
                                                        <button class="btn btn-xs btn-success" type="button"
                                                                title="Giao tòa nhà"
                                                                id="btn-edit-transaction"
                                                                onclick="loadTransaction(${cskh.transactionId})">
                                                            <i class="ace-icon fa fa-pencil bigger-120"></i>
                                                        </button>

                                                        <security:authorize access="hasAnyRole('MANAGER')">
                                                            <button class="btn btn-xs btn-danger" type="button"
                                                                    title="Xóa giao dịch"
                                                                    onclick="deleteTransaction(${cskh.transactionId})">
                                                                <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                                            </button>
                                                        </security:authorize>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>

                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12" style="margin-top: 50px;">


                            <div class="clearfix">
                                <div class="pull-right tableTools-container">
                                    <button class="btn btn-success"
                                            onclick="openAddTransactionModal(null, 'DDX', ${customerDTO.id})">Thêm giao
                                        dịch
                                    </button>
                                </div>
                            </div>
                            <div class="table-header">
                                Dẫn đi xem
                            </div>

                            <!-- div.table-responsive -->

                            <!-- div.dataTables_borderWrap -->
                            <div>
                                <div id="dynamic-table_wrapper" class="dataTables_wrapper form-inline no-footer">

                                    <table id="dynamic-table"
                                           class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable"
                                           role="grid" aria-describedby="dynamic-table_info">
                                        <thead>
                                        <tr role="row">

                                            <th tabindex="0" aria-controls="dynamic-table" rowspan="1"
                                                colspan="1">Ngày tạo
                                            </th>
                                            <th tabindex="0" rowspan="1"
                                                colspan="1">Người tạo
                                            </th>
                                            <th tabindex="0" rowspan="1"
                                                colspan="1">Ngày sửa
                                            </th>
                                            <th tabindex="0" rowspan="1"
                                                colspan="1">Người sửa

                                            </th>
                                            <th tabindex="0" rowspan="1"
                                                colspan="1">Chi tiết giao dịch
                                            </th>
                                            <th tabindex="0" rowspan="1"
                                                colspan="1">Thao tác
                                            </th>
                                        </tr>
                                        </thead>

                                        <tbody>

                                        <c:forEach items="${ddxList}" var="ddx">

                                            <tr role="row" class="odd">

                                                <td>
                                                        ${ddx.createdDate}
                                                </td>
                                                <td>${ddx.createdBy}</td>
                                                <td class="hidden-480">${ddx.modifiedDate}</td>
                                                <td>${ddx.modifiedBy}</td>

                                                <td class="hidden-480">
                                                    <span>${ddx.transactionDetail}</span>
                                                </td>

                                                <td>
                                                    <div class="btn-group">
                                                        <button class="btn btn-xs btn-success" type="button"
                                                                title="Giao tòa nhà"
                                                                id="btn-edit-transaction"
                                                                onclick="loadTransaction(${ddx.transactionId})">
                                                            <i class="ace-icon fa fa-pencil bigger-120"></i>
                                                        </button>

                                                        <security:authorize access="hasAnyRole('MANAGER')">
                                                            <button class="btn btn-xs btn-danger" type="button"
                                                                    title="Xóa giao dịch"
                                                                    onclick="deleteTransaction(${ddx.transactionId})">
                                                                <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                                            </button>
                                                        </security:authorize>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>

                                </div>
                            </div>
                        </div>
                    </c:if>
                </div><!-- /.row -->


            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->


    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>


    <!-- Modal -->
    <div class="modal fade" id="addTransactionModal" tabindex="-1" role="dialog"
         aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Nhập thông tin giao dịch</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"
                            style="border: none; background: none;">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id="modal-body">
                    <div class="form-group">
                        <label for="transactionDetail">Chi tiết giao dịch</label>
                        <input name="transactionDetail" id="transactionDetail" type="text" class="form-control"/>
                    </div>
                    <input type="hidden" value="" id="transactionId">
                    <input type="hidden" value="" id="transactionCode">
                    <input type="hidden" value="" id="customerId">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                    <button type="button" class="btn btn-primary" id="btn-transaction">Xác nhận</button>
                </div>
            </div>
        </div>
    </div>
</div><!-- /.main-container -->


<script>

    function openAddTransactionModal(transactionId, code, customerId) {
        $('#addTransactionModal').modal();
        $('#transactionDetail').val('');
        $('#transactionId').val(transactionId);
        $('#transactionCode').val(code);
        $('#customerId').val(customerId);
        // loadStaffs(transactionId);
    }


    $('#btn-transaction').click(function (e) {
        e.preventDefault();

        var data = {};
        data['transactionId'] = $('#transactionId').val();
        data['transactionCode'] = $('#transactionCode').val();
        data['customerId'] = $('#customerId').val();
        data['transactionDetail'] = $('#transactionDetail').val();
        if (data['customerId'] == null) {
            alert('Không tìm thấy id khách hàng');
        } else if (data['transactionDetail'].trim() === '') {
            alert('Vui long nhập chi tiết giao dịch');

        } else {
            submitTransaction(data);
        }
    });

    function submitTransaction(data) {
        $.ajax({
            type: "POST",
            url: "/api/transactions",
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

    $('#btn-submit').click(function () {

        $('.error-message').remove();

        var customerInfo = $('#customerInfo').serializeArray();
        var customerInfoJson = {};
        $.each(customerInfo, function (i, it) {

            customerInfoJson['' + it.name + ''] = it.value;

        });

        console.log(customerInfoJson);
        // saveBuilding(customerInfoJson);

        let isValid = true;

        if (customerInfoJson['name'].trim() === '') {
            $('#name').after('<span class="error-message" style="color: red;"> Tên khách hàng không được bỏ trống </span>');
            isValid = false;
        }

        if (customerInfoJson['customerPhone'].trim() === '') {
            $('#customerPhone').after('<span class="error-message" style="color: red;"> Số điện thoại không được bỏ trống </span>');
            isValid = false;
        }

        if (customerInfoJson['status'].trim() === '') {
            $('#status').after('<span class="error-message" style="color: red;"> Trạng thái không được bỏ trống </span>');
            isValid = false;
        }

        if (isValid) {
            if (customerInfoJson['id'] === '') {
                saveCustomer(customerInfoJson);
            } else {
                updateCustomer(customerInfoJson);
            }
        } else {
            alert('Vui lòng nhập đầy đủ thông tin cần thiết!');
        }

        function saveCustomer(customerInfoJson) {
            $.ajax({
                type: "POST",
                url: "/api/customers",
                data: JSON.stringify(customerInfoJson),
                dataType: "json",
                contentType: "application/json",
                success: function (response) {
                    alert(response.message);
                    window.location.href = "/admin/customer-list";
                },
                error: function (response) {
                    alert(response.responseJSON.data)
                }

            });
        }

        function updateCustomer(customerInfoJson) {
            $.ajax({
                type: "PUT",
                url: "/api/customers",
                data: JSON.stringify(customerInfoJson),
                dataType: "json",
                contentType: "application/json",
                success: function (response) {
                    alert(response.message);
                    window.location.href = "/admin/customer-list";
                },
                error: function (response) {
                    alert(response.responseJSON.data)
                }

            });
        }


    });

    function loadTransaction(transactionId) {
        $('#addTransactionModal').modal();
        $.ajax({
            type: "GET",
            url: "/api/transactions/" + transactionId,
            dataType: "json",
            success: function (response) {
                var data = response.data;
                $('#transactionDetail').val(data.transactionDetail);
                $('#transactionId').val(data.transactionId);
                $('#transactionCode').val(data.transactionCode);
                $('#customerId').val(data.customerId);
            },
            error: function (response) {
                console.log('Failed');
            }
        });
    }

    function deleteTransaction(id) {
        $.ajax({
            type: "DELETE",
            url: "/api/transactions/" + id,
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


</script>
</body>
</html>
