package com.javaweb.service.impl;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.converter.BuildingConverter;
import com.javaweb.converter.BuildingSearchBuilderConverter;
import com.javaweb.entity.AssignmentBuildingEntity;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.AssignmentBuildingRepository;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.IBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;
import javax.transaction.Transactional;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@Transactional
public class BuildingService implements IBuildingService {


    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private RentAreaService rentAreaService;

    @Autowired
    private RentAreaRepository rentAreaRepository;

    @Autowired
    private BuildingSearchBuilderConverter buildingSearchBuilderConverter;

    @Autowired
    private BuildingConverter buildingConverter;

    @Autowired
    private AssignmentBuildingRepository assignmentBuildingRepository;

    @Autowired
    private UserRepository userRepository;

    @Override
    public List<BuildingSearchResponse> findAll(BuildingSearchRequest buildingSearchRequest) {
        BuildingSearchBuilder buildingSearchBuilder = buildingSearchBuilderConverter.toBuildingSearchBuilder(buildingSearchRequest);
        List<BuildingEntity> buildingEntityList = buildingRepository.getAll(buildingSearchBuilder);
        List<BuildingSearchResponse> responseList = buildingEntityList.stream().map(buildingConverter::toBuildingSearchResponse).collect(Collectors.toList());
        return responseList;
    }

    @Override
    public BuildingDTO findById(Long id) {
        BuildingEntity buildingEntity = buildingRepository.findById(id).get();
        BuildingDTO buildingDTO = buildingConverter.toBuildingDTO(buildingEntity);
        return buildingDTO;
    }

    @Override
    public BuildingEntity createOrUpdate(BuildingDTO buildingDTO) {
        BuildingEntity buildingEntity = buildingConverter.toBuildingEntity(buildingDTO);
        // update
        if (buildingEntity.getId() != null) {
            rentAreaService.deleteAllByBuildingId(buildingEntity.getId());
            rentAreaService.saveAll(buildingEntity, buildingDTO.getRentArea());
            buildingRepository.save(buildingEntity);
        } else {
            //create
            buildingRepository.save(buildingEntity);
            rentAreaService.saveAll(buildingEntity, buildingDTO.getRentArea());
        }

        return buildingEntity;
    }

    @Override
    public void deleteAll(String ids) {
        List<Long> idList = Arrays.stream(ids.split(",")).map(Long::parseLong).collect(Collectors.toList());
        assignmentBuildingRepository.deleteByBuildingEntity_IdIn(idList);
        rentAreaRepository.deleteByBuildingEntity_IdIn(idList);
        buildingRepository.deleteAllByIdIn(idList);
    }

    @Override
    public List<StaffResponseDTO> staffList(Long buildingId) {
        List<UserEntity> allStaff = userRepository.findByStatusAndRoles_Code(1, "STAFF");
        List<UserEntity> assignedStaff = userRepository.findByStatusAndRoles_CodeAndAssignmentBuildingEntityList_BuildingEntity_Id(1, "STAFF", buildingId);
        return allStaff.stream()
                .map(staff -> {
                    StaffResponseDTO staffResponseDTO = new StaffResponseDTO();
                    staffResponseDTO.setStaffId(staff.getId());
                    staffResponseDTO.setFullName(staff.getFullName());
                    if (assignedStaff.contains(staff)) {
                        staffResponseDTO.setChecked("checked");
                    }
                    return staffResponseDTO;
                }).collect(Collectors.toList());
    }

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
