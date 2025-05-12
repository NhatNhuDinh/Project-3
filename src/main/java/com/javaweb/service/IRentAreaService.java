package com.javaweb.service;

import com.javaweb.entity.BuildingEntity;

public interface IRentAreaService {
    void saveAll(BuildingEntity buildingEntity, String rentAreaValues);
    void deleteAllByBuildingId(Long buildingId);
}
