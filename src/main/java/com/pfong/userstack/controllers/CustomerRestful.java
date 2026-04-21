package com.pfong.userstack.controllers;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.pfong.userstack.dto.MemberResp;
import com.pfong.userstack.repository.CustomerRepository;

@RequestMapping("/app/v1/customers")
@RestController
public class CustomerRestful {

    @Autowired
    private CustomerRepository customerRepository;

    @GetMapping("/findall")
    public List<MemberResp> findAll() {
        return customerRepository.findAll();
    }

    @GetMapping(value = "/findbyid/{id}", produces = "application/json")
    public ResponseEntity<Object> findById(@PathVariable(value = "id", required = true) String id) {
        MemberResp member = customerRepository.findById(id);
        return ResponseEntity.ok(member);
    }

    @PutMapping(value = "/update/{id}", produces = "application/json")
    public ResponseEntity<Object> update(@PathVariable(value = "id") String id, @RequestBody MemberResp entity) {
        customerRepository.findById(id);
        customerRepository.update(entity, id);
        return ResponseEntity.ok("更新成功");
    }

    @DeleteMapping(value = "/delete/{id}", produces = "application/json")
    public ResponseEntity<Object> delete(@PathVariable(value = "id") String id) {
        customerRepository.findById(id);
        customerRepository.delete(id);
        return ResponseEntity.ok("刪除成功");
    }
}
