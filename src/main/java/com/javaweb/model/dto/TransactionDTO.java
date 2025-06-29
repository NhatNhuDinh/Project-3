package com.javaweb.model.dto;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Getter
@Setter
public class TransactionDTO extends AbstractDTO{

    private Long transactionId;

    @NotBlank(message = "Code không được để trống")
    private String transactionCode;

    private String transactionDetail;

    @NotNull(message = "Customer id là bắt buộc")
    private Long customerId;
}
