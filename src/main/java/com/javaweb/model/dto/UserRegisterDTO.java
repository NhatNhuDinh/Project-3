package com.javaweb.model.dto;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;

@Getter
@Setter
public class UserRegisterDTO extends AbstractDTO{

    @NotBlank(message = "Họ và tên không được bỏ trống")
    private String fullName;

    @NotBlank(message = "Username không được bỏ trống")
    private String userName;

    @NotBlank(message = "Mật khẩu không được bỏ trống")
    private String password;

    @NotBlank(message = "Xác nhận mật khẩu không được bỏ trống")
    private String confirmPassword;

}
