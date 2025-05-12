package com.javaweb.converter;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.utils.MapUtils;
import org.springframework.stereotype.Component;

@Component
public class BuildingSearchBuilderConverter {

    public BuildingSearchBuilder toBuildingSearchBuilder(BuildingSearchRequest buildingSearchRequest) {
        return BuildingSearchBuilder.builder()
                .name(MapUtils.getObject(buildingSearchRequest.getName(), String.class))
                .district(MapUtils.getObject(buildingSearchRequest.getDistrict(), String.class))
                .direction(MapUtils.getObject(buildingSearchRequest.getDirection(), String.class))
                .floorArea(MapUtils.getObject(buildingSearchRequest.getFloorArea(), Long.class))
                .level(MapUtils.getObject(buildingSearchRequest.getLevel(), String.class))
                .managerName(MapUtils.getObject(buildingSearchRequest.getManagerName(), String.class))
                .managerPhone(MapUtils.getObject(buildingSearchRequest.getManagerPhone(), String.class))
                .numberOfBasement(MapUtils.getObject(buildingSearchRequest.getNumberOfBasement(), Long.class))
                .rentAreaFrom(MapUtils.getObject(buildingSearchRequest.getAreaFrom(), Long.class))
                .rentAreaTo(MapUtils.getObject(buildingSearchRequest.getAreaTo(), Long.class))
                .rentPriceFrom(MapUtils.getObject(buildingSearchRequest.getRentPriceFrom(), Long.class))
                .rentPriceTo(MapUtils.getObject(buildingSearchRequest.getRentPriceTo(), Long.class))
                .staffId(MapUtils.getObject(buildingSearchRequest.getStaffId(), Long.class))
                .ward(MapUtils.getObject(buildingSearchRequest.getWard(), String.class))
                .typeCode(buildingSearchRequest.getTypeCode())
                .street(MapUtils.getObject(buildingSearchRequest.getStreet(), String.class))
                .build();
    }
}
