package com.javaweb.converter;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.enums.Status;
import com.javaweb.exception.DuplicatePhoneNumberException;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.repository.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CustomerConverter {

    @Autowired
    private CustomerRepository customerRepository;

    public CustomerEntity toEntity(CustomerDTO customerDTO) {
        CustomerEntity customerEntity = (customerDTO.getId() == null)
                ? new CustomerEntity()
                : customerRepository.findById(customerDTO.getId()).orElse(new CustomerEntity());
        customerEntity.setFullName(customerDTO.getName());
        customerEntity.setPhone(customerDTO.getCustomerPhone());
        customerEntity.setEmail(customerDTO.getEmail());
        customerEntity.setDemand(customerDTO.getDemand());
        if(customerDTO.getStatus() == null){
            customerEntity.setStatus(Status.CHUA_XU_LY.getStatusName());
        }
        else{
            customerEntity.setStatus(Status.getType().get(customerDTO.getStatus()));
        }
        customerEntity.setCompanyName(customerDTO.getCompanyName());

        return customerEntity;
    }


}
