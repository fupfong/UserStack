package com.pfong.userstack.controllers;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import com.pfong.userstack.entity.Message;
import com.pfong.userstack.fiflter.ResourceNotFoundException;

@RestControllerAdvice
public class GlobalExceptionHandler {
    @ExceptionHandler(ResourceNotFoundException.class)
    public ResponseEntity<Message> handleNotFound(ResourceNotFoundException ex) {
        Message msg = new Message();
        msg.setMessage(ex.getMessage());
        msg.setCode(404);
        return ResponseEntity.status(404).body(msg);
    }
}
