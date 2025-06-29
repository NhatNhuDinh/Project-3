package com.javaweb.service.impl;

import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.TransactionRepository;
import com.javaweb.service.ITransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;


@Service
public class TransactionService implements ITransactionService {


    @Autowired
    private TransactionRepository transactionRepository;

    @Autowired
    private CustomerRepository customerRepository;

    @Override
    public void createTransaction(TransactionDTO transactionDTO) {
        TransactionEntity transactionEntity = new TransactionEntity();
        transactionEntity.setId(transactionDTO.getTransactionId());
        transactionEntity.setCustomerEntity(customerRepository.findById(transactionDTO.getCustomerId()).get());
        transactionEntity.setNote(transactionDTO.getTransactionDetail());
        transactionEntity.setCode(transactionDTO.getTransactionCode());
        transactionRepository.save(transactionEntity);
    }

   @Override
   public List<TransactionDTO> getAllTransactionByCodeAndCustomer(String code, Long customerId) {
       return transactionRepository.findAllByCodeAndCustomerEntity_Id(code, customerId)
               .stream()
               .map(this::toDTO)
               .collect(Collectors.toList());
   }

   @Override
   public TransactionDTO getTransactionById(Long id) {
       return transactionRepository.findById(id)
               .map(this::toDTO)
               .orElse(null);
   }

    @Override
    public void deleteTransaction(Long id) {
        transactionRepository.deleteById(id);
    }

    private TransactionDTO toDTO(TransactionEntity entity) {
       TransactionDTO dto = new TransactionDTO();
       dto.setTransactionId(entity.getId());
       dto.setCustomerId(entity.getCustomerEntity().getId());
       dto.setTransactionDetail(entity.getNote());
       dto.setTransactionCode(entity.getCode());
       dto.setCreatedDate(entity.getCreatedDate());
       dto.setCreatedBy(entity.getCreatedBy());
       dto.setModifiedDate(entity.getModifiedDate());
       dto.setModifiedBy(entity.getModifiedBy());
       return dto;
   }


}
