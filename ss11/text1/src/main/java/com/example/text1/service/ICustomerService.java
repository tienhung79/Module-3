package com.example.text1.service;

import com.example.text1.Model.Customer;

import java.util.List;

public interface ICustomerService {
    List<Customer> disPlay();
    void save(Customer customer);
}
