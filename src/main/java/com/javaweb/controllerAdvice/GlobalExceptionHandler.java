package com.javaweb.controllerAdvice;


import com.javaweb.exception.DuplicatePhoneNumberException;
import com.javaweb.model.response.ResponseDTO;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.persistence.EntityNotFoundException;
import java.util.List;
import java.util.stream.Collectors;

@RestControllerAdvice
public class GlobalExceptionHandler {

    // validate request data
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<ResponseDTO> handleValidationException(MethodArgumentNotValidException mex){
        List<String> errors = mex.getBindingResult().getFieldErrors().stream().map(FieldError::getDefaultMessage).collect(Collectors.toList());
        ResponseDTO responseDTO = new ResponseDTO();
        responseDTO.setMessage("Validation Error");
        responseDTO.setData(errors);
        return ResponseEntity.badRequest().body(responseDTO);
    }

    // validate left server error
    @ExceptionHandler(Exception.class)
    public ResponseEntity<ResponseDTO> handleException(Exception e){
        ResponseDTO responseDTO = new ResponseDTO();
        responseDTO.setMessage("Internal Server Error");
        responseDTO.setData(e.getMessage());
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(responseDTO);
    }

    @ExceptionHandler(EntityNotFoundException.class)
    public ResponseEntity<ResponseDTO> handleNotFound(EntityNotFoundException ex) {
        ResponseDTO responseDTO = new ResponseDTO();
        responseDTO.setMessage("Not found");
        responseDTO.setData(ex.getMessage());
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(responseDTO);
    }

    @ExceptionHandler(DuplicatePhoneNumberException.class)
    public ResponseEntity<ResponseDTO> handleNotFound(DuplicatePhoneNumberException ex) {
        ResponseDTO responseDTO = new ResponseDTO();
        responseDTO.setMessage("Bad request");
        responseDTO.setData(ex.getMessage());
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(responseDTO);
    }


}
