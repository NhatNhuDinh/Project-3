package com.javaweb.service.impl;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.IAssignmentCustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;
import java.util.List;
@Service
public class AssignmentCustomerServiceImpl implements IAssignmentCustomerService {

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private UserRepository userRepository;

    @Override
    public void assignStaff(AssignmentCustomerDTO assignmentCustomerDTO) {
        Long customerId = assignmentCustomerDTO.getCustomerId();
        List<Long> staffIds = assignmentCustomerDTO.getStaffs();

        // xoa het trong bang trung gian
        CustomerEntity customer = customerRepository.findById(customerId).orElseThrow(EntityNotFoundException::new);
        customer.getUserEntityList().clear();

        // set lai list staff cho building
        if(!staffIds.isEmpty()){
            List<UserEntity> staffs = userRepository.findByIdIn(staffIds);
            customer.getUserEntityList().addAll(staffs); // su dung setEntityList cung nhu nhau nhung cach nay hieu suat cao hon
        }

        // dong bo lai du lieu
        customerRepository.save(customer);
    }
}
