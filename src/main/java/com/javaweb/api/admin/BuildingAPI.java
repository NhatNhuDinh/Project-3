package com.javaweb.api.admin;

import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.service.impl.BuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping("/api/buildings")
public class BuildingAPI {

    @Autowired
    private BuildingService buildingService;

    //create or update
    @PostMapping()
    public ResponseEntity<ResponseDTO> createBuilding(@Valid @RequestBody BuildingDTO buildingDTO) {
        ResponseDTO responseDTO = new ResponseDTO();
        responseDTO.setMessage("Success");
        responseDTO.setData(buildingService.createOrUpdate(buildingDTO)); // return Building Entity - Json
        return ResponseEntity.ok(responseDTO);
    }

    @DeleteMapping("/{ids}")
    public ResponseEntity<ResponseDTO> deleteBuildings(@PathVariable String ids) {
        buildingService.deleteAll(ids);
        ResponseDTO responseDTO = new ResponseDTO();
        responseDTO.setMessage("Success");
        return ResponseEntity.ok(responseDTO);
    }

    @GetMapping("/{id}/staffs")
    public ResponseEntity<ResponseDTO> getStaffs(@PathVariable Long id) {
        List<StaffResponseDTO> staffResponseDTOList = buildingService.staffList(id);
        ResponseDTO responseDTO = new ResponseDTO();
        responseDTO.setMessage("Success");
        responseDTO.setData(staffResponseDTOList);
        return ResponseEntity.ok(responseDTO);
    }

    @PostMapping("/assignments")
    public ResponseEntity<ResponseDTO> assignStaff(@RequestBody AssignmentBuildingDTO assignmentBuildingDTO) {
        buildingService.assignStaff(assignmentBuildingDTO);
        ResponseDTO responseDTO = new ResponseDTO();
        responseDTO.setMessage("Success");
        return ResponseEntity.ok(responseDTO);
    }

}
