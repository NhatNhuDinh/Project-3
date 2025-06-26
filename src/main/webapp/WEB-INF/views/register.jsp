<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<html>
<head>
    <title>Đăng kí</title>

    <link href="web/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="web/css/small-business.css" rel="stylesheet" type="text/css">
    <style>
        .btn-custom-register {
            background: linear-gradient(90deg, #43e97b 0%, #38f9d7 100%);
            color: #fff !important;
            border: none;
            border-radius: 30px;
            font-weight: 600;
            font-size: 1.1rem;
            padding: 12px 40px;
            box-shadow: 0 4px 16px rgba(52, 191, 118, 0.15);
            transition: all 0.25s cubic-bezier(.4, 0, .2, 1);
            letter-spacing: 1px;
            outline: none;
            margin: 24px 0 24px 0;
        }

        .btn-custom-register:hover, .btn-custom-register:focus {
            background: linear-gradient(90deg, #38f9d7 0%, #43e97b 100%);
            color: #fff !important;
            box-shadow: 0 8px 24px rgba(52, 191, 118, 0.25);
            transform: translateY(-2px) scale(1.04);
            text-decoration: none;
        }
    </style>
</head>
<body style="background-color: #2c7659">
<section class="vh-100 gradient-custom form-register">
    <div class="container">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                <div class="card text-white" style="border-radius: 1rem; background-color: #35bf76;">
                    <div class="card-body p-2 px-5 text-center">
                        <div class="md-5 md-4 mt-4 pb-2">
                            <h2 class="fw-bold mb-2 text-uppercase">Create an account</h2>
                            <p class="text-white-50 mb-2">Please enter your Information</p>
                            <form:form method="post" action="/register" modelAttribute="userRegisterDTO"
                                       class="form-register">
                                <div class="form-outline form-white mb-2 text-left">
                                    <label class="form-label" for="fullName">Full Name</label>
                                    <form:input class="form-control form-control-lg" path="fullName"/>
                                    <form:errors path="fullName" cssClass="text-danger small" element="p"/>

                                </div>

                                <div class="form-outline form-white mb-2 text-left">
                                    <label class="form-label" for="userName">Username</label>
                                    <form:input path="userName" class="form-control form-control-lg"/>
                                    <form:errors path="userName" cssClass="text-danger small" element="p"/>
                                    <c:if test="${not empty userNameError}">
                                        <p style="color:red">${userNameError}</p>
                                    </c:if>
                                </div>

                                <div class="form-outline form-white mb-2 text-left">
                                    <label class="form-label" for="password">Password</label>
                                    <form:input path="password" type="password" class="form-control form-control-lg"/>
                                    <form:errors path="password" cssClass="text-danger small" element="p"/>
                                </div>

                                <div class="form-outline form-white mb-2 text-left">
                                    <label class="form-label" for="confirmPassword">Confirm Password</label>
                                    <form:input path="confirmPassword" type="password" id="confirmPassword"
                                                class="form-control form-control-lg"/>
                                    <form:errors path="confirmPassword" cssClass="text-danger small" element="p"/>
                                    <c:if test="${not empty confirmPasswordError}">
                                        <p style="color:red">${confirmPasswordError}</p>
                                    </c:if>
                                </div>

                                <button class="btn btn-custom-register" type="submit">Register</button>


                                <p class="text-center text-muted mt-2 mb-0">Have already an account? <a href="/login"
                                                                                                        class="fw-bold text-body"><u
                                        style="color: white ;">Login here</u></a></p>

                            </form:form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
