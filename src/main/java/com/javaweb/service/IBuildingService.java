package com.javaweb.service;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.StaffResponseDTO;

import java.util.List;

public interface IBuildingService {
    List<BuildingSearchResponse> findAll(BuildingSearchRequest buildingSearchRequest);

    BuildingDTO findById(Long id);

    BuildingEntity create(BuildingDTO buildingDTO);

    BuildingEntity update(BuildingDTO buildingDTO);

    void deleteAll(String ids);

    List<StaffResponseDTO> staffList(Long buildingId);


}
