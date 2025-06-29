package com.javaweb.model.request;

import com.javaweb.model.dto.AbstractDTO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CustomerSearchRequest extends AbstractDTO {
    private String name;
    private Long managementStaff;
    private String customerPhone;
    private String email;
    private String status;
}

