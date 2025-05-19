package com.javaweb.service.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.IAssigmentBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;
import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class BuildingAssigmentService implements IAssigmentBuildingService {

    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private UserRepository userRepository;


    @Override
    public void assignStaff(AssignmentBuildingDTO assignmentBuildingDTO) {
        Long buildingId = assignmentBuildingDTO.getBuildingId();
        List<Long> staffIds = assignmentBuildingDTO.getStaffs();

        // xoa het trong bang trung gian
        BuildingEntity building = buildingRepository.findById(buildingId).orElseThrow(EntityNotFoundException::new);
        building.getUserEntityList().clear();

        // set lai list staff cho building
        if(!staffIds.isEmpty()){
            List<UserEntity> staffs = userRepository.findByIdIn(staffIds);
            building.getUserEntityList().addAll(staffs); // su dung setEntityList cung nhu nhau nhung cach nay hieu suat cao hon
        }

        // dong bo lai du lieu
        buildingRepository.save(building);

    }
}
