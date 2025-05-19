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
                    <li class="active">Thông tin tòa nhà</li>
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
                        Thông tin tòa nhà
                        <small>
                            <i class="ace-icon fa fa-angle-double-right"></i>
                            overview &amp; stats
                        </small>
                    </h1>
                </div><!-- /.page-header -->

                <!-- table-to-search -->
                <div class="row">
                    <div class="col-xs-12 col-sm-12 widget-container-col">

                        <form:form class="form-horizontal" id="buildingInfo" method="POST" modelAttribute="buildingDTO" enctype="multipart/form-data">

                            <input type="hidden" value="${buildingDTO.id}" name="id">

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right" for="name"> Tên tòa nhà </label>
                                <div class="col-sm-9">
                                    <form:input path="name" class="form-control"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right" for="district"> Quận </label>
                                <div class="col-sm-9">
                                    <div id="district">
                                        <form:select path="district" class="chosen-select form-control" name="district">
                                            <form:option value=""> -- Chọn quận -- </form:option>
                                            <form:options items="${districts}"/>
                                        </form:select>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right" for="ward"> Phường </label>
                                <div class="col-sm-9">
                                    <form:input path="ward" class="form-control"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> Đường </label>

                                <div class="col-sm-9">
                                    <form:input path="street" class="form-control"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> Kết cấu </label>

                                <div class="col-sm-9">
                                    <form:input path="structure" class="form-control"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> Số tầng hầm </label>

                                <div class="col-sm-9">
                                    <form:input type="number" path="numberOfBasement" class="form-control"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> Diện tích sàn </label>

                                <div class="col-sm-9">
                                    <form:input type="number" path="floorArea" class="form-control"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> Hướng </label>

                                <div class="col-sm-9">
                                    <form:input path="direction" class="form-control"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> Hạng </label>

                                <div class="col-sm-9">
                                    <form:input type="number" path="level" class="form-control"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> Diện tích thuê </label>

                                <div class="col-sm-9">
                                    <form:input path="rentArea" class="form-control"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right" for="rentPrice"> Giá
                                    thuê </label>

                                <div class="col-sm-9">
                                    <form:input path="rentPrice" class="form-control"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> Mô tả giá
                                </label>

                                <div class="col-sm-9">
                                    <form:input path="rentPriceDescription" class="form-control"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> Phí dịch vụ </label>

                                <div class="col-sm-9">
                                    <form:input path="serviceFee" class="form-control"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> Phí ô tô </label>

                                <div class="col-sm-9">
                                    <form:input path="carFee" class="form-control"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> Phí mô tô </label>

                                <div class="col-sm-9">
                                    <form:input path="motoFee" class="form-control"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> Phí ngoài giờ </label>

                                <div class="col-sm-9">
                                    <form:input path="overtimeFee" class="form-control"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> Tiền điện </label>

                                <div class="col-sm-9">
                                    <form:input path="electricityFee" class="form-control"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> Tiền nước </label>

                                <div class="col-sm-9">
                                    <form:input path="waterFee" class="form-control"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> Đặt cọc </label>

                                <div class="col-sm-9">
                                    <form:input path="deposit" class="form-control"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> Thanh toán </label>

                                <div class="col-sm-9">
                                    <form:input path="payment" class="form-control"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> Thời hạn thuê </label>

                                <div class="col-sm-9">
                                    <form:input path="rentTime" class="form-control"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> Thời gian trang trí </label>

                                <div class="col-sm-9">
                                    <form:input path="decorationTime" class="form-control"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> Tên quản lí </label>

                                <div class="col-sm-9">
                                    <form:input path="managerName" class="form-control"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> Số điện thoại quản lí </label>

                                <div class="col-sm-9">
                                    <form:input path="managerPhone" class="form-control"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> Loại tòa nhà </label>

                                <div class="col-sm-9">
                                    <div class="control-group form-inline" id="typeCode">
                                        <div class="control-group form-inline">
                                            <form:checkboxes path="typeCode" items="${typeCodes}"/>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> Phí môi giới </label>

                                <div class="col-sm-9">
                                    <form:input path="brokerageFee" class="form-control"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> Ghi chú </label>

                                <div class="col-sm-9">
                                    <form:input path="note" class="form-control"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Hình đại diện</label>
                                <input class="col-sm-3 no-padding-right" type="file" id="uploadImage"/>
                                <div class="col-sm-9">
                                    <c:if test="${not empty buildingDTO.image}">
                                        <c:set var="imagePath" value="/repository${buildingDTO.image}"/>
                                        <img src="${imagePath}" id="viewImage" width="300px" height="300px"
                                             style="margin-top: 50px">
                                    </c:if>
                                    <c:if test="${empty buildingDTO.image}">
                                        <img src="/admin/image/default.png" id="viewImage" width="300px" height="300px">
                                    </c:if>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"></label>

                                <div class="col-sm-9">
                                    <div>
                                        <c:if test="${not empty buildingDTO.id}">
                                            <button class="btn btn-purple" title="Thêm tòa nhà" type="button"
                                                    id="btn-submit"> Sửa tòa nhà
                                            </button>
                                        </c:if>

                                        <c:if test="${empty buildingDTO.id}">
                                            <button class="btn btn-success" title="Thêm tòa nhà" type="button"
                                                    id="btn-submit"> Thêm tòa nhà
                                            </button>
                                        </c:if>


                                        <a href="/admin/building-list">
                                            <button class="btn btn-danger" title="Sửa tòa nhà" type="button"> Hủy
                                                thao tác
                                            </button>
                                        </a>

                                    </div>
                                </div>
                            </div>

                        </form:form>

                    </div>


                </div><!-- /.row -->


            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->


    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>
