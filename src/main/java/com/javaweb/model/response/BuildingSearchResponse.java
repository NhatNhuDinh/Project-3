package com.javaweb.model.response;


import com.javaweb.model.dto.AbstractDTO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BuildingSearchResponse extends AbstractDTO {
	private Long id;
	private String name;
	private String address;
	private Long numberOfBasement;
	private String managerName;
	private String managerPhone;
	private Long floorArea;
	private String rentArea;
    private String emptyArea;
    private Long rentPrice;
    private String serviceFee;
    private Double brokerageFee;


}
