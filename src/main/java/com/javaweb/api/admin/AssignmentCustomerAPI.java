package com.javaweb.api.admin;

import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.IAssignmentCustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

@RestController
@RequestMapping("/api/customer-assignments")
public class AssignmentCustomerAPI {

    @Autowired
    private IAssignmentCustomerService assignmentCustomerService;

    @PostMapping()
    public ResponseEntity<ResponseDTO> assignStaff(@Valid @RequestBody AssignmentCustomerDTO assignmentCustomerDTO) {
        assignmentCustomerService.assignStaff(assignmentCustomerDTO);
        ResponseDTO responseDTO = new ResponseDTO();
        responseDTO.setMessage("Success");
        return ResponseEntity.ok(responseDTO);
    }
}
