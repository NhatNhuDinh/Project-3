package com.javaweb.api.admin;

import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.service.ITransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping("/api/transactions")
public class TransactionAPI {

    @Autowired
    private ITransactionService transactionService;

    @PostMapping()
    public ResponseEntity<ResponseDTO> createCustomer(@Valid @RequestBody TransactionDTO transactionDTO) {
        ResponseDTO responseDTO = new ResponseDTO();
        transactionService.createTransaction(transactionDTO);
        responseDTO.setMessage("Success");
        return ResponseEntity.ok(responseDTO);
    }

    @GetMapping("/{id}")
    public ResponseEntity<ResponseDTO> getTransaction(@PathVariable Long id) {
        TransactionDTO transactionDTO = transactionService.getTransactionById(id);
        ResponseDTO responseDTO = new ResponseDTO();
        responseDTO.setMessage("Success");
        responseDTO.setData(transactionDTO);
        return ResponseEntity.ok(responseDTO);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<ResponseDTO> deleteBuildings(@PathVariable Long id) {
        ResponseDTO responseDTO = new ResponseDTO();
        transactionService.deleteTransaction(id);
        responseDTO.setMessage("Success");
        return ResponseEntity.ok(responseDTO);
    }
}
