package com.javaweb.api.admin;

import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.service.ICustomerService;
import com.javaweb.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping("/api/customers")
public class CustomerAPI {

    @Autowired
    private ICustomerService customerService;

    @Autowired
    private IUserService userService;

    @PostMapping()
    public ResponseEntity<ResponseDTO> createCustomer(@Valid @RequestBody CustomerDTO customerDTO) {
        ResponseDTO responseDTO = new ResponseDTO();
        customerService.addCustomer(customerDTO);
        responseDTO.setMessage("Success");
        return ResponseEntity.ok(responseDTO);
    }

    @PutMapping()
    public ResponseEntity<ResponseDTO> updateBuilding(@Valid @RequestBody CustomerDTO customerDTO) {
        ResponseDTO responseDTO = new ResponseDTO();
        customerService.updateCustomer(customerDTO);
        responseDTO.setMessage("Success");
        return ResponseEntity.ok(responseDTO);
    }

    @DeleteMapping("/{ids}")
    public ResponseEntity<ResponseDTO> deleteBuildings(@PathVariable List<Long> ids) {
        ResponseDTO responseDTO = new ResponseDTO();
        customerService.deleteCustomers(ids);
        responseDTO.setMessage("Success");
        return ResponseEntity.ok(responseDTO);
    }

    @GetMapping("/{id}/staffs")
    public ResponseEntity<ResponseDTO> getStaffs(@PathVariable Long id) {
        List<StaffResponseDTO> staffResponseDTOList = userService.staffListForCustomer(id);
        ResponseDTO responseDTO = new ResponseDTO();
        responseDTO.setMessage("Success");
        responseDTO.setData(staffResponseDTOList);
        return ResponseEntity.ok(responseDTO);
    }

}
