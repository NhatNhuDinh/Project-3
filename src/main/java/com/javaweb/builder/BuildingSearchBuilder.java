package com.javaweb.builder;

import lombok.Builder;
import lombok.Getter;

import java.util.List;

@Getter
@Builder
public class BuildingSearchBuilder {
	private String name;
	private Long floorArea;
	private String district;
	private String ward;
	private String street;
	private Long numberOfBasement;
	private String direction;
	private String level;
	private Long rentAreaFrom;
	private Long rentAreaTo;
	private Long rentPriceFrom;
	private Long rentPriceTo;
	private String managerName;
	private String managerPhone;
	private Long staffId;
	private List<String> typeCode;

}
