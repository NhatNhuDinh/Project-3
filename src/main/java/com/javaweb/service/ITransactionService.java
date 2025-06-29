package com.javaweb.service;


import com.javaweb.model.dto.TransactionDTO;

import java.util.List;

public interface ITransactionService {
    void createTransaction(TransactionDTO transactionDTO);
    List<TransactionDTO> getAllTransactionByCodeAndCustomer(String code, Long customerId);
    TransactionDTO getTransactionById(Long id);
    void deleteTransaction(Long id);
}
