package com.javaweb.model.response;

import com.javaweb.model.dto.AbstractDTO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CustomerSearchResponse extends AbstractDTO {
    private String name;
    private Long managementStaff;
    private String customerPhone;
    private String email;
    private String demand;
    private String status;
    private String companyName;
}
