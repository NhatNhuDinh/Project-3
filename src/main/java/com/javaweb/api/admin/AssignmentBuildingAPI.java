package com.javaweb.api.admin;

import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.IAssigmentBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

@RestController
@RequestMapping("/api/assignments")
public class AssignmentBuildingAPI {

    @Autowired
    private IAssigmentBuildingService assigmentBuildingService;

    @PostMapping()
    public ResponseEntity<ResponseDTO> assignStaff(@Valid @RequestBody AssignmentBuildingDTO assignmentBuildingDTO) {
        assigmentBuildingService.assignStaff(assignmentBuildingDTO);
        ResponseDTO responseDTO = new ResponseDTO();
        responseDTO.setMessage("Success");
        return ResponseEntity.ok(responseDTO);
    }
}
