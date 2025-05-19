package com.javaweb.service.impl;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.converter.BuildingConverter;
import com.javaweb.converter.BuildingSearchBuilderConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.service.IBuildingService;
import com.javaweb.utils.UploadFileUtils;
import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.security.acls.model.NotFoundException;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.io.File;
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



    @Override
    public List<BuildingSearchResponse> findAll(BuildingSearchRequest buildingSearchRequest, Pageable pageable) {
        BuildingSearchBuilder buildingSearchBuilder = buildingSearchBuilderConverter.toBuildingSearchBuilder(buildingSearchRequest);
        List<BuildingEntity> buildingEntityList = buildingRepository.getAll(buildingSearchBuilder, pageable);
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
        return buildingConverter.toBuildingDTO(buildingEntity);
    }

    @Override
    public BuildingEntity create(BuildingDTO buildingDTO) {
        BuildingEntity buildingEntity = buildingConverter.toBuildingEntity(buildingDTO);
        Long buildingId = buildingDTO.getId();
        if (buildingId != null) { // update
            BuildingEntity foundBuilding = buildingRepository.findById(buildingId)
                    .orElseThrow(() -> new NotFoundException("Building not found!"));
            buildingEntity.setImage(foundBuilding.getImage());
        }
        saveThumbnail(buildingDTO, buildingEntity);
        buildingRepository.save(buildingEntity);
        return buildingEntity;
    }

    @Override
    public BuildingEntity update(BuildingDTO buildingDTO) {
        return create(buildingDTO);
    }

    @Override
    public void deleteAll(String ids) {
        List<Long> idList = Arrays.stream(ids.split(",")).map(Long::parseLong).collect(Collectors.toList());
        buildingRepository.deleteAllByIdIn(idList);
    }

    @Override
    public int countTotalSearch(BuildingSearchRequest buildingSearchRequest) {
        BuildingSearchBuilder buildingSearchBuilder = buildingSearchBuilderConverter.toBuildingSearchBuilder(buildingSearchRequest);
        return buildingRepository.countTotalSearch(buildingSearchBuilder);
    }


    private void saveThumbnail(BuildingDTO buildingDTO, BuildingEntity buildingEntity) {
        if(buildingDTO.getImageName() != null){
            String path = "/building/" +  buildingDTO.getImageName().replaceAll("\\s+", "-");
            if (null != buildingDTO.getImageBase64()) {
                if (null != buildingEntity.getImage()) {
                    if (!path.equals(buildingEntity.getImage())) {
                        File file = new File("C://home/office" + buildingEntity.getImage());
                        file.delete();
                    }
                }
                byte[] bytes = Base64.decodeBase64(buildingDTO.getImageBase64().getBytes());
                UploadFileUtils uploadFileUtils = new UploadFileUtils();
                uploadFileUtils.writeOrUpdate(path, bytes);
                buildingEntity.setImage(path);
            }
        }

    }

}