</div><!-- /.main-container -->


<script>

    var imageBase64 = '';
    var imageName = '';

    $('#btn-submit').click(function () {

        $('.error-message').remove();

        var buildingInfo = $('#buildingInfo').serializeArray();
        var buildingInfoJson = {};
        var typeCode = [];
        $.each(buildingInfo, function (i, it) {
            if (it.name != 'typeCode') {
                buildingInfoJson["" + it.name + ""] = it.value;
            } else {
                typeCode.push(it.value);
            }

            if ('' !== it.value && null != it.value) {
                buildingInfoJson['' + it.name + ''] = it.value;
            }

            if ('' !== imageBase64) {
                buildingInfoJson['imageBase64'] = imageBase64;
                buildingInfoJson['imageName'] = imageName;
            }
        });


        buildingInfoJson['typeCode'] = typeCode;
        console.log(buildingInfoJson);
        // saveBuilding(buildingInfoJson);

        let isValid = true;

        if (buildingInfoJson['name'] === '') {
            $('#name').after('<span class="error-message" style="color: red;"> Tên tòa nhà không được bỏ trống </span>');
            isValid = false;
        }
        if (buildingInfoJson['district'] === '') {
            $('#district').after('<span class="error-message" style="color: red;"> Quận không được bỏ trống </span>');
            isValid = false;
        }
        if (buildingInfoJson['ward'] === '') {
            $('#ward').after('<span class="error-message" style="color: red;"> Phường không được bỏ trống </span>');
            isValid = false;
        }
        if (buildingInfoJson['street'] === '') {
            $('#street').after('<span class="error-message" style="color: red;"> Đường không được bỏ trống </span>');
            isValid = false;
        }

        if (buildingInfoJson['rentPrice'] === '') {
            $('#rentPrice').after('<span class="error-message" style="color: red;"> Giá không được bỏ trống </span>');
            isValid = false;
        }
        if (buildingInfoJson['typeCode'].length === 0) {
            $('#typeCode').after('<span class="error-message" style="color: red;"> Loại tòa nhà không được bỏ trống </span>');
            isValid = false;
        }
        if (buildingInfoJson['rentArea'] === '') {
            $('#rentArea').after('<span class="error-message" style="color: red;"> Diện tích thuê không được bỏ trống </span>');
            isValid = false;
        }

        if (isValid) {
            if (buildingInfoJson['id'] === '') {
                saveBuilding(buildingInfoJson);
            } else {
                updateBuilding(buildingInfoJson);
            }
        } else {
            alert('Vui lòng nhập đầy đủ thông tin cần thiết!');
        }


        function saveBuilding(buildingInfoJson) {
            $.ajax({
                type: "POST",
                url: "/api/buildings",
                data: JSON.stringify(buildingInfoJson),
                dataType: "json",
                contentType: "application/json",
                success: function (response) {
                    alert(response.message);
                    window.location.href = "/admin/building-list";
                },
                error: function (response) {
                    var err = response.responseJSON.message;
                    $.each(response.responseJSON.data, function (i, it) {
                        err += '\n' + it;
                    })
                    alert(err)
                }

            });
        }

        function updateBuilding(buildingInfoJson) {
            $.ajax({
                type: "PUT",
                url: "/api/buildings",
                data: JSON.stringify(buildingInfoJson),
                dataType: "json",
                contentType: "application/json",
                success: function (response) {
                    alert(response.message);
                    window.location.href = "/admin/building-list";
                },
                error: function (response) {
                    var err = response.responseJSON.message;
                    $.each(response.responseJSON.data, function (i, it) {
                        err += '\n' + it;
                    })
                    alert(err)
                }

            });
        }




    });

    $('#uploadImage').change(function (event) {
        var reader = new FileReader();
        var file = $(this)[0].files[0];
        reader.onload = function(e){
            imageBase64 = e.target.result;
            imageName = file.name; // ten hinh khong dau, khoang cach. vd: a-b-c
        };
        reader.readAsDataURL(file);
        openImage(this, "viewImage");
    });

    function openImage(input, imageView) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#' +imageView).attr('src', reader.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }


</script>
</body>
</html>
