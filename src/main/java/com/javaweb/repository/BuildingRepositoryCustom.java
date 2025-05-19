package com.javaweb.repository;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.request.BuildingSearchRequest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface BuildingRepositoryCustom {
//    List<BuildingEntity> getAll(BuildingSearchBuilder buildingSearchBuilder);

    List<BuildingEntity> getAll(BuildingSearchBuilder buildingSearchBuilder, Pageable pageable);
    int countTotalSearch(BuildingSearchBuilder buildingSearchBuilder);
}
