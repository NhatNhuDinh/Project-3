package com.javaweb.service.impl;

import com.javaweb.converter.CustomerConverter;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.enums.Status;
import com.javaweb.exception.DuplicatePhoneNumberException;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.service.ICustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CustomerServiceImpl implements ICustomerService {

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private CustomerConverter customerConverter;

    @Override
    public Page<CustomerSearchResponse> findAll(CustomerSearchRequest customerSearchRequest, Pageable pageable) {
        return customerRepository.findByCustomerSearchRequest(customerSearchRequest, pageable)
                .map(customerEntity -> {
                    CustomerSearchResponse response = new CustomerSearchResponse();
                    response.setId(customerEntity.getId());
                    response.setName(customerEntity.getFullName());
                    response.setCustomerPhone(customerEntity.getPhone());
                    response.setEmail(customerEntity.getEmail());
                    response.setDemand(customerEntity.getDemand());
                    response.setCreatedBy(String.valueOf(customerEntity.getCreatedBy()));
                    response.setCreatedDate(customerEntity.getCreatedDate());
                    response.setStatus(customerEntity.getStatus());
                    response.setCreatedBy(String.valueOf(customerEntity.getCreatedBy()));
                    response.setCreatedBy(String.valueOf(customerEntity.getCreatedBy()));
                    return response;
                });
    }

    @Override
    public void addCustomer(CustomerDTO customerDTO) {
        if(customerRepository.findByPhone(customerDTO.getCustomerPhone().trim()) != null){
            throw new DuplicatePhoneNumberException("Số điện thoại đã tồn tại trong hệ thống");
        }
        CustomerEntity customerEntity = customerConverter.toEntity(customerDTO);
        customerRepository.save(customerEntity);
    }

    @Override
    public void updateCustomer(CustomerDTO customerDTO) {
        addCustomer(customerDTO);
    }

    @Override
    public void deleteCustomers(List<Long> ids) {
        List<CustomerEntity> customerEntities = customerRepository.findAllByIdInAndIsActive(ids, 1L);
        for (CustomerEntity customerEntity : customerEntities) {
            customerEntity.setIsActive(0L);
        }
        customerRepository.saveAll(customerEntities);
    }

    @Override
    public CustomerDTO findCustomerById(Long id) {
        CustomerEntity customerEntity = customerRepository.findById(id).orElse(null);
        CustomerDTO customerDTO = new CustomerDTO();
        customerDTO.setId(customerEntity.getId());
        customerDTO.setName(customerEntity.getFullName());
        customerDTO.setCustomerPhone(customerEntity.getPhone());
        customerDTO.setEmail(customerEntity.getEmail());
        customerDTO.setDemand(customerEntity.getDemand());
        customerDTO.setStatus(Status.getEnumNameByStatusName(customerEntity.getStatus()));
        customerDTO.setCompanyName(customerEntity.getCompanyName());
        return customerDTO;
    }
}
