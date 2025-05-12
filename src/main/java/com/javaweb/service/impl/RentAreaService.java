package com.javaweb.service.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.service.IRentAreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class RentAreaService implements IRentAreaService {

    @Autowired
    public RentAreaRepository rentAreaRepository;

    @Override
    public void saveAll(BuildingEntity buildingEntity, String rentAreaValues) {
        List<RentAreaEntity> rentAreaEntityList = Arrays.stream(rentAreaValues.split(","))
                .map(value -> {
                    RentAreaEntity rentAreaEntity = new RentAreaEntity();
                    rentAreaEntity.setValue(Long.parseLong(value));
                    rentAreaEntity.setBuildingEntity(buildingEntity);
                    return rentAreaEntity;
        }).collect(Collectors.toList());

        rentAreaRepository.saveAll(rentAreaEntityList);
    }

    @Override
    public void deleteAllByBuildingId(Long buildingId) {
        rentAreaRepository.deleteByBuildingEntity_Id(buildingId);
    }
}
