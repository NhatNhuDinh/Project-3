package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.enums.District;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.service.IBuildingService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;


@Component
public class BuildingConverter {


    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private BuildingRepository buildingRepository;

    //Entity -> response
    public BuildingSearchResponse toBuildingSearchResponse(BuildingEntity buildingEntity) {
        BuildingSearchResponse buildingSearchResponse = modelMapper.map(buildingEntity, BuildingSearchResponse.class);
        buildingSearchResponse.setAddress(buildingEntity.getStreet() + "," + buildingEntity.getWard() + "," + District.valueOf(buildingEntity.getDistrict()).getdistrictName());
        buildingSearchResponse.setRentArea(buildingEntity.getRentAreaEntityList().stream().map(rentArea -> String.valueOf(rentArea.getValue())).collect(Collectors.joining(",")));
        return buildingSearchResponse;
    }

    //Entity -> DTO
    public BuildingDTO toBuildingDTO(BuildingEntity buildingEntity) {
        BuildingDTO buildingDTO = modelMapper.map(buildingEntity, BuildingDTO.class);
        buildingDTO.setTypeCode(Arrays.stream(buildingEntity.getTypeCode().split(",")).collect(Collectors.toList()));
        buildingDTO.setRentArea(buildingEntity.getRentAreaEntityList().stream().map(rentArea -> String.valueOf(rentArea.getValue())).collect(Collectors.joining(",")));
        return buildingDTO;
    }

    //DTO -> Entity
    public BuildingEntity toBuildingEntity(BuildingDTO buildingDTO) {
        BuildingEntity buildingEntity = modelMapper.map(buildingDTO, BuildingEntity.class);
        String typeBuilding = buildingDTO.getTypeCode().stream().collect(Collectors.joining(","));
        List<RentAreaEntity> rentAreaEntityList = Arrays.stream(buildingDTO.getRentArea().split(","))
                .map(value -> {
                    RentAreaEntity rentAreaEntity = new RentAreaEntity();
                    rentAreaEntity.setValue(Long.parseLong(value));
                    rentAreaEntity.setBuildingEntity(buildingEntity);
                    return rentAreaEntity;
                }).collect(Collectors.toList());

        if(buildingDTO.getId() != null){
            BuildingEntity building = buildingRepository.findById(buildingDTO.getId())
                    .orElseThrow(() -> new RuntimeException("Building not found with ID: " + buildingDTO.getId()));
            List<UserEntity> userEntities = building.getUserEntityList();
            buildingEntity.setUserEntityList(userEntities);
        }

        buildingEntity.setTypeCode(typeBuilding);
        buildingEntity.setRentAreaEntityList(rentAreaEntityList);
        return buildingEntity;
    }


}
