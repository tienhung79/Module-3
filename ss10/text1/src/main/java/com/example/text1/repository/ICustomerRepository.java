package com.example.text1.repository;

import com.example.text1.Model.Customer;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> findAll();
    void addCustomer(Customer customer);
}
