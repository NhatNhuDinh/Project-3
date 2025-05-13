package com.javaweb.service.impl;

import com.javaweb.entity.AssignmentBuildingEntity;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.repository.AssignmentBuildingRepository;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.IAssigmentBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;
import javax.transaction.Transactional;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Service
@Transactional
public class BuildingAssigmentService implements IAssigmentBuildingService {

    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private AssignmentBuildingRepository assignmentBuildingRepository;

    @Override
    public void assignStaff(AssignmentBuildingDTO assignmentBuildingDTO) {
        Long buildingId = assignmentBuildingDTO.getBuildingId();
        List<Long> staffIds = assignmentBuildingDTO.getStaffs();
        if(staffIds.isEmpty()){
            assignmentBuildingRepository.deleteByBuildingEntity_IdIn(Collections.singletonList(buildingId));
        }
        else{
            // xóa tất cả tòa nhà cũ trước
            assignmentBuildingRepository.deleteByBuildingEntity_IdIn(Collections.singletonList(buildingId));

            // bắt ngoại lệ khi tìm buildingid mà không thấy
            BuildingEntity buildingEntity = buildingRepository.findById(buildingId).orElseThrow(() -> new EntityNotFoundException("Không tìm thấy tòa nhà có id: " + buildingId));

            // lấy toàn bộ entity để save
            List<AssignmentBuildingEntity> assignmentBuildingEntityList = staffIds.stream().map(staffId -> {
                AssignmentBuildingEntity assignmentBuildingEntity = new AssignmentBuildingEntity();
                assignmentBuildingEntity.setUserEntity(userRepository.findById(staffId).orElseThrow(() -> new EntityNotFoundException("Không tìm thấy user có id: " + staffId)));
                assignmentBuildingEntity.setBuildingEntity(buildingEntity);
                return assignmentBuildingEntity;
            }).collect(Collectors.toList());

            //thêm mới lại
            assignmentBuildingRepository.saveAll(assignmentBuildingEntityList);
        }
    }
}
