package com.javaweb.service;

import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface ICustomerService {
    Page<CustomerSearchResponse> findAll(CustomerSearchRequest customerSearchRequest, Pageable pageable);
    void addCustomer(CustomerDTO customerDTO);
    void updateCustomer(CustomerDTO customerDTO);
    void deleteCustomers(List<Long> ids);
    CustomerDTO findCustomerById(Long id);

}
