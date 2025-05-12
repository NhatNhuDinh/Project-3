package com.javaweb.model.dto;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Getter
@Setter
public class BuildingDTO extends AbstractDTO{
    @NotBlank(message = "Tên tòa nhà không được bỏ trống")
    private String name;
    @NotBlank(message = "Đường không được bỏ trống")
    private String street;
    @NotBlank(message = "Phường không được bỏ trống")
    private String ward;
    @NotBlank(message = "Quận không được bỏ trống")
    private String district;
    private Long numberOfBasement;
    private Long floorArea;
    private String level;
    @Size(min = 1, message = "Loại tòa nhà là bắt buộc")
    private List<String> typeCode;
    private String overtimeFee;
    private String electricityFee;
    private String waterFee;
    private String deposit;
    private String payment;
    private String rentTime;
    private String decorationTime;
    private String rentPriceDescription;
    private String carFee;
    private String motoFee;
    private String structure;
    private String direction;
    private String note;
    @Pattern(regexp = "^\\d+(?:,\\d+)*$", message = "Sai định dạng diện tích thuê! Định dạng chuẩn: 100,200,300")
    private String rentArea;
    private String managerName;
    private String managerPhone;
    @NotNull(message = "Giá cho thuê là bắt buộc")
    @Min(value = 5, message = "Giá cho thuê phải lớn hơn 5")
    @Pattern(regexp = "^[0-9]+$", message = "Giá cho thuê phải là một số hợp lệ")
    private String rentPrice;
    private String serviceFee;
    private String brokerageFee;
    private String image;
    private String imageBase64;
    private String imageName;

    private Map<String,String> buildingDTOs = new HashMap<>();

    public String getImageBase64() {
        if (imageBase64 != null) {
            return imageBase64.split(",")[1];
        }
        return null;
    }

}