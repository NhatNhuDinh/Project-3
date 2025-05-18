package com.javaweb.service.impl;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.converter.BuildingConverter;
import com.javaweb.converter.BuildingSearchBuilderConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.UserEntity;
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

import javax.transaction.Transactional;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
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
        responseList.sort(
                Comparator.comparing(
                        BuildingSearchResponse::getCreatedDate,
                        Comparator.nullsLast(Comparator.<Date>reverseOrder())
                )
        );
        return responseList;
    }

    @Override
    public BuildingDTO findById(Long id) {
        BuildingEntity buildingEntity = buildingRepository.findById(id).get();
        BuildingDTO buildingDTO = buildingConverter.toBuildingDTO(buildingEntity);
        return buildingDTO;
    }

    @Override
    public BuildingEntity create(BuildingDTO buildingDTO) {
        BuildingEntity buildingEntity = buildingConverter.toBuildingEntity(buildingDTO);
        buildingRepository.save(buildingEntity);
        rentAreaService.saveAll(buildingEntity, buildingDTO.getRentArea());
        return buildingEntity;
    }

    @Override
    public BuildingEntity update(BuildingDTO buildingDTO) {
        BuildingEntity buildingEntity = buildingConverter.toBuildingEntity(buildingDTO);
        rentAreaService.deleteAllByBuildingId(buildingEntity.getId());
        rentAreaService.saveAll(buildingEntity, buildingDTO.getRentArea());
        buildingRepository.save(buildingEntity);
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
        List<UserEntity> assignedStaff = userRepository.findByStatusAndRoles_CodeAndBuildingEntityList_Id(1, "STAFF", buildingId);
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


}
